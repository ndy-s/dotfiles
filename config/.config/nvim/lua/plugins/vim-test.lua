return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		{ "<leader>tt", ":TestNearest<CR>", desc = "Run nearest test", silent = true },
		{ "<leader>tT", ":TestFile<CR>", desc = "Run all tests in the file", silent = true },
		{ "<leader>ta", ":TestSuite<CR>", desc = "Run entire test suite", silent = true },
		{ "<leader>tl", ":TestLast<CR>", desc = "Re-run last test", silent = true },
		{ "<leader>tg", ":TestVisit<CR>", desc = "Go to last test file", silent = true },
	},
	config = function()
		-- make test commands execute using dispatch.vim
		vim.g["test#strategy"] = "vimux"
	end,
}
