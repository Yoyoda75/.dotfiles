---@type vim.lsp.Config
return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "requirements.txt" },
	settings = {
		pylsp = {
			plugins = {
				-- ruff = {
				-- 	enabled = true, -- Enable the plugin
				-- 	formatEnabled = true, -- Enable formatting using ruffs formatter
				-- 	executable = "ruff",
				-- },

				-- ===========================================
				-- Disable ALL formatting plugins in pylsp
				-- (Ruff/Conform will handle formatting)
				-- ===========================================
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				pylsp_isort = { enabled = false }, -- Optional: Disable if you use Ruff for imports

				-- ===========================================
				-- Enable Linters (optional)
				-- Keep these enabled if you want pylsp's own linters
				-- OR disable them and use Ruff for linting instead
				-- ===========================================
				pylint = {
					enabled = true,
					args = {
						"--disable=missing-module-docstring",
						"--disable=missing-function-docstring",
						"--disable=import-error",
						"--max-line-length=88",
					},
				}, -- Enable if you want pylint diagnostics
				pyflakes = { enabled = true }, -- Disable if using Ruff for linting
				pycodestyle = { enabled = false }, -- Disable if using Ruff for linting
				flake8 = { enabled = false }, -- Disable if using Ruff for linting

				-- ===========================================
				-- Enable Core Features
				-- (Autocompletion, type checking, etc.)
				-- ===========================================
				-- jedi_completion = {
				-- 	enabled = true,
				-- 	include_params = true,
				-- 	fuzzy = true,
				-- 	eager = true,
				-- }, -- Autocompletion
				jedi_completion = { enabled = true },
				jedi_signature_help = { enabled = true }, -- Function signatures
				pylsp_mypy = { enabled = true }, -- Type checking (if you use mypy)
				pylsp_rope = { enabled = false }, -- Refactoring (e.g., rename variables)
				jedi_hover = { enabled = true },
				jedi_references = { enabled = true },
				jedi_symbols = { enabled = true },
			},
		},
	},
}
