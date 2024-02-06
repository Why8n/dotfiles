-- Reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

function trim(s)
  return (s:gsub("^[\r\n%s]*(.-)[\r\n%s]*$", "%1"))
end

local function is_git_repo()
  local result =  vim.fn.system("git rev-parse --is-inside-work-tree")
  return trim(result) == 'true'
end

-- local function keyMap(builtin)
-- 
-- -- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>si', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = 'Search text' })
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- vim.keymap.set('n', '<leader>sc', function()
-- -- You can pass additional configuration to telescope to change theme, layout, etc.
-- builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
-- winblend = 10,
-- previewer = false,
-- })
-- end, { desc = '[/] Fuzzily search in current buffer' })
-- 
-- vim.keymap.set('n', '<C-n>', function()
-- 
-- if is_git_repo() then
-- builtin.git_files()
-- else
-- builtin.find_files()
-- end
-- end, { desc = 'Find [Git] Files' })
-- 
-- vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
-- end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', 
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end
    }
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            -- enable <C-BS> to delete previous word
            ["<C-h>"] = function()
              -- vim.cmd [[normal! bcw]]
              vim.api.nvim_input "<c-s-w>"
            end,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    }

    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
  end,
  keys = {
    {'<C-n>', 
      function()

        if is_git_repo() then
          require('telescope.builtin').git_files()
        else
          require('telescope.builtin').find_files()
        end
      end,  
      desc = 'Find [Git] Files' 
    },
  }
}

