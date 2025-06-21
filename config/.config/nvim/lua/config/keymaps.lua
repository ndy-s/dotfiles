local keymap = vim.keymap

-- Editing
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" }) -- Note: may conflict with increment
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Search and Replace
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor" })

-- File Permissions
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- Move selected lines in Visual Mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Navigate vim panes better
keymap.set("n", "<C-k>", ":wincmd k<CR>")
keymap.set("n", "<C-j>", ":wincmd j<CR>")
keymap.set("n", "<C-h>", ":wincmd h<CR>")
keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Split Windows
keymap.set("n", "<leader>ws", ":split<CR>", { desc = "Horizontal Split" })
keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical Split" })

-- Resize Windows
keymap.set("n", "<leader>wrh", ":vertical resize -5<CR>", { desc = "Shrink window width ←" })
keymap.set("n", "<leader>wrl", ":vertical resize +5<CR>", { desc = "Grow window width →" })
keymap.set("n", "<leader>wrk", ":resize +2<CR>", { desc = "Grow window height ↑" })
keymap.set("n", "<leader>wrj", ":resize -2<CR>", { desc = "Shrink window height ↓" })

-- Navigation
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

-- Move (swap)
keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move window to left" })
keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move window to bottom" })
keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move window to top" })
keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move window to right" })

-- Arrow Key Warning
local message = "Avoid using arrow keys—use hjkl for efficiency."

local function dramatic_warning()
    vim.api.nvim_echo({ { message, "WarningMsg" } }, false, {})
end

keymap.set({ "n", "i", "v" }, "<Up>", dramatic_warning)
keymap.set({ "n", "i", "v" }, "<Down>", dramatic_warning)
keymap.set({ "n", "i", "v" }, "<Left>", dramatic_warning)
keymap.set({ "n", "i", "v" }, "<Right>", dramatic_warning)
