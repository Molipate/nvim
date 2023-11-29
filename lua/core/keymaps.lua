local map = vim.keymap

-- Reload configuration without restart nvim
map.set('n', '<leader>r', ':so %<CR>')

-- save all buffers with Ctrl + Shift + s
-- map.set('n', '<C-<Shift>-s>', ':wa<CR>')

-- save current buffer with Ctrl + s
map.set('n', '<C-s>', ':w<CR>')      -- idle
map.set('i', '<C-s>', '<ESC>:w<CR>') -- editing

-- delete current buffer with Ctrl + w
map.set('n', '<C-w>', ':bdelete %<CR>')

-- map.set('n', '<C-q>', ':bnext<CR>') -- iterate over buffer

