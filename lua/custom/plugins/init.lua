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

  -- HARPOON.................
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add file to Harpoon' })

      vim.keymap.set('n', '<leader>y', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open Harpoon quick menu' })

      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end, { desc = 'Go to first Harpoon file' })

      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(2)
      end, { desc = 'Go to second Harpoon file' })

      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():select(3)
      end, { desc = 'Go to third Harpoon file' })

      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(4)
      end, { desc = 'Go to fourth Harpoon file' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-&>', function()
        harpoon:list():prev()
      end, { desc = 'Go to previous Harpoon file' })

      vim.keymap.set('n', '<C-S-*>', function()
        harpoon:list():next()
      end, { desc = 'Go to next Harpoon file' })
    end,
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
    vim.api.nvim_set_keymap('n', '<leader>os', ':sp<CR>zz', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<leader>ov', ':vsp<CR>zz', { noremap = true, silent = true }),

    vim.keymap.set('n', '<leader>hh', '<C-w>h', { noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>ll', '<C-w>l', { noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>jj', '<C-w>j', { noremap = true, silent = true }),
    vim.keymap.set('n', '<leader>kk', '<C-w>k', { noremap = true, silent = true }),
  },
}
