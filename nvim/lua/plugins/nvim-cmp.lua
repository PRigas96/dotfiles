return{
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    depedencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip", -- autocomplete
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        -- load vscode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = { completeopt = "menu,menuone,preview,noselect" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = false,
                }),
            }),
            sources = cmp.config.sources({
                -- order = priority
                {name = "nvim_lsp"}, -- lsp
                {name = "luasnip"}, -- snippets
                {name = "buffer"}, -- buffer
                {name = "path"}, -- file system
            }),
        })
    end,
}
