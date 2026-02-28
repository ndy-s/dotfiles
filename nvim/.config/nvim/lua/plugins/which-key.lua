return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.icons",
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		-- {
		--   "<leader>?",
		--   function()
		--     require("which-key").show({ global = false })
		--   end,
		--   desc = "Buffer Local Keymaps (which-key)",
		-- },
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "Code Commands" },
			{ "<leader>d", group = "Debugger (DAP)" },
			{ "<leader>g", group = "Code Navigation (LSP GoTo)" },
			{ "<leader>G", group = "Git" },
			{ "<leader>h", group = "Harpoon (File Marks)" },
			{ "<leader>s", group = "Telescope (Search)" },
			{ "<leader>t", group = "Test Runner" },
			{ "<leader>w", group = "Window Management" },
		})

		require("mini.icons").setup()
	end,
}
