-- Source : https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Use <leader>pv to open the file tree (pv = preview)
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("tabnew")
	vim.cmd("terminal")
end)

-- Use J and K to move whole blocks of highlighted code in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps the cursor in the middle of the screen when jumping half pages
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

-- Keeps the cursor in the middle when searching terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Use <leader>p to paste without putting the replaced text in the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Use <leader>y to yank to the system's clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Yanks the whole line regardless of cursor position
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]]) -- Paste from system clipboard

-- Map Cmd-V to paste from system clipboard in insert/normal mode
vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("i", "<D-v>", '<C-o>"+p', { noremap = true, silent = true })

-- Use <leader>d to delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Tab management remaps
vim.keymap.set({ "n", "t" }, "<C-t>", vim.cmd.tabnew) -- Open new tab
vim.keymap.set({ "n", "t" }, "<C-x>", vim.cmd.tabc) -- Close current tab
vim.keymap.set({ "n", "t" }, "<C-l>l", vim.cmd.tabr) -- Move to tab right
vim.keymap.set({ "n", "t" }, "<C-l>h", vim.cmd.tabl) -- Move to tab left
vim.keymap.set({ "n", "t" }, "<C-n>", vim.cmd.tabn) -- Move to next tab

-- Save document, move to terminal and enter last command
vim.keymap.set("n", "<leader>!!", [[:w<CR>:tabnext<CR>:startinsert<CR>!!<CR>]], { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", [[<ESC>:w<CR>]], { desc = "Save with leaderW" })

-- Clear search with <esc>
vim.keymap.set("n", "<esc>", ":noh<cr><esc>", { desc = "Escape and clear hlsearch" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
