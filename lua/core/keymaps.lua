local map = vim.keymap

-- terminal facilities
map.set('t', '<M-q>', '<C-\\><C-n>') -- exit terminal with Alt-q

-- navigation
map.set('n', '<M-h>', '<C-W>h')
map.set('n', '<M-j>', '<C-W>j')
map.set('n', '<M-k>', '<C-W>k')
map.set('n', '<M-l>', '<C-W>l')

-- save current buffer with Alt + s
map.set('n', '<M-s>', ':w<CR>')      -- idle
map.set('i', '<M-s>', '<ESC>:w<CR>') -- editing


-- buffer operations
map.set('n', '<M-w>', ':bd!<CR>')
