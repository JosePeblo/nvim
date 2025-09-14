require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'lua_ls',
    'clangd',
    'pyright',
    'jdtls',
    'ts_ls',
    'emmet_language_server',
    'vue_ls',
    'cssls',
    'gopls',
  }
}

local mason_reg = require('mason-registry')

local lspconfig = require('lspconfig')
local root_dir = vim.fn.getcwd()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
  end
}

lspconfig.pyright.setup {}

lspconfig.jdtls.setup {
  --   cmd = {
  --     'jdtls',
  --     '-data', root_dir .. '/.workspace',
  --   },

  --   root_dir = root_dir,

  --   settings = {
  --     java = {
  --       project = {
  --         referencedLibraries = {
  --           'lib/**/*.jar',
  --         },
  --       },
  --     },
  --   },

  --   init_options = {
  --     workspaceFolders = {
  --       {
  --         uri = vim.uri_from_fname(root_dir),
  --         name = 'tremendous-trovolo',
  --       },
  --     },
  --   },

}

local volarpath = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason/packages/node_modules/@vue/language-server')

lspconfig.ts_ls.setup {
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = volarpath,
        languages = { 'vue' },
      },
    },
    preferences = {
      quotePreference = 'single',
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

lspconfig.emmet_language_server.setup {
  capabilities = capabilities,
  filetypes = { 'html', 'vue' },
}

-- lspconfig.volar.setup {
--   capabilities = capabilities,
--   init_options = {
--     vue = {
--       hybridMode = true,
--     }
--   }
-- }

lspconfig.cssls.setup {
  capabilities = capabilities,
  filetypes = { 'css', 'scss', 'less', 'vue' },
}

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

lspconfig.clangd.setup {
  capabilities = capabilities
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

vim.filetype.add({
  extension = {
    tmpl = 'html',
  }
})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end, { buffer = bufnr })
  end,
})

