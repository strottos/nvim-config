local builtin = require('telescope.builtin')
vim.keymap.set('n', '<localleader>ff', builtin.find_files, {})
vim.keymap.set('n', '<localleader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<localleader>fb', builtin.buffers, {})
vim.keymap.set('n', '<localleader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<localleader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<localleader>gt', builtin.git_bcommits, {}) -- Current buffer commits
vim.keymap.set('n', '<localleader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<localleader>gs', builtin.git_status, {})
vim.keymap.set('n', '<localleader>gh', builtin.git_stash, {})
