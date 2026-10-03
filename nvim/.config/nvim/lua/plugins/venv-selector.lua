return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    opts = {
        options = {
            -- noice.nvim already owns vim.notify; don't let venv-selector replace it
            override_notify = false,
        },
    },
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python VirtualEnv" },
    },
}
