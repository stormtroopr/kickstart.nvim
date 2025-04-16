return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = { 'terraformls', 'tflint', 'omnisharp' },
    }

    local lspconfig = require 'lspconfig'

    -- Setup LSPs
    lspconfig.terraformls.setup {}
    lspconfig.tflint.setup {}
    lspconfig.omnisharp.setup {
      cmd = {
        'dotnet',
        -- vim.fn.expand '~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll',
        vim.fn.expand 'C:\\Users\\marcu\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.dll',
      },
      enable_editorconfig_support = true,
    }

    -- add tsserver config
    lspconfig['ts_ls'].setup {
      -- optional config
    }
  end,
}
