local opt = vim.opt
opt.shell = "zsh"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers and relative line numbers
opt.relativenumber = true
opt.number = true

-- Tabulation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Smart indenting
opt.smartindent = true

-- No line wrap
opt.wrap = false

-- No highlight search and incremental search
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.colorcolumn = "88"

opt.scrolloff = 8

-- Show open tabs (=1 to only show it when more than one tab open)
opt.showtabline = 2

-- Decrease time required to enter a command
opt.timeoutlen = 500
