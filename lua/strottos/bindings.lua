-- Allow visually moving lines and redefine original K/J keys
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<C-K>', 'K', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-J>', 'J', {noremap = true})

-- Add things around visually selected text like quotes, brackets, etc.
vim.api.nvim_set_keymap('v', '"', '<esc>`>a"<esc>`<i"<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '\'', '<esc>`>a\'<esc>`<i\'<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '`', '<esc>`>a`<esc>`<i`<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '(', '<esc>`>a)<esc>`<i(<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '{', '<esc>`>a}<esc>`<i{<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '[', '<esc>`>a]<esc>`<i[<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '_', '<esc>`>a_<esc>`<i_<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '-', '<esc>`>a-<esc>`<i-<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>*', '<esc>`>a*<esc>`<i*<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader><', '<esc>`>a><esc>`<i<<esc>', {noremap = true})

-- Add things specific to languages.
--
-- Need to find a way to have these on filetype dependent. Probably an event we can utilise somehow but
-- at this stage when there's so few let's kick the can on that.
vim.api.nvim_set_keymap('v', '<leader>s', '<esc>`>a)<esc>`<iSome(<esc>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>o', '<esc>`>a)<esc>`<iOk(<esc>', {noremap = true})

-- Tab shortcuts
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-tab>', ':tabprevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<tab>',   ':tabnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader><', ':exec "tabm " . (tabpagenr() - 2)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>>', ':exec "tabm " . (tabpagenr() + 1)<CR>', {noremap = true})

-- Insert mode shortcuts
vim.api.nvim_set_keymap('i', '<c-u>', '<esc>viwUea', {noremap = true})

-- Command mode shortcuts
vim.api.nvim_set_keymap('c', '<C-Left>', '<S-Left>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-Right>', '<S-Right>', {noremap = true})

-- Window resizing
vim.api.nvim_set_keymap('n', '<C-l>', ':exec "vertical resize " . (winwidth(\'%\') + 1)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':exec "vertical resize " . (winwidth(\'%\') - 1)<CR>', {noremap = true})

-- Others
vim.api.nvim_set_keymap('n', '<localleader>tr', ':%s/.\\[[0-9]\\+m\\?//g<CR>', {noremap = true})

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r><C-o>*', {noremap = true})

vim.api.nvim_set_keymap('i', '<C-q>', '<C-v>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-BS>', '<BS>', {noremap = true})

vim.api.nvim_set_keymap('x', '<localleader>p', [["_dP]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {noremap = true})
vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap = true})
