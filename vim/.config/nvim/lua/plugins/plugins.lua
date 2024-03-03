local M = {
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
            { '<C-v>', mode = { 'c' }, '<C-r>+' },
            { '<C-v>', mode = { 'n' }, '<cmd>PasteInNormalMode +<cr>' },
            { '<C-v>', mode = { 'i' }, '<cmd>PasteInInsertMode +<cr>' },
            -- { '<C-v>', mode = { 'x' }, '<cmd><C-u>PasteInVisualMode +<cr>'}
        },
    },

    {
        'folke/flash.nvim',
        opts = {
            modes = {
                char = {
                    -- disable f, F, t, T
                    enabled = false
                },
                search = {
                    -- disable search mode
                    enabled = false
                }
            },
        },
        keys = {
            -- disable keys
            { 's', mode = { "n", "x", "o" }, false },
            { 'S', mode = { "n", "x", "o" }, false },
            {
                "<localleader><localleader>s",
                mode = { "n", "x", "o" },
                function() require("flash").jump() end,
                desc = "Flash search character"
            },
        }
    },

    {
        'Vonr/align.nvim',
        branch = "v2",
        lazy = true,
        keys = {
            {
                '<localleader>a1',
                mode = { 'x' },
                noremap = true,
                silent = true,
                function()
                    require 'align'.align_to_char({
                        length = 1,
                    })
                end,
                desc = 'aligns to 1 character'
            },
            {
                '<localleader>a2',
                mode = { 'x' },
                noremap = true,
                silent = true,
                function()
                    require 'align'.align_to_char({
                        preview = true,
                        length = 2,
                    })
                end,
                desc = 'aligns to 2 characters with previews'
            },
            {
                '<localleader>as',
                mode = { 'x' },
                noremap = true,
                silent = true,
                function()
                    require 'align'.align_to_string({
                        preview = true,
                        regex = false,
                    })
                end,
                desc = 'aligns to a string with previews'
            },
            {
                '<localleader>ar',
                mode = { 'x' },
                noremap = true,
                silent = true,
                function()
                    require 'align'.align_to_string({
                        preview = true,
                        regex = true,
                    })
                end,
                desc = 'aligns to a vim regex with previews'
            },
        },
    },

    {
        'keaising/im-select.nvim',
        event = 'VeryLazy',
        config = function()
            require("im_select").setup({})
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { [[<localleader>e]], mode = { 'n', 'x' }, [[<cmd>Neotree toggle<cr>]] },
        }
    },

    {
        'tpope/vim-surround',
        event = 'VeryLazy',
        dependencies = {
            'tpope/vim-repeat'
        }
    },
}


return { M }
