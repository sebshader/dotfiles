local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}
-- taken from LunarVim

keymap("n", "<Bslash>", ":noh<CR>", opts)
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', "<leader>e", ":Lex 30<cr>", opts)

-- window navigation shortcuts
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

--Resize with arrows
keymap('n', "<C-Up>", ":resize +2<CR>", opts)
keymap('n', "<C-Down>", ":resize -2<CR>", opts)
keymap('n', "<C-Left>", ":vertical resize -2<CR>", opts)
keymap('n', "<C-Right>", ":vertical resize +2<CR>", opts)

-- fast normal mode
vim.keymap.set({'i', 's'}, 'jk', "<ESC>", opts)

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
