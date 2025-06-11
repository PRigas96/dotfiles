return {
   "williamboman/mason.nvim",
   priority = 1000,
   lazy = false,
   dependencies = {
       "williamboman/mason-lspconfig.nvim",
       "hrsh7th/cmp-nvim-lsp",
       "neovim/nvim-lspconfig",
   },
   config = function()
       local mason = require("mason")
       local mason_lspconfig = require("mason-lspconfig")
       local lspconfig = require("lspconfig")
       local cmp_nvim_lsp = require("cmp_nvim_lsp")
       
       mason.setup({
           ui = {
               icons = {
                   package_installed = "",
                   package_pending = "",
                   package_uninstalled = "",
               }
           }
       })
       
       mason_lspconfig.setup({
           -- list of servers for mason to install
           ensure_installed = {
               "lua_ls",
               "pyright",
           },
           -- auto install config servers w/ lspconfig
           automatic_installation = true,
       })
       
       -- Enable autocompletion
       local capabilities = cmp_nvim_lsp.default_capabilities()
       
       mason_lspconfig.setup_handlers({
           -- Default handler for all servers
           function(server_name)
               lspconfig[server_name].setup({
                   capabilities = capabilities,
               })
           end,
           -- Pyright configuration
           ["pyright"] = function()
               lspconfig.pyright.setup({
                   cmd = { "pyright-langserver", "--stdio" },
                   capabilities = capabilities,
                   settings = {
                       python = {
                           analysis = {
                               autoSearchPaths = true,
                               useLibraryCodeForTypes = true,
                           },
                           plugins = {
                               black = { enabled = true },
                               autopep8 = { enabled = false },
                               isort = { enabled = false },
                               -- pylint = { enabled = true },
                               ruff = { enabled = true },
                               pyflakes = { enabled = false },
                               pycodeStyle = { enabled = false },
                               pyright_mypy = {
                                   enabled = true,
                                   report_progress = true,
                                   liveMode = false,
                               },
                           },
                       },
                   },
               })
           end,
           -- Lua language server configuration
           ["lua_ls"] = function()
               lspconfig.lua_ls.setup({
                   capabilities = capabilities,
                   settings = {
                       Lua = {
                           diagnostics = {
                               globals = { "vim" },
                           },
                           completion = {
                               callSnippet = "Replace",
                           },
                       },
                   },
               })
           end,
       })
   end,
}
