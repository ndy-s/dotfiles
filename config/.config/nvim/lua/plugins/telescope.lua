return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = false,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                },
            },
            defaults = {
                file_ignore_patterns = {
                    "^target/", -- target at project root
                    "/target/", -- target as subdirectory
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        -- Telescope Keymaps (Grouped under <leader>s for Search)
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search text (live grep)" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search open buffers" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })
        vim.keymap.set("n", "<leader>sn", function()
            local opts = themes.get_ivy({
                cwd = vim.fn.stdpath("config"),
            })
            builtin.find_files(opts)
        end, { desc = "Search Neovim config files" })
        vim.keymap.set("n", "<leader>sp", function()
            local opts = themes.get_ivy({
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
            })
            builtin.find_files(opts)
        end, { desc = "Search lazy plugins" })
    end,
}
