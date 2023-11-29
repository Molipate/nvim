return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        local builtin = require('telescope.builtin')
 
        -- vim.keymap.set('n', '<M-h>', builtin.help_tags, {})
        vim.keymap.set('n', '<M-f>', builtin.live_grep, {})
        vim.keymap.set('n', '<M-g>', builtin.find_files, {})
        vim.keymap.set('n', '<M-b>', builtin.buffers, {})       

        require('telescope').setup({
            defaults = {
                layout_config = {
                    vertical = 0.5
                },
            },
        })
    end,
}
