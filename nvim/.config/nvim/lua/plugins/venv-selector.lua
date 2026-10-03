return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    opts = {
        dap_enabled = true,
    },
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python VirtualEnv" },
    },
}
