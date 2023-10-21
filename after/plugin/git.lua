vim.call('GitBlameDisable')
vim.keymap.set('n', '<localleader>gm', function ()
    if vim.g.gitblame_enabled == 0 then
        vim.call('GitBlameEnable')
    else
        vim.call('GitBlameDisable')
    end
end, {})
