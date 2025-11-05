-- Line numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabulation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indenting
vim.opt.smartindent = false
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
-- vim.opt.showbreak = "↳"

-- No line wrap
vim.opt.wrap = false

-- No highlight search and incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "88"

vim.opt.scrolloff = 8

-- Show open tabs (=1 to only show it when more than one tab open)
vim.opt.showtabline = 2

-- Decrease time required to enter a command
-- vim.opt.timeoutlen=500

-- Disable vim backup and swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable virtual text
vim.diagnostic.config({ virtual_text = true })

-- Enable rounded borders on floating windows
vim.o.winborder = "rounded"
