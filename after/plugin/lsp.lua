local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",

        "rust_analyzer",

        "clangd",

        "gopls",

        "pyright",
        "pyre",

        "tsserver",

        "terraformls",
        "tflint",

        "powershell_es",

        "vuels",

        "html",
        "cssls",

        "remark_ls",
    },
    handlers = {
        lsp.default_setup,
    },
}
