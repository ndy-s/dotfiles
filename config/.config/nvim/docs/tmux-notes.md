# My Tmux Notes
A personalized quick-reference guide for mastering Tmux's essential commands and workflows.

## Setup
To install [Tmux](https://github.com/tmux/tmux), run:
```sh
git clone https://github.com/tmux/tmux.git
```

To install [Tmuxifier](https://github.com/jimeh/tmuxifier), run:
```sh
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
echo 'export PATH="$HOME/.tmuxifier/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Configuration
- `~/.tmux.conf` → Main Tmux configuration file
- `~/.tmuxifier/layouts/` → Directory for custom layouts

## Key Mapping Symbols
- `<C-...>` → Represents pressing `Ctrl` along with another key (e.g., `<C-a>` means `Ctrl + a`).
- `<C-x>` **(custom)** → The leader key for Tmux shortcuts in this setup.

## Sessions
- `<C-x>s` → List sessions
- `<C-x>$` → Rename session
- `<C-x>d` → Detach from session
- `<C-x>l` → List all sessions
- `<C-x>(` → Previous session
- `<C-x>)` → Next session
- `<C-x>x` → Kill session
- `<C-x>r` → Reload Tmux configuration
- `tmux new -s <name>` → Create new session
- `tmux attach -t <name>` → Attach to a session
- `tmux kill-session -t <name>` → Kill a session
- `tmux list-sessions` or `tmux ls` → List all sessions

## Windows
- `<C-x>c` → Create new window
- `<C-x>n` → Next window
- `<C-x>p` → Previous window
- `<C-x>w` → List windows
- `<C-x>f` → Find window
- `<C-x>&` → Kill window
- `<C-x>0` → Kill current window
- `tmux new-window` → Create a new window
- `tmux select-window -t <num>` → Switch to a window

## Panes
- `<C-x>%` → Split vertically
- `<C-x>"` → Split horizontally
- `<C-x>h` → Move to left pane
- `<C-x>j` → Move to bottom pane
- `<C-x>k` → Move to top pane
- `<C-x>l` → Move to right pane
- `<C-x>o` → Move to next pane
- `<C-x>q` → Display pane numbers
- `<C-x>x` → Kill current pane
- `<C-x>z` → Toggle zoom pane
- `<C-x>{` → Resize pane left
- `<C-x>}` → Resize pane right
- `<C-x>+` → Resize pane taller
- `<C-x>-` → Resize pane shorter
- `tmux split-window -h` → Split horizontally
- `tmux split-window -v` → Split vertically

## Copy & Paste Mode
- `<C-x>[` → Enter copy mode
- `<C-x>]` → Paste buffer
- `<C-x>#` → List buffers
- `<C-x>b` → Choose buffer
- `<C-x>c` → Clear buffer

## Synchronizing Panes
- `<C-x>y` → Toggle pane synchronization
- `tmux setw synchronize-panes on` → Enable sync mode
- `tmux setw synchronize-panes off` → Disable sync mode

## Miscellaneous
- `<C-x>m` → Toggle mouse mode
- `<C-x>u` → Undo last command
- `<C-x>t` → Open terminal in new pane

## Quitting Tmux
- `<C-x>q` → Kill Tmux server
- `<C-x>d` → Detach session
- `tmux kill-server` → Kill the Tmux server
- `tmux detach` → Detach from a session

## Tmuxifier Commands
- `tmuxifier load-session <layout>` → Load a saved layout
- `tmuxifier list-sessions` → List available layouts
- `tmuxifier edit-session <layout>` → Edit a layout
- `tmuxifier new-session <layout>` → Create a new layout

