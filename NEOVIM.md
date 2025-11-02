# Neovim Configuration Summary

## Keybindings

This config uses `space` as the leader key and sets `localleader` to `space` as well.

| Shortcut                  | Mode                   | Action                                     |
| ------------------------- | ---------------------- | ------------------------------------------ |
| `<leader>h`               | normal                 | Clear search highlights                    |
| `n`                       | normal                 | Next search result, centered               |
| `N`                       | normal                 | Previous search result, centered           |
| `<C-e>`                   | normal                 | Scroll down 5 lines                        |
| `<C-y>`                   | normal                 | Scroll up 5 lines                          |
| `<C-q>`                   | normal                 | Scroll up 5 lines                          |
| `<leader>p`               | visual                 | Paste without yanking the selected text    |
| `<leader>d`               | normal/visual          | Delete without yanking                     |
| `<leader>bn`              | normal                 | Next buffer                                |
| `<leader>bp`              | normal                 | Previous buffer                            |
| `<leader>wh`              | normal                 | Move to left window                        |
| `<leader>wj`              | normal                 | Move to bottom window                      |
| `<leader>wk`              | normal                 | Move to top window                         |
| `<leader>wl`              | normal                 | Move to right window                       |
| `<leader>ww`              | normal                 | Switch to other window                     |
| `<leader>wd`              | normal                 | Close window                               |
| `<leader>sv`              | normal                 | Split window vertically                    |
| `<leader>sh`              | normal                 | Split window horizontally                  |
| `<C-Up>`                  | normal                 | Increase window height                     |
| `<C-Down>`                | normal                 | Decrease window height                     |
| `<C-Left>`                | normal                 | Decrease window width                      |
| `<C-Right>`               | normal                 | Increase window width                      |
| `<A-j>`                   | normal                 | Move current line down                     |
| `<A-k>`                   | normal                 | Move current line up                       |
| `<A-j>`                   | visual                 | Move selection down                        |
| `<A-k>`                   | visual                 | Move selection up                          |
| `<`                       | visual                 | Indent left and reselect                   |
| `>`                       | visual                 | Indent right and reselect                  |
| `<leader>e`               | normal                 | Toggle Neotree file explorer               |
| `<leader>ff`              | normal                 | Find file with `:find`                     |
| `J`                       | normal                 | Join lines and keep cursor position        |
| `<leader>rc`              | normal                 | Edit Neovim config (`$MYVIMRC`)            |
| `<leader>qs`              | normal                 | Load persistence session                   |
| `<leader>qS`              | normal                 | Select a persistence session               |
| `<leader>ql`              | normal                 | Load last persistence session              |
| `<leader>qd`              | normal                 | Stop persistence session manager           |
| `<leader>pa`              | normal                 | Copy full file path to clipboard           |
| `<leader>tn`              | normal                 | Open a new tab                             |
| `<leader>tx`              | normal                 | Close current tab                          |
| `<leader>tm`              | normal                 | Move current tab                           |
| `<leader>t>`              | normal                 | Move tab right                             |
| `<leader>t<`              | normal                 | Move tab left                              |
| `pd`                      | normal                 | Go to previous diagnostic                  |
| `nd`                      | normal                 | Go to next diagnostic                      |
| `<leader>q`               | normal                 | Open diagnostic list                       |
| `<leader>dl`              | normal                 | Show diagnostics in a floating window      |
| `<leader>bo`              | normal                 | Close all buffers except current           |
| `<leader>rr`              | normal                 | Rename current file                        |
| `<leader>pf`              | normal                 | Copy full file path to clipboard           |
| `<leader>pr`              | normal                 | Copy relative file path to clipboard       |
| `<D-s>`                   | normal/insert/visual   | Save file                                  |
| `<Leader><Leader>`        | normal                 | FZF: Find files                            |
| `<Leader>,`               | normal                 | FZF: Find buffers                          |
| `<Leader>/`               | normal                 | FZF: Search project with Ripgrep           |
| `<leader>gd`              | normal                 | Open Git Diffview                          |
| `<leader>gh`              | normal                 | Show Git file history for current file     |
| `<leader>1`...`<leader>9` | normal                 | Jump to buffer 1-9                         |
| `<leader>tO`              | normal                 | Open file in a new tab                     |
| `<leader>td`              | normal                 | Duplicate current tab                      |
| `<leader>tr`              | normal                 | Close tabs to the right                    |
| `<leader>tL`              | normal                 | Close tabs to the left                     |
| `<leader>bd`              | normal                 | Smart close buffer/tab                     |
| `s`                       | normal/visual/operator | Flash jump/search                          |
| `S`                       | normal/operator/visual | Flash Treesitter search                    |
| `o r`                     | operator-pending       | Remote Flash                               |
| `R`                       | visual/operator        | Treesitter search                          |
| `<c-s>`                   | command                | Toggle Flash search                        |
| `<c-space>`               | normal/operator/visual | Treesitter incremental selection           |
| `<leader>f`               | normal/visual          | Format buffer with Conform                 |
| `]g`                      | normal                 | Next Git hunk                              |
| `[g`                      | normal                 | Previous Git hunk                          |
| `gp`                      | normal                 | Preview Git hunk                           |
| `gd`                      | normal                 | Go to definition (LSP)                     |
| `gr`                      | normal                 | Go to references (LSP)                     |
| `K`                       | normal                 | Show hover docs (LSP)                      |
| `<leader>rn`              | normal                 | Rename symbol (LSP)                        |
| `<leader>ca`              | normal                 | Code action (LSP)                          |
| `gD`                      | normal                 | Go to declaration (LSP)                    |
| `gi`                      | normal                 | Go to implementation (LSP)                 |
| `<C-k>`                   | normal                 | Signature help (LSP)                       |
| `gdx`                     | normal                 | Go to definition in vertical split (LSP)   |
| `gds`                     | normal                 | Go to definition in horizontal split (LSP) |

## Configured LSPs

This setup enables the following language servers:

- `vtsls` for JavaScript, TypeScript, and React filetypes
- `pyright` for Python, with diagnostics and type checking mostly disabled so Ruff can handle linting
- `ruff` for Python linting and formatting support via the `ruff server`
- `lua_ls` for Lua development, including runtime library support and `vim` global recognition
- `terraformls` for Terraform files (`.tf`, `terraform`)
- `ansiblels` for Ansible YAML files (`yaml.ansible`)

LSP diagnostics are configured to:
- show virtual text with a `●` prefix
- use rounded border floats
- underline issues
- update only outside insert mode
- sort diagnostics by severity

## Extra Filetype Configuration

This config adds custom filetype detection for Ansible YAML files using `vim.filetype.add`.

It maps common Ansible file paths to `yaml.ansible`, including:
- `playbooks/*.yml` and `playbooks/*.yaml`
- `roles/*/tasks/*.yml` and `roles/*/tasks/*.yaml`
- `site.yml`, `site.yaml`, `main.yml`, and `main.yaml`

## Basic Editor Settings

### Tabs and indentation

- `tabstop = 4` — a tab character is displayed as 4 spaces wide
- `shiftwidth = 4` — auto-indent uses 4 spaces
- `softtabstop = 4` — editing with tabs/spaces uses 4-space behavior
- `expandtab = true` — inserts spaces instead of tab characters
- `smartindent = true` — enable language-aware indenting
- `autoindent = true` — new lines inherit indentation from the previous line

### Search behavior

- `ignorecase = true` — searches are case-insensitive by default
- `smartcase = true` — searches become case-sensitive if uppercase letters are used
- `incsearch = true` — show incremental matches while typing

### Display and UI

- `number = true` and `relativenumber = true` — show both absolute and relative line numbers
- `cursorline = true` — highlight the current line
- `wrap = false` — disable line wrapping
- `scrolloff = 10` and `sidescrolloff = 8` — keep space around the cursor when scrolling
- `termguicolors = true` — enable true color support
- `signcolumn = yes` — always show the sign column
- `colorcolumn = 80` — show a visual column at 80 characters
- `showmatch = true` and `matchtime = 2` — highlight matching pairs briefly
- `cmdheight = 1` — use a single command-line height
- `pumheight = 10`, `pumblend = 10` — configure completion popup size and transparency

### File handling and persistence

- `backup = false`, `writebackup = false`, `swapfile = false` — disable backup and swap file creation
- `undofile = true` and custom `undodir` at `~/.vim/undodir` — enable persistent undo
- `updatetime = 300` — faster completion and CursorHold events
- `timeoutlen = 500` — key mapping timeout duration
- `ttimeoutlen = 0` — no timeout for terminal key codes
- `clipboard:append("unnamedplus")` — use the system clipboard

### Behavior and convenience

- `errorbells = false` — disable audible/error bells
- `backspace = indent,eol,start` — allow backspace over indentation, line breaks, and start of insert
- `autochdir = false` — do not change working directory automatically
- `iskeyword:append("-")` — treat hyphenated words as one word
- `path:append("**")` — search paths include subdirectories
- `mouse = a` — enable mouse support
- `mousescroll = ver:2,hor:0` — disable horizontal scrolling with mouse wheel
- `modifiable = true` — allow buffer changes
- `encoding = UTF-8` — set file encoding

### Folding and splits

- `foldmethod = expr` and `foldexpr = v:lua.vim.treesitter.foldexpr()` — use Treesitter-based folding
- `foldlevel = 99` — start with all folds open
- `splitbelow = true` — horizontal splits open below the current window
- `splitright = true` — vertical splits open to the right

### Completion and command-line

- `completeopt = menuone,noinsert,noselect,popup` — improve completion menu behavior
- `wildmenu = true` and `wildmode = longest:full,full` — enhance command-line completion
- `wildignore` ignores common build artifacts like `*.o`, `*.obj`, `*.pyc`, `*.class`, and `*.jar`

## How to Use This Config

- Press `space` first to use any leader-key mappings, like `<leader>ff` to find files or `<leader>e` to toggle the Neotree file explorer.
- Use `pd` and `nd` to move between diagnostics, or `<leader>dl` to inspect the current line in a floating diagnostic window.
- Use the tab mappings like `<leader>tn`, `<leader>tx`, and `<leader>tm` to create, close, and move tabs.
- Buffer navigation is easier with `<leader>bn`, `<leader>bp`, and `<leader>bo` to keep only the current buffer open.
- Use `<leader>rr` to rename the current file, and `<leader>pa` / `<leader>pr` to copy file paths to the clipboard.

## Notes

- The config includes a few custom helper mappings for tabs, buffers, file path copying, and persistence session management.
- The file path copy mappings use the system clipboard (`+` register) and print the selected path.
