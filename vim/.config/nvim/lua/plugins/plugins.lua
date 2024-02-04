return {
  {
    'Why8n/enhanceOPM',
    event = 'VeryLazy'
  },

  {
    'Why8n/autopaste',
    cmd = {
      'PasteInNormalMode',
      'PasteInInsertMode',
      'PasteInVisualMode'
    },
    keys = {
      { '<C-v>', mode = { 'c' }, '<C-r>+'},
      { '<C-v>', mode = { 'n' }, '<cmd>PasteInNormalMode +<cr>'},
      { '<C-v>', mode = { 'i' }, '<cmd>PasteInInsertMode +<cr>'},
      -- { '<C-v>', mode = { 'x' }, '<cmd><C-u>PasteInVisualMode +<cr>'}
    },
  },

  {
    'tpope/vim-surround',
    event = 'VeryLazy',
    dependencies = {
      'tpope/vim-repeat'
    }
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = { -- this is equalent to setup({}) function
      enable_check_bracket_line = true,
    }
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          -- disable f, F, t, T 
          enabled = false
        }
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader><leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>bc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>cc',
        ---Block-comment keymap
        block = '<leader>cb',
      },
    },
    keys = {
      { '<leader>cc', mode = {'n', 'x'}},
      {'<leader>cb', mode = {'x'}},
      { '<C-_>', mode = {'x'}, '<Plug>(comment_toggle_linewise_visual)' },
      { '<leader>cu', mode = {'x'}, '<Plug>(comment_toggle_linewise_visual)' },
    },
  }
}
