return {
	"FabijanZulj/blame.nvim",
	lazy = false,
	opts = {},
	cmd = { "BlameToggle" },
	vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<cr>"),
}
