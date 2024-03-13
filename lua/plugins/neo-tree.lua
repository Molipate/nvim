return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- use a fixed version to avoid breaking changes
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- keybindings
		vim.keymap.set("n", "<C-B>", ":Neotree position=float source=buffers action=focus <CR>")
		vim.keymap.set("n", "<C-E>", ":Neotree position=float source=filesystem reveal=true action=focus <CR>")
		vim.keymap.set("n", "<C-S-G>", ":Neotree position=float source=git_status action=focus <CR>")

		require("neo-tree").setup({
			enable_git_status = true,
			enable_diagnostics = true,
			default_component_config = {
				indent = {
					indent_size = 4,
				},
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "right",
				width = 50,
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
	end,
}
