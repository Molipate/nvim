return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    event = "vimEnter",
    config = function ()
        local theme = require("alpha.themes.theta")

        local function get_header()
            local splash_art = {
                  [[                                                   ]],
                  [[                                              ___  ]],
                  [[                                           ,o88888 ]],
                  [[                                        ,o8888888' ]],
                  [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
                  [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
                  [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
                  [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
                  [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
                  [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
                  [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
                  [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
                  [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
                  [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
                  [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
                  [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
                  [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
                  [[     ...:.'.:.::::"'    . . . . .'                 ]],
                  [[    .. . ....:."' `   .  . . ''                    ]],
                  [[  . . . ...."'                                     ]],
                  [[  .. . ."'                                         ]],
                  [[ .                                                 ]],
                  [[                                                   ]],
            }

            local lines = {}
            for _, line in ipairs(splash_art) do
                table.insert(lines, {
                    type = "text",
                    val = line,
                    opts = {
                        position = "center"
                    }
                })
            end

            return {
                type = "group",
                val = lines,
                opts = {
                    position = "center",
                }
            }
        end

        local function get_most_recent_workspaces(max_shown)
            local alphabet = "abcedfghijklmnpqrstuvwxyz"
            local workspace_module = require("workspaces")
            local workspace_list = workspace_module.get()

            local most_recent_workspaces = {
                {
                    type = "text",
                    val = "Recent projects",
                    opts = {
                        hl = "SpecialComment",
                        position = "center",
                    },
                },
            }

            table.sort(workspace_list, function (a, b) return a.last_opened > b.last_opened end)
            for index, workspace in ipairs(workspace_list) do
                local workspace_button = {
                    type = "button",
                    val = " " .. workspace.path,
                    on_press = function ()
                        vim.cmd("WorkspacesOpen " .. workspace.name)
                    end,
                    opts = {
                        position = "center",
                        shortcut = alphabet:sub(index, index),
                        cursor = 3,
                        width = 50,
                        align_shortcut = "right",
                        hl_shortcut = "Keyword",
                        autocd=true,
                    }

                }
                table.insert(most_recent_workspaces, workspace_button)
            end

            return {
                type = "group",
                val = most_recent_workspaces,
                opts = {},
            }
        end

        local function get_most_recent_used(max_shown)
            local most_recent_used = {
                {
                    type = "text",
                    val = "Recent Files",
                    opts = {
                        hl = "SpecialComment",
                        position = "center",
                    }
                },
            }

            local mru_list = theme.mru(1, "", max_shown)
            for _,  file in ipairs(mru_list.val) do
                table.insert(most_recent_used, file)
            end

            return {
                type = "group",
                val = most_recent_used,
                opts = {}
            }
        end

        local function get_footer()
            return {
                type = "group",
                val = {{
                    type = "text",
                    val = " Powered by coffee",
                    opts = {
                        hl = "Comment",
                        position = "center",
                    }
                }},
                opts = {
                    position = "center"
                }
            }
        end

        theme.config.layout = {
            get_header(),
            {type = "padding", val = 2},
            get_most_recent_workspaces(8),
            {type = "padding", val = 2},
            get_most_recent_used(8) ,
            {type = "padding", val = 4},
            get_footer(),
        }

        require("alpha").setup(theme.config)
    end,
};
