vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap

-- format
keymap.set('n', '<leader>fm', "gg=G''")
keymap.set('v', '<leader>fm', '=')

-- Fast quiting without saving
keymap.set('n', '<leader>q', ':q<cr>') 
keymap.set('n', '<leader>w', ':w<cr>') 
keymap.set('n', '<leader><leader>o', ':only<cr>')

-- Function to close all buffers except the current one
local function closeOtherBuffers()
    local current_bufnr = vim.fn.bufnr('%')

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if bufnr ~= current_bufnr then
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end
end

-- delete all buffers except current
keymap.set('n', '<leader><leader>O', closeOtherBuffers, { noremap = true })

-- Switching windows
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')
keymap.set('n', '<C-h>', '<C-w>h')

-- Moving windows
keymap.set('n', '<leader>L', '<C-w>L', { noremap = true })
keymap.set('n', '<leader>H', '<C-w>H', { noremap = true })
keymap.set('n', '<leader>K', '<C-w>K', { noremap = true })
keymap.set('n', '<leader>J', '<C-w>J', { noremap = true })

-- open a blank new file on the right panel
keymap.set('n', '<leader>sl', ':rightbelow vnew<cr>', { noremap = true })
keymap.set('n', '<leader>sh', ':leftabove vnew<cr>', { noremap = true })
keymap.set('n', '<leader>sj', ':rightbelow new<cr>', { noremap = true })
keymap.set('n', '<leader>sk', ':leftabove new<cr>', { noremap = true })

-- copy & paste
keymap.set('v', '<C-c>', '"+y')
-- keymap.set('n', '<C-v>', '"+p')
-- keymap.set('i', '<C-v>', '<C-r><C-p>+')
keymap.set('v', '<C-v>', '"+p')
keymap.set('n', '<C-x>', '"+dd', { noremap = true, silent = true })
keymap.set('v', '<C-x>', '"+d', { noremap = true, silent = true })

-- no highlight search 
keymap.set('n', '<leader><CR>', ':nohl<CR>')

-- move cursor line up & down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- select all
keymap.set('n', '<C-a>', 'ggVG$')

-- Map Ctrl-Backspace to delete the previous word in insert mode.
-- keymap.set('i','<C-BS>', '<C-W>')
-- <C-BS> is the same as <C-h>
keymap.set('i','<C-h>', '<C-w>')
keymap.set('c', '<C-h>', '<C-w>') 

-- set anchor
keymap.set('n', '<leader><leader>m', '<esc>/<><cr>:nohlsearch<cr>2s', { noremap = true, silent = true })








