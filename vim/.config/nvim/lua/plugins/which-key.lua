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

local M = {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")

        local opt = {
            mode = 'n',
            prefix = '<leader>'
        }

        wk.register({
            a = {
                ['name'] = '+action',
                ['c']    = {
                    ['name'] = '+cursor',
                    ['c'] = { '<cmd>set concealcursor = ""<cr>', 'disable concealcursor' },
                    ['n'] = { '<cmd>set cursorcolumn!<cr>', 'toggle cursor column' },
                },
                ['d']    = { '<cmd>windo diffthis<cr>', 'vimdiff (diffthis)' },
            },

            b = {
                name = '+buffer',
                ['1'] = { 'b1', 'buffer 1' },
                ['2'] = { 'b2', 'buffer 2' },
                ['q'] = { '<cmd>q<cr>', 'exit buffer' },
                ['Q'] = { '<cmd>q!<cr>', 'discard buffer' },
                ['s'] = { '<cmd>w !sudo tee %<cr>', 'buffer save in readonly' },
                ['w'] = { '<cmd>w<cr>', 'buffer save' },
            },

            o = {
                name = '+open',
                e    = { '<cmd>Neotree ' .. vim.fn.expand('%:p:h') .. '<cr>', 'open current buffer directory' },
                -- g    = { '<cmd>Neotree ' .. find_git_root() .. '<cr>', 'open directory of git root' },
            },

            v = {
                ['name'] = '+vimrc',
                ['e']    = { '<cmd>edit $MYVIMRC<cr>', 'edit $MYVIMRC' },
                ['o']    = { '<cmd>botright vs $MYVIMRC<cr>', 'edit $MYVIMRC (bottom right)' },
                ['s']    = { '<cmd>source $MYVIMRC<cr>', 'source $MYVIMRC' },
            },

            w = {
                name  = '+windows',
                ['2'] = { '<C-W>v', 'layout-double-columns' },
                ['-'] = { '<C-W>s', 'split-window-below' },
                ['|'] = { '<C-W>v', 'split-window-right' },
                ['='] = { '<C-W>=', 'balance-window' },
                ['?'] = { 'Windows', 'fzf-window' },
                d     = { '<C-W>c', 'delete-window' },
                h     = { '<C-W>h', 'window-left' },
                H     = { '<C-W>5<', 'expand-window-left' },
                j     = { '<C-W>j', 'window-below' },
                J     = { '<cmd>resize +5<cr>', 'expand-window-below' },
                k     = { '<C-W>k', 'window-up' },
                K     = { '<cmd>resize -5<cr>', 'expand-window-up' },
                l     = { '<C-W>l', 'window-right' },
                L     = { '<C-W>5>', 'expand-window-right' },
                s     = {
                    name = '+split-window',
                    j = { '<cmd>rightbelow new<cr>', 'horizontial split (down)' },
                    k = { '<cmd>leftabove new<cr>', 'horizontial split (above)' },
                    l = { '<cmd>rightbelow vnew<cr>', 'vertical split (right)' },
                    h = { '<cmd>leftabove vnew<cr>', 'vertical split (left)' },
                },
                v     = { '<C-W>v', 'split-window-below' },
                w     = { '<C-W>w', 'other-window' },
            },
        }, opt)
    end
}

return { M }
