return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<ESC>'] = cmp.mapping.abort(),
                    ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                }
            })
        end,
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },

        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                }
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local opts = {noremap = true, silent = true}
            local on_attach = function(client, bufnr)
                vim.keymap.set("n", "<C-space>", vim.lsp.buf.code_action)
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.jinja_lsp.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    },
}
