local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    lsp.default_keymaps(opts)

    vim.keymap.set('n', '<localleader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end)

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",

        "rust_analyzer",

        "clangd",

        "gopls",

        "pylsp",
        "pyright",
        "pyre",

        "tsserver",

        "terraformls",
        "tflint",

        "powershell_es",

        "vuels",

        "html",
        "cssls",
    },
    handlers = {
        lsp.default_setup,
    },
}
