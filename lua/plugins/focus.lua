return {
	"nvim-focus/focus.nvim",
	config = function()
		vim.keymap.set("n", "<C-S-H>", ":FocusSplitLeft <CR>")
		vim.keymap.set("n", "<C-S-J>", ":FocusSplitDown <CR>")
		vim.keymap.set("n", "<C-S-K>", ":FocusSplitUp <CR>")
		vim.keymap.set("n", "<C-S-L>", ":FocusSplitRight <CR>")
		vim.keymap.set("n", "<C-o>", ":FocusEqualise <CR> :FocusToggle <CR> :FocusToggle <CR>")
		vim.keymap.set("n", "<C-p>", ":FocusMaximise <CR>")
		vim.keymap.set("n", "<C-n>", ":FocusSplitNicely <CR>")
		require("focus").setup({
			split = {
				bufnew = false,
			},
		})
	end,
}
