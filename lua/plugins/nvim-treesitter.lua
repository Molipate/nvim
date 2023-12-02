return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "git_rebase",
                "gitcommit",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "scss",
                "ssh_config",
                "vim",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
            },
        }
   end,
}
