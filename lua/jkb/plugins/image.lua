return {
    {
        "3rd/image.nvim",

        -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        build = false,

        opts = {
            processor = "magick_cli",
        },

        config = function ()
            require("image").setup({
                backend = "kitty",
                processor = "magick_cli",
                integrations = {

                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = false,
                        only_render_image_at_cursor = false,
                        only_render_image_at_cursor_mode = "popup", -- or "inline"
                        floating_windows = false, -- if true, images will be rendered in floating markdown windows
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },

                    asciidoc = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = false,
                        only_render_image_at_cursor = false,
                        only_render_image_at_cursor_mode = "popup",
                        floating_windows = false,
                        filetypes = { "asciidoc", "adoc" },
                    },

                    neorg = {
                        enabled = false,
                        filetypes = { "norg" },
                    },

                    rst = {
                        enabled = true,
                    },

                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },

                    html = {
                        enabled = false,
                    },

                    css = {
                        enabled = false,
                    },
                },

                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,

                scale_factor = 1.0,

                -- toggles images when windows are overlapped
                window_overlap_clear_enabled = false,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },

                -- auto show/hide images when the editor gains/looses focus
                editor_only_render_when_focused = false,

                -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                tmux_show_only_in_active_window = false,

                -- render image files as images when opened
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },

            })
        end
    },
}
