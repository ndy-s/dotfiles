return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    keys = {
        {
            "<leader>cf",
            function()
                vim.lsp.buf.format({ async = true })
            end,
            desc = "Format buffer using none-ls",
        },
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Text
                null_ls.builtins.completion.spell,

                -- Sh, Bash
                null_ls.builtins.formatting.shfmt,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- JS, TS
                require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim

                -- PHP, Blade
                -- null_ls.builtins.diagnostics.phpstan,
                null_ls.builtins.formatting.pint,
                null_ls.builtins.formatting.blade_formatter,
            },
        })
    end,
}
