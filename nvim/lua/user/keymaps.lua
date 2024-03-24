local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}
-- taken from LunarVim

keymap("n", "<Bslash>", ":noh<CR>", opts)
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', "<leader>t", ":tabn<SPACE>", {noremap = true, silent = false})
keymap('n', "<A-l>", ":tabn<CR>", opts)
keymap('n', "<A-h>", ":tabp<CR>", opts)
keymap('n', "<leader>e", ":Ex<cr>", opts)

-- window navigation shortcuts
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

-- center screen when navigating
--[[ keymap('n', "<C-u>", "<C-u>zz", opts)
keymap('n', "<C-d>", "<C-d>zz", opts) ]]--

-- move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append below line to current
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
keymap('x', "<leader>p", "\"_dP", opts)

--Resize with arrows
keymap('n', "<C-Up>", ":resize +2<CR>", opts)
keymap('n', "<C-Down>", ":resize -2<CR>", opts)
keymap('n', "<C-Left>", ":vertical resize -3<CR>", opts)
keymap('n', "<C-Right>", ":vertical resize +2<CR>", opts)

-- fast normal mode
vim.keymap.set({'i', 's'}, 'jk', "<ESC>", opts)

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- fugitive
keymap("n", "<leader>gs", ":Git<CR>", opts)

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "netrw",
    callback = function (_)
        vim.api.nvim_buf_set_keymap(0, 'n', "<leader>e", ":bd<CR>", opts)
        vim.opt_local.bufhidden = "delete"
    end
})
