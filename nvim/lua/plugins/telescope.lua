return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'sharkdp/fd' },
    config = function()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pr', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

        telescope.setup({
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            defaults = {
                hidden = true,
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",

                sorting_strategy = "ascending",
                layout_strategy = "horizontal",

                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                path_display = {
                    filename_first = {
                        reverse_directories = true,
                    },
                },
            }
        })
    end,
}
