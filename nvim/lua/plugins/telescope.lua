-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
	  opts = {},
	  config = function(_,opts)
			  require('telescope').setup(opts)
	  end,

    }
