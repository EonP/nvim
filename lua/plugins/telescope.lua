return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            -- Setup with extensions
            telescope.setup({
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({})
                }
            })

            -- Load ui-select extension
            telescope.load_extension("ui-select")

            -- Keymaps
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' }) 
        end
    },
}


