
# Neovim Configuration

This is my personal Neovim configuration. It includes a curated set of plugins and custom keybindings to enhance productivity and usability.


## Plugins

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua functions that many plugins use
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Tmux & split window navigation
- [jesseleite/vim-noh](https://github.com/jesseleite/vim-noh) - Quickly clear search highlighting
- [alec-gibson/nvim-tetris](https://github.com/alec-gibson/nvim-tetris) - Play Tetris in Neovim

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
| v            | J                     | `:m '>+1<CR>gv=gv`                                     | Move selected lines down                     |
| v            | K                     | `:m '<-2<CR>gv=gv`                                     | Move selected lines up                       |
| i            | <C-l>                 | `copilot#Accept("<CR>")` (expr)                        | Accept GitHub Copilot suggestion             |

- `<leader>` is set to <kbd>Space</kbd>
- `<localleader>` is set to <kbd>Space</kbd>

## Getting Started

Clone this repo into your Neovim config directory:

```sh
git clone <this-repo-url> ~/.config/nvim
```

Then launch Neovim and run `:Lazy` or your plugin manager's install command.
