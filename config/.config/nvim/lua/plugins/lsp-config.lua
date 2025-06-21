return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- LSP servers
                ensure_installed = {
                    "lemminx",
                    "bashls",
                    "lua_ls",
                    "ts_ls",
                    "phpactor",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "jdtls",
                },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({

                -- a list of all tools you want to ensure are installed upon
                -- start
                -- non-LSP tools
                ensure_installed = {

                    -- you can pin a tool to a particular version
                    -- { 'golangci-lint', version = 'v1.47.0' },

                    -- you can turn off/on auto_update per tool
                    -- { 'bash-language-server', auto_update = true },

                    -- you can do conditional installing
                    -- { 'gopls', condition = function() return not os.execute("go version") end },
                    "shfmt",
                    "shellcheck",
                    "stylua",
                    "luacheck",
                    "eslint_d",
                    "pint",
                    "phpstan",
                    "psalm",
                    "php-debug-adapter",
                    "blade-formatter",
                    "google-java-format",
                    "java-debug-adapter",
                    "java-test",
                },

                -- if set to true this will check each tool for updates. If updates
                -- are available the tool will be updated. This setting does not
                -- affect :MasonToolsUpdate or :MasonToolsInstall.
                -- Default: false
                auto_update = true,

                -- automatically install / update on startup. If set to false nothing
                -- will happen on startup. You can use :MasonToolsInstall or
                -- :MasonToolsUpdate to install tools and check for updates.
                -- Default: true
                run_on_start = true,

                -- set a delay (in ms) before the installation starts. This is only
                -- effective if run_on_start is set to true.
                -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
                -- Default: 0
                start_delay = 3000, -- 3 second delay

                -- Only attempt to install if 'debounce_hours' number of hours has
                -- elapsed since the last time Neovim was started. This stores a
                -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
                -- This is only relevant when you are using 'run_on_start'. It has no
                -- effect when running manually via ':MasonToolsInstall' etc....
                -- Default: nil
                debounce_hours = 5, -- at least 5 hours between attempts to install/update

                -- By default all integrations are enabled. If you turn on an integration
                -- and you have the required module(s) installed this means you can use
                -- alternative names, supplied by the modules, for the thing that you want
                -- to install. If you turn off the integration (by setting it to false) you
                -- cannot use these alternative names. It also suppresses loading of those
                -- module(s) (assuming any are installed) which is sometimes wanted when
                -- doing lazy loading.
                integrations = {
                    ["mason-lspconfig"] = true,
                    ["mason-null-ls"] = true,
                    ["mason-nvim-dap"] = true,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "mfussenegger/nvim-jdtls",
        },
        keys = {
            { "K", vim.lsp.buf.hover, mode = "n", desc = "LSP Hover" },
            {
                "<leader>gd",
                vim.lsp.buf.definition,
                mode = "n",
                desc = "Go to Definition",
            },
            {
                "<leader>gr",
                vim.lsp.buf.references,
                mode = "n",
                desc = "Find References",
            },
            {
                "<leader>ca",
                vim.lsp.buf.code_action,
                mode = { "n", "v" },
                desc = "Trigger Code Actions",
            },
            {
                "<leader>cd",
                vim.diagnostic.open_float,
                mode = "n",
                desc = "Show Code diagnostics",
            },
            {
                "<leader>ci",
                function()
                    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
                    vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
                end,
                mode = "n",
                desc = "Toggle Inlay Hints"
            }
        },
        config = function()
            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            local lspconfig = require("lspconfig")
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- List all LSP servers
            local servers = {
                "lemminx",
                "bashls",
                "lua_ls",
                "ts_ls",
                "phpactor",
                "html",
                "cssls",
                "tailwindcss",
                -- "jdtls", -- Already started using autocmd
            }

            -- General handler for all listed servers
            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = cmp_capabilities,
                }

                -- Per-server customization
                if server == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            hint = {
                                enable = true, -- Enable inlay hints
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                end

                if server == "ts_ls" then
                    opts.init_options = {
                        preferences = {
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    }
                end

                if server == "phpactor" then
                    opts.init_options = {
                        ["language_server_phpstan.enabled"] = true,
                        ["language_server_psalm.enabled"] = true,
                    }

                    opts.root_dir = function(fname)
                        return lspconfig.util.root_pattern("composer.json", ".git")(fname)
                    end
                end

                lspconfig[server].setup(opts)
            end

            local border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335", blend = 0 })
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#565f89", bg = "#1f2335" })

            -- To instead override globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },
}
