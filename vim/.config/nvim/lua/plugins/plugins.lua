return {
    {
        'Why8n/enhanceOPM',
        event = 'VeryLazy'
    },

    {
        'Why8n/autopaste',
        cmd = {
            'PasteInNormalMode',
            'PasteInInsertMode',
            'PasteInVisualMode'
        },
        keys = {
            { '<C-v>', mode = { 'c' }, '<C-r>+'},
            { '<C-v>', mode = { 'n' }, '<cmd>PasteInNormalMode +<cr>'},
            { '<C-v>', mode = { 'i' }, '<cmd>PasteInInsertMode +<cr>'},
            -- { '<C-v>', mode = { 'x' }, '<cmd><C-u>PasteInVisualMode +<cr>'}
        },
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
            { "<leader><leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash search character" },
        },
    },

    {
        'numToStr/Comment.nvim',
        opts = {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = '<leader>cc',
                ---Block-comment toggle keymap
                block = '<leader>bc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = '<leader>cc',
                ---Block-comment keymap
                block = '<leader>cb',
            },
        },
        keys = {
            { '<leader>cc', mode = {'n', 'x'}},
            {'<leader>cb', mode = {'x'}},
            { '<C-_>', mode = {'x'}, '<Plug>(comment_toggle_linewise_visual)' },
            { '<leader>cu', mode = {'x'}, '<Plug>(comment_toggle_linewise_visual)' },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = true,
        cmd = {
            'Neotree',
            'Neotree toggle'
        },
        keys = {
            { [[<leader>e]], mode = { 'n', 'x' }, [[<cmd>Neotree toggle<cr>]]},
        }
    },

    {
        'keaising/im-select.nvim',
        event = 'VeryLazy',
        config = function()
            require("im_select").setup({})
        end,
    },
    {
        'Vonr/align.nvim',
        branch = "v2",
        lazy = true,
        keys = {
            {
                '<leader>a1', 
                mode = { 'x' },
                noremap = true,
                silent = true,
                function() 
                    require'align'.align_to_char({
                        length = 1,
                    })
                end, 
                desc = 'aligns to 1 character'
            },
            {
                '<leader>a2', 
                mode = { 'x' },
                noremap = true,
                silent = true,
                function() 
                    require'align'.align_to_char({
                        preview = true,
                        length = 2,
                    })
                end, 
                desc = 'aligns to 2 characters with previews' 
            },
            {
                '<leader>as', 
                mode = { 'x' },
                noremap = true,
                silent = true,
                function() 
                    require'align'.align_to_string({
                        preview = true,
                        regex = false,
                    })
                end, 
                desc = 'aligns to a string with previews' 
            },
            {
                '<leader>ar', 
                mode = { 'x' },
                noremap = true,
                silent = true,
                function() 
                    require'align'.align_to_string({
                        preview = true,
                        regex = true,
                    })
                end, 
                desc = 'aligns to a vim regex with previews' 
            },
        }
    }
}
