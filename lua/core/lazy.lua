local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.g.leader = "<"
vim.g.leadermap = "<"

local opts = {
    ui = {
        size = { width = 0.8, height = 0.8 }, -- a number <1 is a percentage., >1 is a fixed size
        wrap = true,                          -- wrap the lines in the ui
        border = "none",                      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.

    },
    performance = {
        rtp = {
    		disabled_plugins = {
			    "gzip",
		    	"matchit",
	    		"matchparen",
    			"netrw",
			    "netrwPlugin",
		    	"tarPlugin",
	    		"tohtml",
    			"tutor",
		    	"zipPlugin",
	    	},
    	},
    },
	change_detection = {
		notify = false,
	},
}

require("lazy").setup("plugins", opts)
