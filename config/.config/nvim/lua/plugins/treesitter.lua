return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					-- Core & Scripting Languages
					"bash",
					"lua",
					"javascript",
					"typescript",
					"php",
					"java",

					-- Web Development
					"html",
					"css",
					"scss",
					"blade",

					-- Data Formats
					"json",
					"graphql",

					-- Documentation & Markup
					"markdown",
					"markdown_inline",
					"vimdoc",
					"javadoc",

					-- Version Control & Config Files
					"gitignore",

					-- Treesitter-Specific Languages
					"query",
					"regex",
					"comment",

					-- Neovim-Specific
					"vim",
					"http",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
				auto_install = true,

				indent = {
					enable = true,
				},

				matchup = {
					enable = true,
				},

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					disable = function(lang, bufnr)
						local max_filesize = 100 * 1024
						local filename = vim.api.nvim_buf_get_name(bufnr)
						local ok, stats = pcall(vim.loop.fs_stat, filename)
						if not ok or not stats or stats.size <= max_filesize then
							return false
						end

						-- only notify once per buffer
						if not vim.b[bufnr].large_file_warned then
							vim.b[bufnr].large_file_warned = true
							vim.schedule(function()
								vim.notify(
									("Treesitter disabled for %s (%.1f KB)"):format(
										vim.fn.fnamemodify(filename, ":."),
										stats.size / 1024
									),
									vim.log.levels.WARN,
									{ title = "Performance Warning" }
								)
							end)
						end

						return true
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = { "markdown" },
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
		end,
	},
}
