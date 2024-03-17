vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.pd_lua",
    command = "set filetype=lua"
})
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.scrolloff = 5
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case -j 1"
vim.opt.grepformat:append("%f:%l:%c:%m")
--vim.cmd.syntax("off")
