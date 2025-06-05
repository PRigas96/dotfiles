return {
    -- , , , , , 
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Import your custom theme
        -- local custom_theme = require('config.themes.tokyonight_moon_custom')  -- Adjust path as needed
        local lualine_require = require('lualine_require')
        lualine_require.require = require
        -- local icons = require('nvim-web-devicons')
        local icons = require('.config.icons') -- Use your icons.lua
        vim.o.laststatus = vim.g.lualine_laststatus

        -- Setup Lualine with the custom theme
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                -- component_separators = { left = '', right = '' }, -- for solarized osaka
                component_separators = { left = '', right = '' }, -- for catppuccino
                -- section_separators = { left = '', right = '' }, -- for solarized osaka
                section_separators = { left = '', right = '' }, -- for catppuccino
                disabled_filetypes = {
                    statusline = {"NvimTree", "packer", "avante"},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = { { 'mode', icon = '' } },

                lualine_b = { 'branch', { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰠠 ' } } },

                lualine_c = {
                    {
                        'filename',
                        symbols = {
                            modified = '~', -- Text to show when the file is modified.
                        }
                    }
                },
                lualine_x = {
                    {
                        function()
                            local conda_env = os.getenv("CONDA_DEFAULT_ENV")
                            if conda_env then
                                return ' ' .. conda_env
                            else
                                return ''
                            end
                        end,
                        cond = function()
                            return os.getenv("CONDA_DEFAULT_ENV") ~= nil
                        end,
                        color = { fg = '#C94C16' }, -- for solarized osaka
                        -- color = { fg = '#F5C2E7' }, -- for catppuccino
                    },
                    {
                        function()
                            local copilot_active = vim.fn['copilot#Enabled']() == 1
                            if copilot_active then
                                return ' ' -- 
                            else
                                return ' '--  
                            end
                        end,
                        cond = function()
                            return true
                        end,
                        color = { fg = '#C94C16' }, -- for solarized osaka
                        -- color = { fg = '#CBA6F7' },
                        -- color = { fg = '#F5C2E7' }, -- for catppuccino
-- #
                    },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = function() return { fg = Snacks.util.color("Special") } end,
                    },
                    { 'diff', symbols = {

                        added = icons.git.added .. ' ',
                        modified = icons.git.modified .. ' ',
                        removed = icons.git.removed .. ' ',
                    } },
                },
                lualine_y = { { 'progress', separator = '', padding = { left = 1, right = 0 } }, { 'location', separator = '', padding = { left = 1, right = 0 } } },
                lualine_z = {
                    {
                        function()
                            return os.date('%H:%M')
                        end,
                        icon = ''
                    }
                },
            },
            inactive_sections = {
                lualine_a = {},

                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
}
