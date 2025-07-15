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
                    proto = { "buf" },
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
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- provider = "claude",
            --     claude = {
            --     endpoint = "https://api.anthropic.com",
            --     model = "claude-3-5-sonnet-20241022",
            --     temperature = 0,
            --     max_tokens = 4096,
            -- },

            -- provider = "openai",
            -- openai = {
            --     endpoint = "https://api.openai.com/v1",
            --     model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
            --     timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
            --     temperature = 0,
            --     max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --     --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
            -- },

            debug = true,
            provider = "ollama",
            cursor_applying_provider = 'groq',
            providers = {
                ollama = {
                    endpoint = "http://192.168.1.169:11434",
                    model = "phi4:latest",
                },
            }
        },
        build = "pwsh ./Build.ps1 luajit true",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
}
