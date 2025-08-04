
vim.cmd.packadd("cfilter")

--plugins
return {
    { 'williamboman/mason.nvim', opts = {}}, --mason (lsps)
    'williamboman/mason-lspconfig.nvim', -- lspconfig for mason (lsps)
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    'nvim-lua/popup.nvim', --popup api
    'nvim-lua/plenary.nvim', --lua functions for vim
    'hrsh7th/nvim-cmp', --completion
    'hrsh7th/cmp-buffer', -- buffer completion
    'hrsh7th/cmp-path', -- path completion
    'hrsh7th/cmp-cmdline', -- cmdline completion
    'neovim/nvim-lspconfig', -- enable LSP
    'hrsh7th/cmp-nvim-lsp', -- lsp completion
    'saadparwaiz1/cmp_luasnip', --luasnip completion

    'nvim-tree/nvim-web-devicons', --devicons

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    -- snippets
    'L3MON4D3/LuaSnip', --snippet engine
    'rafamadriz/friendly-snippets', -- included snippets
    -- fuzzy finder
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- git
    'tpope/vim-fugitive',
    'chentoast/marks.nvim',
    -- autopairs
    {
        "windwp/nvim-autopairs", opts = {}
    },
    'tpope/vim-surround',
    {
        "windwp/nvim-ts-autotag", opts = {}
    },

    --oil
    {
        "stevearc/oil.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons'},
        config = function()
            local tbl = require("oil")
            tbl.setup({
                columns = {
                    "size",
                    "permissions",
                    "icon",
                    "mtime"
                },
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true
                },
                -- Window-local options to use for oil buffers
                win_options = {
                    wrap = false,
                    signcolumn = "yes",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = "nvic",
                    winbar = "%{v:lua.require('oil').get_current_dir()}"
                },
                keymaps = {
                    vim.keymap.set('n', '<leader>pf', function()
                        require('telescope.builtin').find_files{cwd = tbl.get_current_dir()}
                    end)
                }
            })
        end
    }
}

