vim.cmd('GitBlameDisable')
vim.keymap.set('n', '<localleader>gm', function ()
    if vim.g.gitblame_enabled == false then
        vim.cmd('GitBlameEnable')
    else
        vim.cmd('GitBlameDisable')
    end
end, {})
