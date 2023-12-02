local map = vim.keymap

-- terminal facilities
map.set('t', '<C-C>', '<C-\\><C-n>')

-- navigation
map.set('n', '<C-h>', '<C-W>h')
map.set('n', '<C-j>', '<C-W>j')
map.set('n', '<C-k>', '<C-W>k')
map.set('n', '<C-l>', '<C-W>l')

-- save current buffer with Ctrl + s
map.set('n', '<C-s>', ':w<CR>')      -- idle
map.set('i', '<C-s>', '<ESC>:w<CR>') -- editing

-- map.set('n', '<C-q>', ':bnext<CR>') -- iterate over buffer



