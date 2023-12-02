
-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

vim.opt.mouse = 'a'                       -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
vim.opt.swapfile = false                  -- Don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true            -- Show line number
vim.opt.showmatch = true         -- Highlight matching parenthesis
vim.opt.foldmethod = 'marker'    -- Enable folding (default 'foldmarker')
vim.opt.colorcolumn = '240'      -- Line lenght marker at 80 columns
vim.opt.splitright = true        -- Vertical split to the right
vim.opt.splitbelow = true        -- Horizontal split to the bottom
vim.opt.cursorline = true        -- display cursor line
vim.opt.hlsearch = true          -- highlight on search
vim.opt.incsearch = true         -- highlight match while typing search pattern
vim.opt.termguicolors = true     -- enable colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = true      -- Autoindent new lines


