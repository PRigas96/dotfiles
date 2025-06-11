return {
    "folke/zen-mode.nvim",
    opts = {
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95,            -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    width = 120,                -- width of the Zen window
                    height = 1,                 -- height of the Zen window
                    options = {
                        signcolumn = "no",      -- disable signcolumn
                        number = false,         -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorline = false,     -- disable cursorline
                        cursorcolumn = false,   -- disable cursor column
                        foldcolumn = "0",       -- disable fold column
                        list = false,           -- disable whitespace characters
                    },
                },
                plugins = {
                    gitsigns = { enabled = true}, -- disables git signs
                    tmux = { enabled = true},     -- disables the tmux statusline
                    twilight = { enabled = false }, -- disables the twilight plugin
                },
                on_open = function()
                    vim.cmd [[
                        set foldlevel=20
                    ]]
                end,
                on_close = function()
                    vim.cmd [[
                        set foldlevel=0
                    ]]
                end,
            }
        end,
    },
}
