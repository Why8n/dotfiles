-- Reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

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

    { '<leader>si', "<cmd>lua require('telescope.builtin').builtin()<cr>" ,  desc = '[S]earch [S]elect Telescope' },
    { '<leader>sg', "<cmd>lua require('telescope.builtin').git_files()<cr>",  desc = 'Search [G]it [F]iles' },
    { '<leader>sf', "<cmd>lua require('telescope.builtin').find_files()<cr>",  desc = '[S]earch [F]iles' },
    { '<leader>st', "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = 'Search text' },
    { '<leader>sw', "<cmd>lua require('telescope.builtin').grep_string()<cr>",  desc = '[S]earch current [W]ord' },
    { '<leader>so', "<cmd>lua require('telescope.builtin').oldfiles()<cr>",  desc = '[?] Find recently opened files' },
    { '<leader>sb', "<cmd>lua require('telescope.builtin').buffers()<cr>",  desc = '[ ] Find existing buffers' },
    { '<leader>s/', telescope_live_grep_open_files,  desc = '[S]earch [/] in Open Files' },
    { '<leader>sh', "<cmd>lua require('telescope.builtin').help_tags()<cr>",  desc = '[S]earch [H]elp' },
    { '<leader>sd', "<cmd>lua require('telescope.builtin').diagnostics()<cr>",  desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', "<cmd>lua require('telescope.builtin').resume()<cr>",  desc = '[S]earch [R]esume' },
    { '<leader>sc', 
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,  
      desc = '[/] Fuzzily search in current buffer' 
    },

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

    { '<leader>sG', live_grep_git_root , desc = '[S]earch by [G]rep on Git Root' }
  }
}

