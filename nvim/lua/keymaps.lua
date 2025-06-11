vim.g.mapleader = " "

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>Q", ":q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>q", ":bd<cr>", { desc = "Close tab" })

-- New tab
vim.keymap.set("n", "te", ":tabedit")
-- define opts
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<tab>", ":bn", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
vim.keymap.set("n", "<leader>s", ":split<Return>", opts, { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>v", ":vsplit<Return>", opts, { desc = "Split window vertically" })

-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<leader>rh", "<C-w><", { desc = "Resize window left" })
vim.keymap.set("n", "<leader>rk", "<C-w>+", { desc = "Resize window up" })
vim.keymap.set("n", "<leader>rj", "<C-w>-", { desc = "Resize window down" })
vim.keymap.set("n", "<leader>rl", "<C-w>>", { desc = "Resize window right" })
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- in normal, make ya to copy the whole file
-- vim.keymap.set("n", "ya", "ggVGy", { noremap = true, silent = true })
-- vim.keymap.set("v", "a", "ggVGy", { noremap = true, silent = true })
--
-- Ensure Comment.nvim is set up properly
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    { noremap = true, silent = true, desc = "Toggle comment" })
-- Visual mode mapping to toggle comments on the selected lines
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { noremap = true, silent = true, desc = "Toggle comment" })
-- Telescope
vim.defer_fn(function()
    local ok, builtin = pcall(require, 'telescope.builtin')
    if not ok then
        print("Telescope is not loaded yet!")
        return
    end

    -- Define keymaps only if Telescope is available
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
end, 100) -- Delay to allow Telescope to load

-- Nvim Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree" })

-- <leader>t toogles terminal. When esc, the terminal does not close!
-- make leader + c open config file
vim.keymap.set("n", "<leader>lc", ":e ~/.config/nvim/<cr>",
    { desc = "Open config file" })
-- make leader + k open keymaps file
vim.keymap.set("n", "<leader>lk", ":e ~/.config/nvim/lua/keymaps.lua<cr>",
    { desc = "Open keymaps file" })
-- for tmux
-- <C-hjkl> to move between tmux panes, e.g. <C-h> to move to the left pane: TmuxNavigateLeft<CR>
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Move to the left pane" })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Move to the down pane" })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Move to the up pane" })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Move to the right pane" })

-- Code + Python
-- make leader fmd to format code default
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "Format code" })
-- make leader b to format w/ black for python leader + c + b -> :Black<cr>
vim.keymap.set("n", "<leader>cb", ":Black<cr>", { desc = "Format code with black" })
-- vim.keymap.set("n", "<leader>fmd", ":lua vim.lsp.buf.format<cr>", { desc = "Format code" })
-- for python
-- set leader c + p to run python code in terminal
-- vim.keymap.set("n", "<leader>cp", function() vim.cmd("write") vim.cmd("term python3 " .. vim.fn.expand("%")) end, { desc = "Run python code" })
vim.keymap.set("n", "<leader>cp", function()
    vim.cmd("write")
    vim.cmd("split | term python3 " .. vim.fn.expand("%"))
end, { desc = "Run python code" })
-- vim.keymap.set("n", "<leader>cp", function()
-- vim.cmd("write") -- Save file
-- vim.cmd("botright 10split | term python3 " .. vim.fn.expand("%")) -- Open terminal in a floating window
-- end, { desc = "Run Python code in floating terminal" })
-- lets make CondaActivate to be leader + ca
vim.keymap.set("n", "<leader>cc", ":CondaActivate<cr>", { desc = "Activate conda environment 🐍" })
-- set keymaps for zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<cr>", { desc = "Zen mode" })
-- keymap for overleaf
vim.keymap.set("n", "<leader>o", ":AirLatex<cr>", { desc = "Overleaf" })
if vim.g.AirLatexIsActive then
    -- Keybinds for AirLatex
    vim.api.nvim_set_keymap("n", "<space>n", ":lua require'airlatex'.next_comment_position()<CR>",
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<space>p", ":lua require'airlatex'.prev_comment_position()<CR>",
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<F2>", ":lua require'airlatex'.toggle_tracking()<CR>",
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-x>", ":lua require'airlatex'.toggle()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "X", ":lua require'airlatex'.toggle_comments()<CR>", { noremap = true, silent = true })
end
