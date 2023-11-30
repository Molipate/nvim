local map = vim.keymap

-- Reload configuration without restart nvim
map.set('n', '<leader>r', ':so %<CR>')

-- save current buffer with Ctrl + s
map.set('n', '<C-s>', ':w<CR>')      -- idle
map.set('i', '<C-s>', '<ESC>:w<CR>') -- editing

-- map.set('n', '<C-q>', ':bnext<CR>') -- iterate over buffer

