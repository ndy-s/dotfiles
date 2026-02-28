return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
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
                    require("telescope.themes").get_dropdown({}),
                },
            },
            defaults = {
                preview = {
                    treesitter = false,
                },
                file_ignore_patterns = {
                    "^target/",
                    "/target/",
                },
            },
        })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search text (live grep)" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search open buffers" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files(themes.get_ivy({ cwd = vim.fn.stdpath("config") }))
        end, { desc = "Search Neovim config files" })
        vim.keymap.set("n", "<leader>sp", function()
            builtin.find_files(themes.get_ivy({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }))
        end, { desc = "Search lazy plugins" })
    end,
}

