return {
    "williamboman/mason.nvim",
    config = function()
        vim.keymap.set("n", "<C-S-X>", ":Mason <CR>")
        require("mason").setup()
    end
}
