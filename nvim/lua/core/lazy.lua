-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.cmd("language en_US.UTF-8")
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = {
		missing = true,
		colorscheme = { "cyberdream" },
	},
	ui = {
		title = " lazy.nvim 💤",
		border = "rounded",
		pills = true,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				-- "gzip",
				-- "tarPlugin",
				-- "tohtml",
				-- "zipPlugin",
				-- "netrwPlugin",
				-- "tutor",
			},
		},
	},
	change_detection = {
		notify = false,
	},
})
