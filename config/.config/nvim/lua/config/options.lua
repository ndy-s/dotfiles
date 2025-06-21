-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Leader keys (set early)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Indentation
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.termguicolors = true         -- Enable true color
vim.opt.title = true                 -- Show file title in window
vim.opt.cmdheight = 0                -- Hide command line when not in use
vim.opt.laststatus = 0               -- Hide statusline when only one window
vim.opt.showcmd = true               -- Show (partial) command in status line
vim.opt.colorcolumn = "80"           -- Vertical line at column 80

-- Search
vim.opt.hlsearch = false             -- Don't persist search highlights
vim.opt.incsearch = true             -- Incremental search
vim.opt.ignorecase = true            -- Ignore case when searching
vim.opt.smartcase = true             -- Case-sensitive if uppercase is used
vim.opt.inccommand = "split"         -- Preview substitutions

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true             -- Convert tabs to spaces

-- Scrolling
vim.opt.scrolloff = 10               -- Keep 10 lines visible above/below
vim.opt.splitbelow = true            -- Horizontal splits open below
vim.opt.splitright = true            -- Vertical splits open to the right
vim.opt.splitkeep = "cursor"         -- Keep cursor position when splitting

-- File & Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Misc
vim.opt.wrap = true                  -- Enable line wrap
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.mouse = ""                   -- Disable mouse
vim.opt.isfname:append("@-@")        -- Allow '@' in filenames
vim.opt.updatetime = 50              -- Faster completion & diagnostics
vim.opt.path:append("**")            -- Search recursively
vim.opt.wildignore:append("*/node_modules/*") -- Ignore node_modules

-- Format
vim.opt.formatoptions:append("r")    -- Continue comments with `*`

-- File Types
vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
