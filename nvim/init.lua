require("keymaps")
require("options")
require("config.lazy")
--vim.cmd("set number")
--vim.cmd("set relativenumber")
-- vim.cmd("set tabstop=4")
-- vim.cmd [[colorscheme solarized-osaka]]
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#89DDFF" })       -- Change line number color
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#89DDFF" }) -- Change current line number color
-- local conda_path = "C:\\Users\\panagiotis.rigas\\.conda\\envs\\Pytorch_main"
local conda_path = '/home/pc1/miniconda3/envs/pytorch'
vim.g.python3_host_prog = conda_path .. "/bin/python.exe"
-- vim.g.python3_host_prog = '/home/prigas/miniconda3/envs/pytorch3d/bin/python'
-- local lint_path = conda_path .. "\\lib\\site-packages"
-- vim.g.black_virtualenv = lint_path
--
-- -- Avante
-- require('avante_lib').load()
--
-- Automatically import all files from lua/config
local config_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/config", "*.lua", false, true)

for _, file in ipairs(config_files) do
    -- Ensure the match correctly captures the desired part of the path
    local config_module = file:match("[/\\]lua[/\\](.*)%.lua$")
    if config_module then
        config_module = config_module:gsub("[/\\]", ".") -- Replace slashes with dots for require
        local ok, err = pcall(require, config_module)
        if not ok then
            print("Error loading module " .. config_module .. ": " .. err)
        end
    else
        print("Could not parse module path from file: " .. file)
    end
end


vim.opt.termguicolors = true
-- require('bufferline').setup()
require('avante_lib').load()


-- overleaf
vim.g.AirLatexUsername = 'prigas96@gmail.com'
-- vim.g.AirLatexCookie= "cookies:_ga_RV4YBCCCWJ=GS1.1.1730016292.393.0.1730016292.0.0.0; _ga=GA1.2.1250921604.1698652845; overleaf_session2=s%3AkwyPRm32GBR9F_RNEw3P5qup2TOua5Xs.kRzU9Mqpm9l4yc8UzmGPOw3tWUbNcKIMdewzF8F3loI"
--
--
vim.g.AirLatexCookie="GCLB=CIudyYS-xuGPaBAD; oa=1; _gcl_au=1.1.1031255858.1734424985; _ga=GA1.1.1339230595.1721978937; _ga_RV4YBCCCWJ=GS1.1.1734545863.5.0.1734545867.0.0.0; overleaf_session2=s%3Ad8kZXFiEISqCuj4sab39rYoKICk5EKMX.2lA3arVv2OvxFwJ1Ma%2B55gDspUbQZ%2BzFXDrqg7w6xds"
-- GCLB=CIudyYS-xuGPaBAD; oa=1; _gcl_au=1.1.1031255858.1734424985; _ga=GA1.1.1339230595.1721978937; _ga_RV4YBCCCWJ=GS1.1.1734545863.5.0.1734545867.0.0.0; __stripe_mid=f167e648-7a91-4e4c-b50c-88d165e1d80a933b06; overleaf_session2=s%3Ad8kZXFiEISqCuj4sab39rYoKICk5EKMX.2lA3arVv2OvxFwJ1Ma%2B55gDspUbQZ%2BzFXDrqg7w6xds
vim.cmd('UpdateRemotePlugins')

