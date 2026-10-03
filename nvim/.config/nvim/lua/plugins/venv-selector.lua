return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    opts = {
        dap_enabled = true,
        -- noice.nvim already owns vim.notify; don't let venv-selector replace it
        override_notify = false,
    },
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python VirtualEnv" },
    },
}
