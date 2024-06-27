local header = [[
               ▄ ▄                   
           ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     
           █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     
        ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     
      ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
      █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
    ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
    █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
        █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    
]]

return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.starter").setup({
			header = header,
		})

		require("mini.sessions").setup()

		local session_save_command = function(opts)
			local session_path = vim.fn.stdpath("data") .. "/session"
			local session_name = opts.args

			local session_filepath = session_path .. "/" .. session_name
			vim.cmd("mksession " .. session_filepath)
		end

		vim.api.nvim_create_user_command("SessionSave", session_save_command, { nargs = 1 })
	end,
}

