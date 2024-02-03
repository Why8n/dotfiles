return {
  {
    'Why8n/enhanceOPM',
    event = 'VeryLazy'
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

}
