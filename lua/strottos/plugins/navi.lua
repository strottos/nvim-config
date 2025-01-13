return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<localleader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<localleader>rg', builtin.live_grep, {})
            vim.keymap.set('n', '<localleader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<localleader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<localleader>gc', builtin.git_commits, {})
            vim.keymap.set('n', '<localleader>gt', builtin.git_bcommits, {}) -- Current buffer commits
            vim.keymap.set('n', '<localleader>gb', builtin.git_branches, {})
            vim.keymap.set('n', '<localleader>gh', builtin.git_stash, {})
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('neo-tree').setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                filesystem = {
                    filtered_items = {
                        hidden_dotfiles = false,
                        hidden_gitignore = true,
                        hide_hidden = false,
                    },
                },
                buffers = {
                    show_unloaded = true,
                },
            })
            vim.keymap.set('n', '<C-n>', function()
                vim.cmd("Neotree float")
            end, {})
            vim.keymap.set('n', '<localleader>gs', function()
                vim.cmd("Neotree float git_status")
            end, {})
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<localleader>u', vim.cmd.UndotreeToggle)
        end,
    },
}
