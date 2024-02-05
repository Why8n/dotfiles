
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
return {
  'folke/which-key.nvim',
  -- event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    popup_mappings = {
      scroll_down = '<c-d>', -- binding to scroll down inside the popup
      scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },

    triggers = 'auto', -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_nowait = {
      -- marks
      "`",
      "'",
      "g`",
      "g'",
      -- registers
      '"',
      "<c-r>",
      -- spelling
      "z=",
    },
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for keymaps that start with a native binding
      i = { "j", "k" },
      v = { "j", "k" },
    },
  },
  cmd = { 'WhichKey' },
  keys = { '<localleader>', mode = { 'n' }, '<cmd>WhichKey <localleader><cr>' },
  config = function()
    local wk = require("which-key")

    local opt = {
      mode = 'n',
      prefix = '<localleader>' 
    }

    wk.register({
      a = {
        ['name'] = '+action'                 ,
        ['c']    = {
          ['name']= '+cursor'               ,
          ['c'] = { '<cmd>set concealcursor = ""<cr>' , 'disable concealcursor' } ,
          ['n'] = { '<cmd>set cursorcolumn!<cr>'     , 'toggle cursor column' }  ,
        },
        ['d']    = { '<cmd>windo diffthis<cr>'        , 'vimdiff (diffthis)' }    ,
      },

      b = {
        name = '+buffer'        ,
        ['1'] = {'b1'               , 'buffer 1'}                    ,
        ['2'] = {'b2'               , 'buffer 2'}                    ,
        ['d'] = {'bd'               , 'delete-buffer'}               ,
        ['f'] = {'bfirst'           , 'first-buffer'}                ,
        ['l'] = {'blast'            , 'last-buffer'}                 ,
        ['n'] = {'bnext'            , 'next-buffer'}                 ,
        ['o'] = {
          name= '+open/only...' ,
          ['?'] = {'Buffers'        , 'fzf-buffer'}                  ,
          ['o'] = {'<cmd>only<cr>'          , 'buffer only'}                 ,
          ['O'] = {'<cmd>BufOnly<cr>'       , 'buffer only & remove others'} ,
        }                        ,
        ['p'] = {'bprevious'        , 'previous-buffer'}             ,
        ['q']=  {'<cmd>q<cr>'               , 'exit buffer'}                 ,
        ['Q'] = {'<cmd>q!<cr>'              , 'discard buffer'}              ,
        ['s'] = {'<cmd>w !sudo tee %<cr>'   , 'buffer save in readonly'}     ,
        ['w'] = {'<cmd>w<cr>'               , 'buffer save'}                 ,
      },

      o = {
        name = '+open'                  ,
        e    = { '<cmd>CocCommand explorer<cr>'  , 'coc-explorer'               }, -- todo
        q    = { '<cmd>copen<cr>'                 , 'open-quickfix'              },
        v    = { '<cmd>botright vs $MYVIMRC<cr>' , 'edit myvimrc(bottom right)' },
      },

      s = {
        name = '+search',
        b = {
          name = '+buffers',
          b = { "<cmd>lua require('telescope.builtin').buffers()<cr>",   '[ ] Find existing buffers' },
          w = { 
            function()
              -- You can pass additional configuration to telescope to change theme, layout, etc.
              require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 9,
                previewer = false,
              })
            end, 
            '[/] Fuzzily search buffer word'
          },
        },
        c = { function() require("flash").jump() end, "Flash search character" },
        d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>",   '[S]earch [D]iagnostics' },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>",  '[S]earch [F]iles' },
        g = { "<cmd>lua require('telescope.builtin').git_files()<cr>",   'Search [G]it [F]iles' },
        G = { live_grep_git_root , '[S]earch by [G]rep on Git Root' },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", '[S]earch [H]elp' },
        i = { "<cmd>lua require('telescope.builtin').builtin()<cr>" ,  '[S]earch [S]elect Telescope' },
        o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>",   '[?] Find recently opened files' },
        r = { "<cmd>lua require('telescope.builtin').resume()<cr>",   '[S]earch [R]esume' },
        t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>",   'Search text' },
        w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", '[S]earch current [W]ord' },
        ['/'] = { telescope_live_grep_open_files,  '[S]earch [/] in Open Files' },
      },

      v = {
        ['name'] = '+vimrc'                 ,
        ['e']    = { '<cmd>edit $MYVIMRC<cr>'        , 'edit $MYVIMRC' }                ,
        ['o']    = { '<cmd>botright vs $MYVIMRC<cr>' , 'edit $MYVIMRC (bottom right)' } ,
        ['s']    = { '<cmd>source $MYVIMRC<cr>'      , 'source $MYVIMRC' }              ,
      },

      w = {
        name = '+windows',
        ['2']    = { '<C-W>v'     , 'layout-double-columns' },
        ['-'] =    { '<C-W>s'     , 'split-window-below'    },
        ['|']    = { '<C-W>v'     , 'split-window-right'    },
        ['=']    = { '<C-W>='     , 'balance-window'        },
        ['?']    = { 'Windows'    , 'fzf-window'            },
        d = { '<C-W>c'     , 'delete-window'         },
        h    = { '<C-W>h'     , 'window-left'           },
        H    = { '<C-W>5<'    , 'expand-window-left'    },
        j    = { '<C-W>j'     , 'window-below'          },
        J    = { '<cmd>resize +5<cr>'  , 'expand-window-below'   },
        k    = { '<C-W>k'     , 'window-up'             },
        K    = { '<cmd>resize -5<cr>'  , 'expand-window-up'      },
        l    = { '<C-W>l'     , 'window-right'          },
        L    = { '<C-W>5>'    , 'expand-window-right'   },
        s = {
          name= '+split-window'   ,
          j = { '<cmd>rightbelow new<cr>'   , 'horizontial split (down)'  },
          k = { '<cmd>leftabove new<cr>'   , 'horizontial split (above)' },
          l = { '<cmd>rightbelow vnew<cr>' , 'vertical split (right)'    },
          h = { '<cmd>leftabove vnew<cr>'   , 'vertical split (left)'    },
        },
        v    = { '<C-W>v'     , 'split-window-below'    },
        w = { '<C-W>w', 'other-window'},
      },
    }, opt)
  end
}

