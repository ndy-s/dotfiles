return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", -- Suggests words from the current file
            "hrsh7th/cmp-path", -- Suggests filesystem paths completion
            "hrsh7th/cmp-nvim-lua", -- Neovim lua API completion
            "hrsh7th/cmp-nvim-lsp", -- LSP completion from language servers

            -- Autocompletion formatting
            "onsails/lspkind.nvim",

            -- Snippets engine
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip", -- LuaSnip integration for nvim-cmp
            "rafamadriz/friendly-snippets", -- Predefined snippets for multiple languages
        },
        config = function()
            -- Set up nvim-cmp.
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    -- { name = "vsnip" }, -- For vsnip users.
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        -- mode = "symbol", -- show only symbol annotations
                        with_text = true,
                        menu = {
                            buffer = "[buf]",
                            path = "[path]",
                            nvim_lua = "[api]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[snip]",
                        },
                        maxwidth = {
                            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                            -- can also be a function to dynamically calculate max width such as
                            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                            menu = 100, -- leading text (labelDetails)
                            abbr = 100, -- actual suggestion item
                        },
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(entry, vim_item)
                            -- ...
                            return vim_item
                        end,
                    }),
                },
                experimental = {
                    ghost_text = true,
                }
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
    			sources = cmp.config.sources({
      				{ name = 'git' },
    			}, {
      				{ name = 'buffer' },
    			})
			})
 			require("cmp_git").setup() ]]

            cmp.setup.filetype({ "sql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                }
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            -- cmp.setup.cmdline({ "/", "?" }, {
            -- 	mapping = cmp.mapping.preset.cmdline(),
            -- 	sources = {
            -- 		{ name = "buffer" },
            -- 	},
            -- })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            -- cmp.setup.cmdline(":", {
            -- 	mapping = cmp.mapping.preset.cmdline(),
            -- 	sources = cmp.config.sources({
            -- 		{ name = "path" },
            -- 	}, {
            -- 		{ name = "cmdline" },
            -- 	}),
            -- 	matching = { disallow_symbol_nonprefix_matching = false },
            -- })

            -- Set up lspconfig.
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
            -- 	capabilities = capabilities,
            -- })
        end,
    },
}
