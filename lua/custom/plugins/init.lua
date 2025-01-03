-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- FOLDING...................
  -- vim.opt.foldmethod="expr",
  -- vim.opt.foldexpr="nvim_treesitter#foldexpr()"

  -- COMMENT CODE..............
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },

  -- THEMES..................
  {
    'tanvirtin/monokai.nvim',
    lazy = false, -- Ensure it loads immediately
    priority = 1000, -- High priority to load it before other plugins
    config = function()
      require('monokai').setup {
        palette = require('monokai').pro,
      }

      --require('onedark').load()
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false, -- Ensure it loads immediately
    priority = 1000, -- High priority to load it before other plugins
    --config = function()
    --  require('onedark').setup {
    --  style = 'warmer',
    --}

    --require('onedark').load()
    --end,
  },
  -- GIT ............
  {
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- MY KEY BINDINGS..............
  {
    -- Navigate down 40 lines
    vim.api.nvim_set_keymap('n', 'm', '40j', { noremap = true, silent = true }),
    -- Navigate up 40 lines
    vim.api.nvim_set_keymap('n', ',', '40k', { noremap = true, silent = true }),
  },
}
