return {
    'akinsho/toggleterm.nvim',

    version = "*",
    opts = {
        direction = 'float',
        open_mapping = [[<leader>t]], -- Map <leader>t to toggle the floating terminal
        insert_mappings = false,  -- Insert mappings for insert mode
        float_opts = {
            border = 'curved',    -- Optional: customize the floating terminal border
        },
        on_create = function(term)
            local conda_env = vim.env.CONDA_DEFAULT_ENV or vim.env.CONDA_PREFIX
            if conda_env then
                -- Extract just the environment name if it's a full path
                local env_name = conda_env:match("([^/]+)$") or conda_env
                vim.fn.chansend(term.job_id, "conda activate " .. env_name .. "\r")
            end
        end,
    },
    -- require("toggleterm").setup{}
}
