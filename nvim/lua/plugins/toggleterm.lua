return {
  'akinsho/toggleterm.nvim',

  version = "*",
  opts = {
    direction = 'float',
    open_mapping = [[<leader>t]],  -- Map <leader>t to toggle the floating terminal
    insert_mappings = false,  -- Insert mappings for insert mode
    float_opts = {
      border = 'curved',  -- Optional: customize the floating terminal border
    },
  },
  -- require("toggleterm").setup{}
}

