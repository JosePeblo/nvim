local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {}

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

