return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
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
        local actions = require('telescope.actions')
        local project_actions = require("telescope._extensions.project.actions") 

        vim.keymap.set('n', '<M-H>', builtin.help_tags, {})
        vim.keymap.set('n', '<M-F>', "<Cmd>Telescope frecency<CR>", {})
        vim.keymap.set('n', '<M-f>', builtin.live_grep, {})
        vim.keymap.set('n', '<M-g>', builtin.find_files, {})
        vim.keymap.set('n', '<M-b>', "<Cmd>Telescope buffers<CR><ESC>", {})      
        vim.keymap.set('n', '<M-p>', "<Cmd>Telescope project<CR><ESC>", {})

        require('telescope').setup({
            defaults = {
                mappings = {
                    n = {
                        ["d"] = actions.delete_buffer
                    },
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                },
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
                    base_dir = {
                        "~/work",
                    },
                }
            }
        })
    end,
}
