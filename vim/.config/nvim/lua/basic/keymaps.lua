vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set('n', '<leader>w', ':w<CR>') 
keymap.set('n', '<leader>q', ':q<CR>') 
keymap.set('n', '<C-a>', 'ggVG$')
-- format
keymap.set('n', '<leader>fm', "gg=G''")
keymap.set('v', '<leader>fm', '=')

-- Map Ctrl-Backspace to delete the previous word in insert mode.
-- keymap.set('i','<C-BS>', '<C-W>')
-- <C-BS> is the same as <C-h>
keymap.set('i','<C-h>', '<C-w>')
keymap.set('c', '<C-h>', '<C-w>') 

-- Map Ctrl+Delete to delete the previous word in insert mode
-- keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- copy & paste
keymap.set('v', '<C-c>', '"+y')
-- keymap.set('n', '<C-v>', '"+p')
-- keymap.set('i', '<C-v>', '<C-r><C-p>+')
-- keymap.set('v', '<C-v>', '"+p')

keymap.set('n', '<leader>sv', '<C-w>v') -- 水平新增窗口 
keymap.set('n', '<leader>sh', '<C-w>s') -- 垂直新增窗口


-- 取消高亮
keymap.set('n', '<leader><CR>', ':nohl<CR>')

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

