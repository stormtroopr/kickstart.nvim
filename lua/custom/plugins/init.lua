-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
}
