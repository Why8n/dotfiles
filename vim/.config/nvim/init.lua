require('basic.options')
require('basic.keymaps')
if vim.g.vscode then
    require('vscode.options')
    require('vscode.keymaps')
else
    -- load plugin manager first
    require('setup')
end

