local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'pylsp', 'emmet_language_server', 'eslint', 'lua_ls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
        end,
        emmet_language_server = function()
            require('lspconfig').emmet_language_server.setup({})
        end,
        pylsp = function()
            require('lspconfig').pylsp.setup {
                filetypes = { 'python' },
                settings = {
                    pylsp = {
                        plugins = {
                            jedi_signature_help = { enabled = true },
                            -- Auto-completion
                            jedi_completion = {
                                include_params = true,
                                fuzzy = true,
                                eager = true,
                            },
                            -- Type checker
                            pylsp_mypy = { enabled = true },
                            -- Import sorting
                            pylsp_isort = {
                                enabled = true,
                                args = { '--profile black' },
                            },
                            -- Linter
                            pylint = {
                                enabled = true,
                                executable = 'pylint',
                                args = {
                                    "--disable=missing-module-docstring",
                                    "--disable=missing-function-docstring",
                                    "--disable=import-error",
                                    "--max-line-length=120",
                                }
                            },
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false, ignore = { 'E501' } },
                            flake8 = { enabled = false },
                            -- Formatter
                            black = {
                                enabled = true,
                                line_length = 120,
                            },
                            autopep8 = {
                                enabled = false,
                            },
                            yapf = { enabled = false },
                            -- Refactoring
                            pylsp_rope = { enabled = true },
                        }
                    }
                }
            }
        end
    },
}
)
