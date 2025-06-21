return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = {
        { "echasnovski/mini.icons",     opts = {} },
        { "nvim-tree/nvim-web-devicons" },
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
        local oil = require("oil")

        oil.setup({
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", function()
            oil.open()

            -- Wait until Oil has fully loaded
            vim.wait(1000, function()
                return require("oil").get_cursor_entry() ~= nil
            end)
            -- Open the preview window
            -- require("oil").open_preview()
        end, { desc = "Open Oil with preview" })
    end,
}
