return {
   "neovim/nvim-lspconfig",
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
       { "antosha417/nvim-lsp-file-operations", config = true },
       { "folke/neodev.nvim", opts = {} },
       { "ambv/black", ft = "python" },
       { "nvim-lua/plenary.nvim", as = "plenary" },
       { "nvim-lua/popup.nvim", as = "popup" },
   },
   config = function()
       local keymap = vim.keymap -- for conciseness

       vim.api.nvim_create_autocmd("LspAttach", {
           group = vim.api.nvim_create_augroup("UserLspConfig", {}),
           callback = function(ev)
               local opts = { buffer = ev.buf, silent = true }

               -- LSP Keymaps
               opts.desc = "Show LSP references"
               keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
               opts.desc = "Go to declaration"
               keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
               opts.desc = "Show LSP definitions"
               keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
               opts.desc = "Show LSP implementations"
               keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
               opts.desc = "Show LSP type definitions"
               keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
               opts.desc = "See available code actions"
               keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
               opts.desc = "Smart rename"
               keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
               opts.desc = "Show buffer diagnostics"
               keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
               opts.desc = "Show line diagnostics"
               keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
               opts.desc = "Go to previous diagnostic"
               keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
               opts.desc = "Go to next diagnostic"
               keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
               opts.desc = "Show documentation for what is under cursor"
               keymap.set("n", "K", vim.lsp.buf.hover, opts)
               opts.desc = "Restart LSP"
               keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
           end,
       })

       -- Modern diagnostic configuration
       vim.diagnostic.config({
           signs = {
               text = {
                   [vim.diagnostic.severity.ERROR] = " ",
                   [vim.diagnostic.severity.WARN] = " ",
                   [vim.diagnostic.severity.HINT] = "󰠠 ",
                   [vim.diagnostic.severity.INFO] = " ",
               },
           },
           virtual_text = true,
           update_in_insert = false,
           underline = true,
           severity_sort = true,
           float = {
               focusable = false,
               style = "minimal",
               border = "rounded",
               source = "always",
           },
       })
   end,
}
