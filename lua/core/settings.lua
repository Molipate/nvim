-- disable default explorer at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- indentation and tabs
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = true      -- Autoindent new lines

-- neovim UI
vim.opt.number = true            -- Show line number
vim.opt.showmatch = true         -- Highlight matching parenthesis
vim.opt.splitright = true        -- Vertical split to the right
vim.opt.splitbelow = true        -- Horizontal split to the bottom
vim.opt.cursorline = true        -- display cursor line
vim.opt.hlsearch = true          -- highlight on search
vim.opt.incsearch = true         -- highlight match while typing search pattern
vim.opt.termguicolors = true     -- enable colors

