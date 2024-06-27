local map = vim.keymap

-- exit terminal
map.set("t", "<C-q>", "<C-\\><C-n>")

-- save current buffer
map.set("n", "<C-s>", ":w<CR>")      -- in normal mode
map.set("i", "<C-s>", "<ESC>:w<CR>") -- in edit mode

-- windows navigation
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-l>", "<C-w>l")

-- neo-tree
map.set("n", "<C-e>", ":Neotree source=filesystem position=right focus<CR>")

-- barbar
map.set('n', '<TAB>', '<Cmd>BufferNext<CR>')   -- Move to next

-- close buffer commands
map.set("n", "<leader>ww", ":BufferWipeout<CR>")
map.set("n", "<leader>wa", ":BufferCloseAllButCurrent<CR>")

