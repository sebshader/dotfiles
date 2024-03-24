vim.o.relativenumber = true
vim.o.number = true
vim.o.mouse = "a"
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.pd_lua",
    command = "set filetype=lua"
})

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.signcolumn = 'yes'
vim.o.showmode = false
vim.o.scrolloff = 5
vim.o.colorcolumn = "81"
vim.o.list = true

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case -j 1"
vim.opt.grepformat:append("%f:%l:%c:%m")

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false

vim.o.splitright = true

if(vim.fn.has('win32')) then
    vim.o.shell = (vim.fn.executable('pwsh') > 0) and 'pwsh' or 'powershell'
    vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';'
    vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.o.shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
    vim.o.shellquote= ''
    vim.o.shellxquote= ''
end
