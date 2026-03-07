local opt = vim.opt

-- General
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 300
opt.showmode = true
opt.termguicolors = true
opt.background = "dark"

-- UI
opt.number = true
opt.numberwidth = 4
opt.ruler = true
opt.signcolumn = "yes"
opt.wildmenu = true
opt.laststatus = 2

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Folds
opt.foldlevelstart = 99
opt.foldlevel = 99
