local packer = require('packer')

vim.cmd.packadd("cfilter")

--plugins
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' --packer
    use 'williamboman/mason.nvim' --mason (lsps)
    use 'williamboman/mason-lspconfig.nvim' -- lspconfig for mason (lsps)
    use 'nvim-lua/popup.nvim' --popup api
    use 'nvim-lua/plenary.nvim' --lua functions for vim
    use 'hrsh7th/nvim-cmp' --completion
    use 'hrsh7th/cmp-buffer' -- buffer completion
    use 'hrsh7th/cmp-path' -- path completion
    use 'hrsh7th/cmp-cmdline' -- cmdline completion
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'hrsh7th/cmp-nvim-lsp' -- lsp completion
    use 'saadparwaiz1/cmp_luasnip' --luasnip completion

    use 'nvim-tree/nvim-web-devicons' --devicons

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --oil
    use {
        "stevearc/oil.nvim",
        requires = { 'nvim-tree/nvim-web-devicons'},
        config = function()
            local oilVal = require("oil")
            oilVal.setup({
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
                }
            })
        end,
    }

    -- snippets
    use 'L3MON4D3/LuaSnip' --snippet engine
    use 'rafamadriz/friendly-snippets' -- included snippets
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter'
    }
    -- comment/uncomment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- git
    use('tpope/vim-fugitive')
    use('chentoast/marks.nvim')
    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use('tpope/vim-surround')
    use {
        "windwp/nvim-ts-autotag",
        config =  function() require("nvim-ts-autotag").setup {} end
    }
end)
