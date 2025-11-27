return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>nt", "<cmd>Neotest run<cr>" },
		{ "<leader>nto", "<cmd>Neotest output<cr>" },
		{ "<leader>nts", "<cmd>Neotest summary<cr>" },
		{ "<leader>nta", "<cmd>lua require('neotest').run.run({suite = true})<cr>" },
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
		})
	end,
}
