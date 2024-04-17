local splash_art = [[                                                
                                             ___    
                                          ,o88888   
                                       ,o8888888'   
                 ,:o:o:oooo.        ,8O88Pd8888"    
             ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"      
           ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"        
          , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"          
         , ..:.::o:ooOoOO8O888O8O,COCOO"            
        , . ..:.::o:ooOoOOOO8OOOOCOCO"              
         . ..:.::o:ooOoOoOO8O8OCCCC"o               
            . ..:.::o:ooooOoCoCCC"o:o               
            . ..:.::o:o:,cooooCo"oo:o:              
         `   . . ..:.:cocoooo"'o:o:::'              
         .`   . ..::ccccoc"'o:o:o:::'               
        :.:.    ,c:cccc"':.:.:.:.:.'                
      ..:.:"'`::::c:"'..:.:.:.:.:.'                 
    ...:.'.:.::::"'    . . . . .'                   
   .. . ....:."' `   .  . . ''                      
 . . . ...."'                                       
 .. . ."'                                           
.                                                   
                                                         ]]

return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.starter").setup({
			header = splash_art,
		})

		require("mini.sessions").setup()

		local session_save_command = function(opts)
			local session_path = vim.fn.stdpath("data") .. "/session"
			local session_name = opts.args

			local session_filepath = session_path .. "/" .. session_name
			vim.cmd("mksession " .. session_filepath)
		end

		vim.api.nvim_create_user_command("SessionSave", session_save_command, { nargs = 1 })

		require("mini.completion").setup()
	end,
}
