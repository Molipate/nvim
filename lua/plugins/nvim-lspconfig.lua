return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach = function(_, _)
            vim.keymap.set("n", "<C-space>", vim.lsp.buf.code_action)
        end

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            on_attach = on_attach
        })

        lspconfig.pylsp.setup({
            on_attach = on_attach
        })

        lspconfig.gopls.setup({
            on_attach = on_attach
        })
    end,
}
