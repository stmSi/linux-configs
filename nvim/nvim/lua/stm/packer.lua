-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tjdevries/sPoNGe-BoB.NvIm'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'folke/tokyonight.nvim'
      use("sbdchd/neoformat")

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")
    use("airblade/vim-gitgutter")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    use {
      'gorbit99/codewindow.nvim',
      config = function()
        local codewindow = require('codewindow')
        codewindow.setup()
        codewindow.apply_default_keybinds()
      end,
    }

    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Golang Debuging
    use('mfussenegger/nvim-dap')
    use('leoluz/nvim-dap-go')
    use('rcarriga/nvim-dap-ui')

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

    -- All the things
    use("neovim/nvim-lspconfig")
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/eslint.nvim')
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Testing out jupyter ascending
    use('untitled-ai/jupyter_ascending.vim')
    use('bfredl/nvim-ipy')
    use('hkupty/iron.nvim')
    use('GCBallesteros/jupytext.vim')
    -- use('GCBallesteros/vim-textobj-hydrogen')

    -- Primeagen doesn"t create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("mbbill/undotree")

    use "terrortylor/nvim-comment"

    use "norcalli/nvim-colorizer.lua"

    -- Coc
    -- use {'neoclide/coc.nvim', branch = 'release'}
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

    use{ 'anuvyklack/pretty-fold.nvim',
     config = function()
        require('pretty-fold').setup()
     end
    }

    use{ 'neoclide/vim-jsx-improve' }
    use { 'prettier/vim-prettier' } 

end)
