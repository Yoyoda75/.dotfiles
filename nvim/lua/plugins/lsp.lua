return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", ":Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		lazy = false,

		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					width = 0.8,
					height = 0.8,
				},
				registries = {
					"github:mason-org/mason-registry",
				},
			})

			local mason_packages = {
				"black",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"emmet-language-server",
				"eslint-lsp",
				"eslint_d",
				"html-lsp",
				"isort",
				"jq",
				"json-lsp",
				"lua-language-server",
				"markdownlint-cli2",
				"prettier",
				"python-lsp-server",
				"shfmt",
				"stylua",
				"typescript-language-server",
				"yaml-language-server",
				-- "ruff",
			}

			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(mason_packages) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
}
