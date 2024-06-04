return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `lua_ls`
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
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
                }
            })
        end
    }
}
