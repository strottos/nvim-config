return {
    {
        "catppuccin/nvim",
        config = function ()
            require("catppuccin").setup({
                flavour = "mocha"
            })

            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        depeer = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local function paste()
                if vim.o.paste then
                    return "(PASTE)"
                end
                return ""
            end

            local function totalcharnum()
                return vim.fn.wordcount().cursor_bytes
            end

            local function currentcharacter()
                -- Only works for ascii characters, and that's mostly OK
                return string.format("0x%2x", string.byte(vim.fn.matchstr(vim.fn.getline("."), "\\%" .. vim.fn.col(".") .. "c.")))

            end

            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { "", "" },
                    section_separators = { "", "" },
                    disabled_filetypes = {
                    },
                },
                sections = {
                    lualine_a = { "mode", paste },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "filetype" },
                    lualine_y = { currentcharacter, totalcharnum },
                    lualine_z = { "progress" },
                },
            }
        end,
    },
    {
        "m00qek/baleia.nvim",
        version = "*",
        config = function()
            vim.g.baleia = require("baleia").setup({ })

            -- Command to colorize the current buffer
            vim.api.nvim_create_user_command("BaleiaColorize", function()
                vim.g.baleia.once(vim.api.nvim_get_current_buf())
            end, { bang = true })

            -- Command to show logs
            vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
        end,
    }
}
