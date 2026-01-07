require('extern.nvim-base16.lua.base16-colorscheme').setup({
    base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
    base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
    base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
    base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
    cterm00 = -1, cterm01 = 1, cterm02 = 13, cterm03 = 4,
    cterm04 = 3, cterm05 = 6, cterm06 = 14, cterm07 = 12,
    cterm08 = 9, cterm09 = 7, cterm0A = 8, cterm0B = 11,
    cterm0C = 5, cterm0D = 2, cterm0E = 10, cterm0F = 15,
})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'NormalFloat', {})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
    callback = function (_)
        vim.highlight.on_yank()
    end
})
vim.opt.termguicolors = false
