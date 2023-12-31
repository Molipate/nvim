return {
	"williamboman/mason.nvim",
    dependencies = {
    	"williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup {
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            }
        }

        require('mason-lspconfig').setup {
            ensure_installed = {
                "jedi_language_server",
            },

            automatic_installation = true,
        }
    end
}

