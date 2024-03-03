-- Reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

function trim(s)
    return (s:gsub("^[\r\n%s]*(.-)[\r\n%s]*$", "%1"))
end

local function is_git_repo()
    local result = vim.fn.system("git rev-parse --is-inside-work-tree")
    return trim(result) == 'true'
end

return {
    'nvim-telescope/telescope.nvim',
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
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                }
            }
        }

        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
    end,
    keys = {
        {
            '<C-n>',
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
