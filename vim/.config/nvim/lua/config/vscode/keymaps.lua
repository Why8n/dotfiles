local keymap = vim.keymap
local vscode = require('vscode-neovim')

local function split(direction, file)
  local dirCmdMap = {
    h = 'workbench.action.splitEditorLeft',
    l = 'workbench.action.splitEditorRight',
    j = 'workbench.action.splitEditorDown',
    k = 'workbench.action.splitEditorUp'
  }

  cmd = dirCmdMap[direction] or 'workbench.action.splitEditorRight'
  vscode.call(cmd)
end

-- Better Navigation
keymap.set({ 'n', 'x' }, '<C-j>',
  function()
    vscode.action('workbench.action.navigateDown')
  end, { noremap = true, silent = true, expr = true })

keymap.set({ 'n', 'x' }, '<C-k>',
  function()
    vscode.action('workbench.action.navigateUp')
  end, { noremap = true, silent = true, expr = true })

keymap.set({ 'n', 'x' }, '<C-h>',
  function()
    vscode.action('workbench.action.navigateLeft')
  end, { noremap = true, silent = true, expr = true })

keymap.set({ 'n', 'x' }, '<C-l>',
  function()
    vscode.action('workbench.action.navigateRight')
  end, { noremap = true, silent = true, expr = true })

keymap.set('n', '<leader>gb',
  function()
    vscode.action('workbench.action.navigateBack')
  end, { noremap = true, expr = true })

keymap.set('n', '<leader>gf',
  function()
    vscode.action('workbench.action.navigateForward')
  end, { noremap = true, expr = true })

keymap.set('n', '<leader>gr',
  function()
    vscode.action('editor.action.goToReferences')
  end, { noremap = true, expr = true })

-- windows
keymap.set('n', '<leader>q',
  function()
    vscode.call('workbench.action.closeActiveEditor')
  end, { noremap = true, expr = true })

keymap.set('n', '<leader>w',
  function()
    vscode.call('workbench.action.files.save')
  end, { noremap = true, expr = true }
)

keymap.set('n', '<leader>sl',
  function()
    split('l', '__vscode_new__')
  end, { noremap = true, expr = true })

keymap.set('n', '<leader>sh',
  function()
    split('h', '__vscode_new__')
  end, { noremap = true, expr = true })
keymap.set('n', '<leader>sj',
  function()
    split('j', '__vscode_new__')
  end, { noremap = true, expr = true })
keymap.set('n', '<leader>sk',
  function()
    split('k', '__vscode_new__')
  end, { noremap = true, expr = true })

keymap.set('n', '<leader><leader>o', '<cmd>Only!<cr>')

-- explorer
keymap.set('n', '<leader>e',
  function()
    vscode.call('workbench.action.toggleSidebarVisibility')
  end, { noremap = true, expr = true })
-- terminal
keymap.set('n', '<leader>tm',
  function()
    -- vscode.call('workbench.action.terminal.toggleTerminal')
    vscode.call('workbench.action.togglePanel')
  end, { noremap = true, expr = true })

-- format
keymap.set('n', '<leader>fm',
  function()
    vscode.call('editor.action.formatDocument')
  end, { noremap = true, expr = true })

local format = vscode.to_op(function(ctx)
  vscode.action("editor.action.formatSelection", { range = ctx.range })
end)

keymap.set({ 'x' }, '<leader>fm', format, { expr = true })

-- comment
local comment = vscode.to_op(function(ctx)
  vscode.action('editor.action.commentLine', { range = ctx.range })
end)

keymap.set('x', '<leader>cc', comment, { noremap = true, expr = true })
keymap.set('n', '<leader>cc',
  function()
    return comment() .. '_'
  end, { noremap = true, expr = true })

local uncomment = vscode.to_op(function(ctx)
  vscode.action('editor.action.removeCommentLine', { range = ctx.range })
end)
keymap.set('x', '<leader>cu', uncomment, { noremap = true, expr = true })
keymap.set('n', '<leader>cu',
  function()
    return uncomment() .. '_'
  end, { noremap = true, expr = true })
