-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Auto clean broken lazy.nvim plugins
local lazy_path = vim.fn.stdpath("data") .. "/lazy"

local function clean_broken_plugins()
    local uv = vim.loop
    local handle = uv.fs_scandir(lazy_path)
    if not handle then return end

    while true do
        local name, t = uv.fs_scandir_next(handle)
        if not name then break end

        local full = lazy_path .. "/" .. name
        local stat = uv.fs_stat(full)

        -- If it exists but is not a directory, remove it
        if stat and stat.type ~= "directory" then
            print("Removing broken plugin folder: " .. full)
            vim.fn.delete(full, "rf")
        end
    end
end

clean_broken_plugins()

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
