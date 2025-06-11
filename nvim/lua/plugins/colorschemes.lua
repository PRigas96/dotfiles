return {
    {
        'sam4llis/nvim-tundra' -- packer.nvim
    },
    -- add catppuccin
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {     -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = true,     -- shows the '~' characters after the end of buffers
                term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false,           -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.2,          -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,             -- Force no italic
                no_bold = false,               -- Force no bold
                no_underline = false,          -- Force no underline
                styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" },   -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    noice = true,
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
                highlight_overrides = {
                    mocha = function(mocha)
                        return {
                            NvimTreeNormal = { bg = mocha.none },
                        }
                    end,
                },
            })

            vim.cmd.colorscheme "catppuccin"
            -- Set only the editor background transparent
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
                    compile_file_suffix = '_compiled', -- Compiled file suffix
                    hide_end_of_buffer = true,         -- Hide the '~' character at the end of the buffer for a cleaner look
                    hide_nc_statusline = true,         -- Override the underline style for non-active statuslines
                    transparent = true,                -- Disable setting bg (make neovim's background transparent)
                    terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false,              -- Non focused panes set to alternative background
                    module_default = true,             -- Default enable value for modules
                    styles = {                         -- Style to be applied to different syntax groups
                        comments = 'italic',           -- Value is any valid attr-list value `:help attr-list`
                        functions = 'NONE',
                        keywords = 'NONE',
                        variables = 'NONE',
                        conditionals = 'NONE',
                        constants = 'NONE',
                        numbers = 'NONE',
                        operators = 'NONE',
                        strings = 'NONE',
                        types = 'NONE',
                    },
                    inverse = { -- Inverse highlight for different types
                        match_paren = true,
                        visual = true,
                        search = true,
                    },
                    darken = { -- Darken floating windows and sidebar-like windows
                        floats = true,
                        sidebars = {
                            enable = true,
                            list = {}, -- Apply dark background to specific windows
                        },
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })
        end,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = function()
            return {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark",            -- style for sidebars, see below
                    floats = "dark",              -- style for floating windows
                },
                sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = true,              -- dims inactive windows
                lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold
                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,
                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            }
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- Load the tokyonight theme
            require("tokyonight").setup({
                -- Other theme options here if needed
            })
            -- Apply your custom highlight settings for line numbers
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#569CD6" })       -- Change line number color
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700" }) -- Change current line number color
        end,
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require("nvim-highlight-colors").setup {
                ---Render style
                ---@usage 'background'|'foreground'|'virtual'
                render = 'background',

                ---Set virtual symbol (requires render to be set to 'virtual')
                virtual_symbol = '■',

                ---Set virtual symbol suffix (defaults to '')
                virtual_symbol_prefix = '',

                ---Set virtual symbol suffix (defaults to ' ')
                virtual_symbol_suffix = ' ',

                ---Set virtual symbol position()
                ---@usage 'inline'|'eol'|'eow'
                ---inline mimics VS Code style
                ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
                ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
                virtual_symbol_position = 'inline',

                ---Highlight hex colors, e.g. '#FFFFFF'
                enable_hex = true,

                ---Highlight short hex colors e.g. '#fff'
                enable_short_hex = true,

                ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
                enable_rgb = true,

                ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
                enable_hsl = true,

                -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
                enable_hsl_without_function = true,

                ---Highlight CSS variables, e.g. 'var(--testing-color)'
                enable_var_usage = true,

                ---Highlight named colors, e.g. 'green'
                enable_named_colors = true,

                ---Highlight tailwind colors, e.g. 'bg-blue-500'
                enable_tailwind = false,

                ---Set custom colors
                ---Label must be properly escaped with '%' to adhere to `string.gmatch`
                --- :help string.gmatch
                custom_colors = {
                    { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
                    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
                },

                -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
                exclude_filetypes = {},
                exclude_buftypes = {},
                -- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
                exclude_buffer = function(bufnr) end
            }
        end
    },
}
