-- lua/config/themes/tokyonight_moon_custom.lua

-- Start with the base tokyonight theme
local colors = {
  black        = '#222436',
  -- black        = '#1a1b26',
  white        = '#c0caf5',
  red          = '#f7768e',
  green        = '#9ece6a',
  blue         = '#7aa2f7',
  yellow       = '#e0af68',
  purple       = '#bb9af7',
  cyan         = '#7dcfff',
  grey         = '#565f89',
  dark_grey    = '#414868',
  light_grey   = '#787c99',
}

local custom_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.dark_grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },
  insert = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.white, bg = colors.dark_grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },
  visual = {
    a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.white, bg = colors.dark_grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },
  replace = {
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    b = { fg = colors.white, bg = colors.dark_grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },
  command = {
    a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.white, bg = colors.dark_grey },
    c = { fg = colors.light_grey, bg = colors.black },
  },
  inactive = {
    a = { fg = colors.grey, bg = colors.black },
    b = { fg = colors.grey, bg = colors.black },
    c = { fg = colors.grey, bg = colors.black },
  },
}

return custom_theme

