return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup({
                filetypes = {
                    "*",
                },
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = false,
                    RRGGBBAA = true,
                    hsl_fn = true,
                    css = true,
                },
            })
        end,
    },
}


