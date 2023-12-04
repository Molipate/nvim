return {
    'nvimtools/none-ls.nvim',
    dependencies =  { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        require("null-ls").setup {
            sources = {
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.diagnostics.bandit,
                null_ls.builtins.diagnostics.checkmake,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.diagnostics.ruff,
            }
        }
    end
}
