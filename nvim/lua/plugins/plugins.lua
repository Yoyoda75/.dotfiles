return {
	"cohama/lexima.vim",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "kylechui/nvim-surround", opts = {event = "VeryLazy"} },
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
	},
}
