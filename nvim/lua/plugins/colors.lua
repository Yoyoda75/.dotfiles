-- return {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         local palette = require('nightfox.palette').load('nightfox')
--         local Color = require('nightfox.lib.color')
--         local bright_comment = Color(palette.comment):brighten(10):to_css()
--         local bright_selection = Color(palette.sel0):brighten(10):to_css()
--         local palettes = {
--             carbonfox = { comment = bright_comment, sel0 = bright_selection }
--         }
--         require("nightfox").setup({
--             options = { transparent = true },
--             palettes = palettes,
--         })
--         vim.cmd [[syntax enable]]
--         vim.cmd([[colorscheme carbonfox]])
--         require('lualine').setup({})
--     end,
-- }
return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            terminal_colors = false,
            cache = true,
            borderless_telescope = { border = false, style = "flat" },
        })
        -- vim.cmd [[syntax enable]]
        vim.cmd("colorscheme cyberdream")
    end,

}
