local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = {
        missing = true,
        colorscheme = { "cyberdream" },
    },
    checker = { enabled = true },
    ui = {
        title = " lazy.nvim 💤",
        border = "rounded",
    },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                -- "gzip",
                -- "tarPlugin",
                -- "tohtml",
                -- "zipPlugin",
                -- "netrwPlugin",
                -- "tutor",
            },
        },
    },
})
vim.cmd("language en_US")
