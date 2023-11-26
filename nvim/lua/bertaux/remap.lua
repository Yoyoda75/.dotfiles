vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Use <leader>pv to open the file tree (pv = preview)
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("tabnew")
    vim.cmd("terminal")
end)

-- Use J and K to move whole blocks of highlighted code in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps the cursor in the middle of the screen when jumping half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps the cursor in the middle when searching terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Use <leader>p to paste without putting the replaced text in the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Use <leader>y to yank to the system's clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Use <leader>d to delete to void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Tab management remaps
vim.keymap.set({"n", "t"}, "<C-t>", vim.cmd.tabnew) -- Open new tab
vim.keymap.set({"n", "t"}, "<C-x>", vim.cmd.tabc) -- Close current tab
vim.keymap.set({"n", "t"}, "<C-l>l", vim.cmd.tabr) -- Move to tab right
vim.keymap.set({"n", "t"}, "<C-l>h", vim.cmd.tabl) -- Move to tab left
vim.keymap.set({"n", "t"}, "<C-n>", vim.cmd.tabn) -- Move to next tab
