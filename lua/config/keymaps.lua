local map = vim.keymap.set

-- select all
map("n", "<C-a>", "gg<S-v>G")

-- window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- resize with arrow keys
map("n", "<C-left>", "<CMD>vertical resize -2<CR>")
map("n", "<C-right>", "<CMD>vertical resize +2<CR>")
map("n", "<C-up>", "<CMD>resize -2<CR>")
map("n", "<C-down>", "<CMD>resize +2<CR>")

-- move current line/block with `Alt/Opt`
map("n", "<A-j>", "<CMD>m .+1<CR>==")
map("n", "<A-k>", "<CMD>m .-2<CR>==")
map("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv")
map("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv")

-- buffer switching
map("n", "<S-h>", "<CMD>bprev<CR>")
map("n", "<S-l>", "<CMD>bnext<CR>")

-- indent/dedent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- clear search with <esc>
map({ "i", "n" }, "<ESC>", "<CMD>noh<CR><ESC>")

-- remap fold commands
map("n", "za", "zA")
map("n", "zA", "za")

-- quick fix
map("n", "[q", "<CMD>cprev<CR>", { desc = "Previous Quickfix" })
map("n", "]q", "<CMD>cnext<CR>", { desc = "Next Quickfix" })
