require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "lua_ls", "gopls" }
})

local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {}

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


