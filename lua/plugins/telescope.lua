return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        {
            "nvim-telescope/telescope-project.nvim",
            config = function()
                require("telescope").load_extension("project")
            end,
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            config = function()
                require("telescope").load_extension("frecency")
            end,
        },
    },
    config = function()
        local builtin = require('telescope.builtin')
 
        -- vim.keymap.set('n', '<M-h>', builtin.help_tags, {})
        vim.keymap.set('n', '<M-F>', "<Cmd>Telescope frecency<CR>", {})
        vim.keymap.set('n', '<M-f>', builtin.live_grep, {})
        vim.keymap.set('n', '<M-g>', builtin.find_files, {})
        vim.keymap.set('n', '<M-b>', builtin.buffers, {})       

        require('telescope').setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.8,
                    height = 0.8,
                    prompt_position = "top",
                },
            },
            extensions = {
                frecency = {
                    show_scores = true,
                    ignore_patterns = {"*.git/*"},
                },
                project = {
                    base_dirs = {
                        "~/work",
                    },
                    -- default for on_project_selected = find project files
                    on_project_selected = function(prompt_bufnr)
                        vim.cmd(":cd " .. prompt_bufnr .. "<CR>")
                    end,
                }
            }
        })
    end,
}
