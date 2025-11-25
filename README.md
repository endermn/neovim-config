
# Neovim Configuration !!Neovim >= 0.11

This is my personal Neovim configuration. It includes a curated set of plugins and custom keybindings to enhance productivity and usability.

## Dependencies
=======
Make sure you have the following dependencies installed for full functionality:

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [git](https://git-scm.com/)
- [python](https://www.python.org/)
- [npm](https://www.npmjs.com/)

You can install them on macOS with:
```sh
brew install ripgrep fd git python npm
```
On Linux use your package manager, for example on Arch:
```sh
sudo pacman -S ripgrep fd git python npm
```

## Plugins

- lsp-config.lua
- mason.lua
- auto-pairs.lua
- auto-sessions.lua
- cellular-automaton.lua
- colorscheme.lua
- copilot.lua
- formatting.lua
- gitstuff.lua
- gitworktree.lua
- harpoon.lua
- image-support.lua
- incline.lua
- init.lua
- linting.lua
- lualine.lua
- mini.lua
- noice.lua
- nvim-cmp.lua
- nvim-ufo.lua
- oil.lua
- snacks.lua
- telescope.lua
- todo-comments.lua
- treesitter.lua
- trouble.lua
- undo-tree.lua
- wilder.lua

## Keybindings

| Mode(s)      | Key / Mapping         | Action / Function                                      | Description                                  |
|--------------|-----------------------|--------------------------------------------------------|----------------------------------------------|
| n            | gR                    | `<cmd>Telescope lsp_references<CR>`                    | Show definition, references                  |
| n            | gD                    | `vim.lsp.buf.declaration`                              | Go to declaration                            |
| n            | gd                    | `<cmd>Telescope lsp_definitions<CR>`                   | Show LSP definitions                         |
| n            | gi                    | `<cmd>Telescope lsp_implementations<CR>`               | Show LSP implementations                     |
| n            | gt                    | `<cmd>Telescope lsp_type_definitions<CR>`              | Show LSP type definitions                    |
| n, v         | <leader>vca           | `vim.lsp.buf.code_action()`                            | See available code actions                   |
| n            | <leader>rn            | `vim.lsp.buf.rename`                                   | Smart rename                                 |
| n            | <leader>D             | `<cmd>Telescope diagnostics bufnr=0<CR>`               | Show diagnostics for file                    |
| n            | <leader>d             | `vim.diagnostic.open_float`                            | Show diagnostics for line                    |
| n            | K                     | `vim.lsp.buf.hover`                                    | Show documentation for what is under cursor  |
| n            | <leader>rs            | `:LspRestart<CR>`                                      | Restart LSP                                  |
| i            | <C-h>                 | `vim.lsp.buf.signature_help()`                         | Show signature help                          |
| n            | -                     | `<CMD>Oil<CR>`                                         | Open parent directory                        |
| n            | <leader>-             | `require("oil").toggle_float`                          | Toggle Oil float                             |
| n            | <leader>fof           | `<cmd>Telescope oldfiles<CR>`                          | Fuzzy find recent files                      |
| n            | <leader>ff            | `<cmd>Telescope find_files<CR>`                        | Fuzzy find files                             |
| n            | <leader>fw            | `<cmd>Telescope live_grep<CR>`                         | Live grep files                              |
| n            | <leader>th            | `<cmd>Telescope themes<CR>`                            | Theme Switcher                               |
| n            | <leader>lg            | `<cmd>LazyGit<CR>`                                     | Open LazyGit                                 |
| v            | <leader>ai            | `<cmd>gevai <prompt> <code><CR>`                       | Gives the selected code to gevai             |
| v            | J                     | `:m '>+1<CR>gv=gv`                                     | Move selected lines down                     |
| v            | K                     | `:m '<-2<CR>gv=gv`                                     | Move selected lines up                       |
| i            | Ctrl-l                | `copilot#Accept("<CR>")` (expr)                        | Accept GitHub Copilot suggestion             |

- `<leader>` is set to <kbd>Space</kbd>
- `<localleader>` is set to <kbd>Space</kbd>

## Getting Started

BEFORE you start, make sure you have backed up your existing Neovim configuration if you have one, as this will overwrite it.

Clone this repo into your Neovim config directory:

```sh
git clone https://github.com/endermn/neovim-config ~/.config/nvim
```

Then launch Neovim and run `:Lazy` or your plugin manager's install command.

After installation, run `:Mason` to ensure all LSP servers and tools are installed.

