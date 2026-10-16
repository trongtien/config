local keymap = vim.keymap

require("config.resize")
require("config.diagnostics")

local opts = { noremap = true, silent = true }
keymap.set("i", "jk", "<Esc>")
keymap.set("n", ";", ":", {
    silent = false,
    nowait = true,
})

keymap.set({ "i", "n" }, "<C-s>", "<Esc>:w<CR>")
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "<ESC><ESC>", ":nohlsearch<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- Terminal: <Esc><Esc> thoát terminal mode sang normal mode (một <Esc> vẫn gửi cho shell)
keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- Indentce
keymap.set("x", ">", ">gv")
keymap.set("x", "<", "<gv")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<C-f>", "/")

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

