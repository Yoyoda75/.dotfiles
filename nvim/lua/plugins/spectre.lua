return {
	"nvim-pack/nvim-spectre",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	keys = function()
		return {
			{
				"<leader>S",
				function()
					require("spectre").toggle()
				end,
				desc = "Toggle Spectre",
				mode = "n",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Search current word",
				mode = "n",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual()
				end,
				desc = "Search current word (visual)",
				mode = "v",
			},
			{
				"<leader>sp",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				desc = "Search on current file",
				mode = "n",
			},
		}
	end,
	config = function()
		require("spectre").setup({
			replace_engine = {
				["sed"] = {
					cmd = "sed",
					args = {
						"-i",
						"",
						"-E",
					},
				},
			},
		})
	end,
}
