return {
    'glepnir/dbsession.nvim',
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad'},
    config = function()
        require('dbsession').setup {
            auto_save_on_exit = true
        }
    end
}

