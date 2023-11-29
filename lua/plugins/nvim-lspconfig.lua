local diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" } 

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local opts = { }
    
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<M-&>', function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

local config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig.jedi_language_server.setup({
		on_attach = on_attach,
        capabilities = capabilities,
		settings = {
		},
	})
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    dependencies = {
        "williamboman/mason.nvim",
    }
}
