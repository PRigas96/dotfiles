return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local icons = require('.config.icons')  -- Use your icons.lua
        require('bufferline').setup({
            options = {
                numbers = "none",
                number_style = "superscript",
                mappings = true,
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator_icon = "▎",
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                name_formatter = nil,
                max_name_length = 18,
                max_prefix_length = 15, 
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = icons.diagnostics[level] or ""
                    return " " .. icon .. count
                end,
                diagnostics_update_in_insert = false, 
                offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
                show_buffer_icons = true, 
                show_buffer_close_icons = true, 
                show_close_icon = true, 
                show_tab_indicators = false, 
                persist_buffer_sort = false, 
                separator_style = "thin", 
                enforce_regular_tabs = false, 
                always_show_bufferline = false, 
                sort_by = "id"
            },
        })
    end
}

