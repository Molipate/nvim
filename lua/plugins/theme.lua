
-- Darcula Solid
-- return {
--     'briones-gabriel/darcula-solid.nvim',
--     dependencies = {
--         'rktjmp/lush.nvim'
--     },
--     config = function()
--         vim.cmd("colorscheme darcula-solid")
--     end,
-- }


return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = function()
        require("gruvbox").setup()
        vim.cmd("colorscheme gruvbox")
    end,
}
