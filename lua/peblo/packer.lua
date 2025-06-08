-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
          -- Optionally configure and load the colorscheme
          -- directly inside the plugin declaration.
          vim.g.gruvbox_material_enable_italic = true
          vim.cmd.colorscheme('gruvbox-material')
      end
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  })

  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

--   use('folke/neodev.nvim')
-- 
--   use {
--     'folke/lazydev.nvim',
--     ft = 'lua', -- only load on lua files
--     opts = {
--       library = {
--         -- See the configuration section for more details
--         -- Load luvit types when the `vim.uv` word is found
--         { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
--       },
--     },
--     config = function()
--       require('lazydev').setup()
--     end,
--   }


end)

