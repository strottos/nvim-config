return {
    {
        "strottos/nvim-vadre",
        build = "cargo build",
        config = function()
            vim.api.nvim_set_keymap("n", "<localleader>b", ":VadreBreakpoint<CR>", {noremap = true})
        end
    },
    {
        "github/copilot.vim",
    },
    {
        "will133/vim-dirdiff",
    },
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with "{" and "}"
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })
            -- You probably also want to set a keymap to toggle aerial
            vim.keymap.set("n", "<localleader>a", "<cmd>AerialToggle!<CR>")
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "black" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    go = { "gofmt" },
                    javascript = { "prettier" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                },
            })
        end,
    },
    {
        "f-person/git-blame.nvim",
        config = function()
            vim.cmd("GitBlameDisable")
            vim.keymap.set("n", "<localleader>gm", function ()
                if vim.g.gitblame_enabled == false then
                    vim.cmd("GitBlameEnable")
                else
                    vim.cmd("GitBlameDisable")
                end
            end, {})
        end,
    },
}
