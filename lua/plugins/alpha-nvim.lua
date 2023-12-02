return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "vimEnter",
    config = function ()
        local theme = require("alpha.themes.theta")

        local function get_header()
            planet = {
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

            lines = {}
            for idx, line in ipairs(planet) do
                table.insert(lines, {
                    type = "text",
                    val = line,
                    opts = {
                        position = "center",
                    }
                })
            end

            return {
                type = "group",
                val = lines,
                opts = { position = "center" }
            }
        end

        local function get_projects(max_shown)
            local alphabet = "abcdefghijknopqrstuvwxyz"
            local dashboard = require("alpha.themes.dashboard")
            local project_list = require("telescope._extensions.project.utils").get_projects("recent")
            
            local tbl = {
                { type = "text", val = "Recent Projects", opts = { hl = "SpecialComment", position = "center" } },
            }

            local icon = " "
			local target_width = 35 -- create shortened path for display


            for i, project in ipairs(project_list) do
                if i > max_shown then
                    break
                end


                local display_path = project.path
                if #display_path > target_width then
                    display_path = plenary_path.new(display_path):shorten(1, { -2, -1 })
                    if #display_path > target_width then
                        display_path = plenary_path.new(display_path):shorten(1, { -1 })
                    end
                end

                -- get semantic letter for project
                local letter
                local project_name = display_path:match("[/\\][%w%s%.%-]*$")
                if project_name == nil then
                    project_name = display_path
                end
                project_name = project_name:gsub("[/\\]", "")
                letter = string.sub(project_name, 1, 1):lower()

                -- get alternate letter if not available
                if string.find(alphabet, letter) == nil then
                    letter = string.sub(alphabet, 1, 1):lower()
                end

                -- remove letter from available alphabet
                alphabet = alphabet:gsub(letter, "")

                -- create button element
                local file_button_el = dashboard.button(
                    letter,
                    icon .. display_path,
                    "<cmd>lua require('telescope.builtin').find_files( { cwd = '" .. project.path:gsub("\\", "/") .. "' }) <cr>"
                )

                -- create hl group for the start of the path
                local fb_hl = {}
                table.insert(fb_hl, { "Comment", 0, #icon + #display_path - #project_name })
                file_button_el.opts.hl = fb_hl

                table.insert(tbl, file_button_el)
            end

            return { type = "group", val = tbl, opts = {} }
        end

        local function get_mru(max_shown)
            local tbl = {
                { type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
            }

            local mru_list = theme.mru(1, "", max_shown)
                for _, file in ipairs(mru_list.val) do
                table.insert(tbl, file)
            end

            return { type = "group", val = tbl, opts = {} }
        end

        local function get_footer()
            return {
                type = "group",
                val = {{
                    type = "text",
                    val = " Powered by coffee",
                    opts = {
                        hl = "Comment",
                        position = "center"
                    }
                }},
                opts = { position = "center" }
            }
        end

        theme.config.layout = {
            get_header(),
            { type = "padding", val = 2 },
            get_projects(8),
            { type = "padding", val = 2 },
            get_mru(8),
            { type = "padding", val = 4 },
            get_footer(),
        }

        require('alpha').setup(theme.config)
    end,
}
