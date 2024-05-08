local mason_ensure_installed = {
	"lua_ls",
	"pylsp",
}

return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function()
		vim.keymap.set("n", "<C-S-X>", ":Mason <CR>")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = mason_ensure_installed,
		})

		local on_attach = function(_, _)
			vim.keymap.set("n", "<C-space>", vim.lsp.buf.code_action)
		end

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
		})

		lspconfig.pylsp.setup({
			on_attach = on_attach,
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
		})
	end,
}
