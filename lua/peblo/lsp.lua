require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'lua_ls', 'gopls', 'clangd' }
})

local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {}

lspconfig.lua_ls.setup {}

lspconfig.clangd.setup {}

lspconfig.pyright.setup {}

lspconfig.gopls.setup {
  setting = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

vim.diagnostic.config({
  virtual_text = true,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.opt_local.cinoptions:append('N-s')
  end,
})


