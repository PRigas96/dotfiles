return {
    -- "mistricky/codesnap.nvim",
    "jhonnyV-V/codesnap.nvim",
    branch = "feature/wsl-copy-to-clipboard",
    lazy = false, -- lazy true means it will load on the first time it's called

    keys = {
        { "<leader>cs", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>cw", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {

        save_path = "~/Pictures",
        mac_window_bar = true,
        title = "CodeSnap.nvim",
        code_font_family = "JetBrainsMono Nerd Font",
        watermark_font_family = "Pacifico",
        watermark = "CodeSnap.nvim",
        bg_theme = "peach",
        breadcrumbs_separator = "/",
        has_breadcrumbs = true,
        has_line_number = true,
        show_workspace = true,
        min_width = 0,
        bg_x_padding = 122,
        bg_y_padding = 82,
    --     save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME").. "/Pictures")
    },
    build = "make",
}
-- return {
--     "mistricky/codesnap.nvim",
--     lazy = "true",
--     build = "make build_server",
--     cmd = "CodeSnapPreviewOn",
--      commit = "14327aada69623c1b974ba20a6640856f91a7cb3",
--     tag = "v0.0.11",
--     pin = true,
--     opts = {
--         mac_windows_bar = true,
--         watermark = "",
--         preview_title = "CodeSnap.nvim",
--         editor_font_family = "Hack nerd Font Mono",
--     },
--     config = function(_, opts)
--         require("codesnap").setup(opts)
--     end,
-- }
