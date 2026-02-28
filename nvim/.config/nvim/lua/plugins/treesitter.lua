return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"bash", "lua", "javascript", "typescript", "php", "java",
					"html", "css", "scss", "json", "graphql",
					"markdown", "markdown_inline", "vimdoc",
					"gitignore", "query", "regex", "comment", "vim",
				},
				sync_install = false,
				auto_install = true,
				indent = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end,
	},
	{
		"EmranMR/tree-sitter-blade",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "blade",
		config = function()
			vim.treesitter.language.register("blade", "blade")
		end,
	},
}

