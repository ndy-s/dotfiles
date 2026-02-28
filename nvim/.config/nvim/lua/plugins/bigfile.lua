return {
    "LunarVim/bigfile.nvim",
    config = function()
        require("bigfile").setup({
            -- max_filesize is in megabytes, so 0.1 MB = 100 KB
            max_filesize = 0.1,
            features = {
                "lsp", "treesitter", "indent_blankline", "syntax", "matchparen",
            },
        })
    end
}
