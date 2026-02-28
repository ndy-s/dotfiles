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
                    "pyright",
                    "gopls",
                },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
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
                    "black",
                    "ruff",
                    "gopls",
                    "goimports",
                    "golangci-lint",
                    "mypy",
                },
                auto_update = true,
                run_on_start = true,
                start_delay = 3000,
                debounce_hours = 5,
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
            { "K", function() vim.lsp.buf.hover() end, mode = "n", desc = "LSP Hover" },
            { "<leader>gd", function() vim.lsp.buf.definition() end, mode = "n", desc = "Go to Definition" },
            { "<leader>gr", function() vim.lsp.buf.references() end, mode = "n", desc = "Find References" },
            { "<leader>ca", function() vim.lsp.buf.code_action() end, mode = { "n", "v" }, desc = "Trigger Code Actions" },
            { "<leader>cd", function() vim.diagnostic.open_float() end, mode = "n", desc = "Show Code diagnostics" },
            {
                "<leader>ci",
                function()
                    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
                    vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
                end,
                mode = "n",
                desc = "Toggle Inlay Hints"
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("*", {
                capabilities = cmp_capabilities,
                flags = {
                    debounce_text_changes = 150,
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        hint = { enable = true },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            vim.lsp.config("ts_ls", {
                init_options = {
                    preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            })

            vim.lsp.config("phpactor", {
                init_options = {
                    ["language_server_phpstan.enabled"] = true,
                    ["language_server_psalm.enabled"] = true,
                },
                root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
            })

            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            nilness = true,
                            unusedwrite = true,
                            shadow = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            })

            for _, server in ipairs({
                "lemminx",
                "bashls",
                "html",
                "cssls",
                "tailwindcss",
                "pyright",
            }) do
                vim.lsp.config(server, {})
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

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                opts.max_width = opts.max_width or 80
                opts.min_width = opts.min_width or 1
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },
}

