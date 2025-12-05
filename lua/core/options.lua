-- File Explorer
vim.cmd("let g:netrw_banner = 0 ")

-- Line Numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

--Swap/Undo/Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search behavior
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- vim.opt.colorcolumn = "80"

-- Backspace behavior
vim.opt.backspace = { "start", "eol", "indent" }

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Files
vim.opt.isfname:append("@-@")

-- Extras
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.g.editorconfig = true

-- Copilot
vim.g.copilot_no_tab_map = true

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("Copilot disable")
    end,
})
