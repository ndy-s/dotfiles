# My Neovim Notes
A personalized quick-reference guide for mastering Neovim’s essential commands and workflows.

## Setup
This Neovim setup is based on my personal configuration, available at [nvim-config](https://github.com/ndy-s/nvim-config).
```sh
git clone https://github.com/ndy-s/nvim-config "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Configuration
- `init.lua` → Recommended Neovim configuration file (located at `~/.config/nvim/init.lua`)
- `init.vim` → Legacy or alternative configuration file (located at `~/.config/nvim/init.vim`)

## Key Mapping Symbols  
- `<C-...>` → Represents pressing `Ctrl` along with another key (e.g., `<C-a>` means `Ctrl + a`).  
- `<leader>`→ The `<leader>` key is a customizable prefix key that allows you to define your own key mappings. In this setup, the leader key is set to `Space` (`<Space>`).

## netrw (File Explorer)
- `-` **(custom)** → Open parent directory
- `<Enter>` → Open selected file or directory  
- `o` → Open file/directory in a horizontal split  
- `v` → Open file/directory in a vertical split  
- `t` → Open file/directory in a new tab  
- `r` → Rename file/directory  
- `%` → Create a new file  
- `d` → Create a new directory  
- `D` → Delete selected file/directory  
- `R` → Refresh the file list  
- `~` → Go to home directory  
- `-` or `u` → Go up one directory  
- `gh` → Toggle hidden files  
- `mf` → Mark file (for batch operation)  
- `mF` → Unmark all marked files  
- `mc` → Copy marked files  
- `mm` → Move marked files  
- `md` → Delete marked files  

## Motion Formula
```
operator + [count/number] + motion
```
Examples:  
`d2w` → delete 2 words  
`c3e` → change 3 words to end

## Navigation
- `<C-]>` → Jump to definition or references  
- `<C-o>` → Return to previous location after a jump  
- `<C-i>` → Go forward to the next location in the jump list (opposite of `<C-o>`)
- `<Enter>` → Open link (in help section)  
- `K` → Look up documentation for word under cursor  
- `gg` → Go to first line  
- `G` → Go to last line  
- `<number>G` → Go to specific line number  
- `0` → Start of line  
- `$` → End of line  
- `^` → First non-whitespace of line  
- `%` → Jump to matching `() {}`  
- `h/j/k/l` → Move left/down/up/right  
- `<C-g>` → Show file location & status  

### Window Navigation
- `<C-w>` → Window navigation  
- `<leader>wh` **(custom)** → Go to left window  
- `<leader>wj` **(custom)** → Go to lower window  
- `<leader>wk` **(custom)** → Go to upper window  
- `<leader>wl` **(custom)** → Go to right window  
- `<leader>wH` **(custom)** → Move window left  
- `<leader>wJ` **(custom)** → Move window down  
- `<leader>wK` **(custom)** → Move window up  
- `<leader>wL` **(custom)** → Move window right  
- `:split` or `<leader>ws` **(custom)** → Horizontal split  
- `:vsplit` or `<leader>wv` **(custom)** → Vertical split  
- `<leader>wrh` **(custom)** → Shrink window width ←  
- `<leader>wrl` **(custom)** → Grow window width →  
- `<leader>wrk` **(custom)** → Grow window height ↑  
- `<leader>wrj` **(custom)** → Shrink window height ↓

### Code Navigation
- `<leader>gd` **(custom)** → Go to definition  
- `<leader>gr` **(custom)** → Go to references

### Tmux Navigation
- `<C-h>` **(custom)** → Move left to the adjacent split/tmux pane  
- `<C-j>` **(custom)** → Move down to the adjacent split/tmux pane  
- `<C-k>` **(custom)** → Move up to the adjacent split/tmux pane  
- `<C-l>` **(custom)** → Move right to the adjacent split/tmux pane  
- `<C-\>` **(custom)** → Switch back to the previously focused split/tmux pane 

## Editing
- `i` → Insert before cursor  
- `a` → Append after cursor  
- `A` → Append at end of line  
- `o` → New line below  
- `O` → New line above  
- `x` → Delete character  
- `dw` → Delete to next word  
- `de` → Delete to end of word  
- `d$` → Delete to end of line  
- `dd` → Delete current line  
- `r` → Replace character  
- `R` → Replace multiple  
- `ce` → Change to end of word  
- `c$` → Change to end of line  
- `cw` → Change to next word  
- `u` → Undo  
- `U` → Undo entire line  
- `<C-r>`: Redo
- `+` **(custom)** → Increment number  
- `-` **(custom)** → Decrement number  
- `<C-a>` **(custom)** → Select all (`gg<S-v>G`)
- `<leader>cf` **(custom)** → Format buffer using none-ls
- `<leader>u` **(custom)** → Toggle UndoTree
- `v` + `J` **(custom)** → Move selected lines down in visual mode
- `v` + `K` **(custom)** → Move selected lines up in visual mode

## Copy & Pasting
- `y` → Yank (copy)
- `p` → Paste after cursor  
- `P` → Paste before cursor  
- `<leader>y` **(custom)** → Yank selected text to system clipboard  
- `<leader>Y` **(custom)** → Yank line to system clipboard 

## Visual Mode
- `v` → Visual mode (char-wise)  
- `V` → Visual mode (line-wise)  

## Buffers
- `:ls` → List buffers  
- `:b<number>` → Go to buffer  
- `:bn` → Next buffer  
- `:bp` → Previous buffer  
- `:b#` → Switch to last buffer  
- `:bd` → Delete buffer  
- `:bufdo bd` → Delete all buffers  
- `:e <file>` → Open file  
 
## Search
- `/<search>` → Search forward  
- `?<search>` → Search backward  
- `/<search>\c` → Case-insensitive  
- `n` → Next result  
- `N` → Previous result
- `<leader>r` **(custom)** → Search and replace word under cursor

## Find & Replace
- `:s/<old>/<new>` → Replace first occurrence on line  
- `:s/<old>/<new>/g` → Replace all on line  
- `:<start>,<end>s/<old>/<new>/g` → Replace in range  
- `:%s/<old>/<new>/g` → Replace in file  
- `:%s/<old>/<new>/gc` → Replace with confirmation  

## Telescope 
### Fuzzy Finder
- `:Telescope find_files` or `<leader>sf` **(custom)** → Open Telescope to find files
- `:Telescope live_grep` or `<leader>sg` **(custom)** → Open Telescope live grep (search text inside files)
- `:Telescope buffers` or `<leader>sb` **(custom)** → Open Telescope buffer list
- `:Telescope help_tags` or `<leader>sh` **(custom)** → Open Telescope help tags
- `<leader>sn` **(custom)** → Search NeoVim config files 
- `<leader>sp` **(custom)** → Search lazy.nvim installed plugins 

### Navigation & Scrolling
- `<C-n>` → Move next in results  
- `<C-p>` → Move previous in results  
- `<C-d>` → Scroll preview down (half-page)  
- `<C-u>` → Scroll preview up (half-page)

## Debugging
- `<leader>ca` **(custom)** → Trigger Code Actions
- `<leader>cd` **(custom)** → Show Code Diagnostics
- `<leader>db` **(custom)** → Toggle Breakpoint
- `<leader>dn` **(custom)** → Step Over
- `<leader>dd` **(custom)** → Toggle DAP UI
- `<leader>dx` **(custom)** → Terminate Session
- `<leader>dc` **(custom)** → Clear All Breakpoints

## Test Runner  
- `<leader>tt` **(custom)** → Run nearest test  
- `<leader>tT` **(custom)** → Run all tests in the file  
- `<leader>ta` **(custom)** → Run the entire test suite  
- `<leader>tl` **(custom)** → Re-run the last test  
- `<leader>tg` **(custom)** → Go to the last test file  

## Harpoon
- `<leader>ha` **(custom)** → Add file to Harpoon
- `<leader>hh` **(custom)** → Open Harpoon menu (Telescope)
- `<leader>h1` **(custom)** → Jump to Harpoon file 1
- `<leader>h2` **(custom)** → Jump to Harpoon file 2
- `<leader>h3` **(custom)** → Jump to Harpoon file 3
- `<leader>h4` **(custom)** → Jump to Harpoon file 4
- `<leader>hn` **(custom)** → Go to next Harpoon file
- `<leader>hp` **(custom)** → Go to previous Harpoon file
- `<C-d>` **(custom)** → Remove the currently selected file from Harpoon while navigating
    
## File Operations
- `:r <file>` → Insert file content  
- `:e` → Edit file + `Tab` for autocomplete
- `<leader>x` **(custom)** → Make current file executable

## InspectTree
- `:Inspect` → Show highlight groups  
- `:InspectTree` → Tree-sitter viewer  

## Quitting Neovim
- `:q` → Quit  
- `:q!` → Force quit  
- `:wq` → Save & quit  
- `:x` or `ZZ` → Save if needed & quit  
- `:qa` → Quit all  
- `:qa!` → Force quit all

## External Commands
- `:!<command>` → Run shell command  
- `:r !<command>` → Insert command output  

## Options
- `:set ic` → Case-insensitive search  
- `:set hls is` → Highlight & incremental search  
- `:set noic` → Disable case-insensitive search  
- `:set invic` → Toggle case-insensitive  
- `:nohlsearch` → Clear highlights  

## Help
- `:help` → Open help  
- `:help w` → Help for `w`  

## Saving Selection
- `v<select>` + `:'<,'>w TEST` → Save selection to `TEST`  

## Keymaps / Remaps
- `:map` → Show keymaps  
- `:nmap` → Normal mode maps  
- `:imap` → Insert mode maps  
- `:vmap` → Visual mode maps  
- `:omap` → Operator-pending maps  
- `:unmap <key>` → Unmap  
- `:noremap <key>` → Non-recursive map  
- `:nnoremap <key>` → Non-recursive normal  
- `:inoremap <key>` → Non-recursive insert  
- `:vnoremap <key>` → Non-recursive visual  
