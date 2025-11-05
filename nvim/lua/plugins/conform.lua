return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		log_level = vim.log.levels.DEBUG,
		-- Define your formatters
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			md = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			bash = { "shfmt", "shellcheck", stop_after_first = false },
			zsh = { "shfmt", "shellcheck", stop_after_first = false },
			jinja = { "djlint" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		-- format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "4", "--prose-wrap", "always" },
			},
			djlint = {
				prepend_args = {
					"--profile",
					"jinja",
					"--blank-line-before-tag",
					"block,load,extends,include",
					"--preserve-blank-lines",
				},
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
