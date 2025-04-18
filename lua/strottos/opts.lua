vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.smartcase = true

vim.o.showmode = true

vim.bo.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

vim.o.incsearch = true

vim.o.hidden = true

vim.o.completeopt='menuone,noinsert,noselect'

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = vim.o.tabstop
vim.o.shiftwidth = vim.o.tabstop
vim.o.expandtab = true

vim.wo.number = true
vim.wo.cursorline = true
vim.wo.relativenumber = false

vim.wo.signcolumn = 'yes'

vim.wo.wrap = true

vim.g.mapleader = ','
vim.g.maplocalleader = '-'
vim.o.clipboard = "unnamedplus"  -- Use system clipboard

vim.o.list=true
vim.o.lcs='tab:> ,trail:%'

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup('Strottos', {}),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- FileType specifics

for _, ft in ipairs({"html", "css", "javascript", "typescript", "typescriptreact"}) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
        end
    })
end

vim.api.nvim_create_autocmd({"BufNewFile","BufRead"}, {
    pattern = "*.mdx",
    callback = function()
        vim.o.filetype = 'markdown'
        vim.o.fo = 'want'
    end
})
