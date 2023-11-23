vim.o.completeopt='menu,menuone,noselect'
vim.o.shortmess=vim.o.shortmess .. 'c'
vim.o.cmdheight=2
vim.o.updatetime=300

require("neoconf").setup({
    -- override any of the default settings here
})

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
    })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }, {
    { name = 'buffer' },
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true
      },
      completion = {
        postfix = {
          enable = false,
        },
      },
      checkOnSave = {
        command = "clippy"
      },
    },
  },
  capabilities = capabilities,
}

local servers = {
  "clangd",
  "gopls",
  "omnisharp",
  "pyright",
  "tsserver",

  "terraformls",

  "html",
  "cssls",
  "vuels",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach    = on_attach,
    capabilities = capabilities,
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

vim.api.nvim_set_keymap('n', 'gD', ":lua vim.lsp.buf.declaration()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'gd', ":lua tab split | lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'K', ":lua vim.lsp.buf.hover()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'gi', ":lua vim.lsp.buf.implementation()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'gr', ":lua vim.lsp.buf.references()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'g0', ":lua vim.lsp.buf.document_symbol()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', 'gW', ":lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ":lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>wa', ":lua vim.lsp.buf.add_workspace_folder()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>wr', ":lua vim.lsp.buf.remove_workspace_folder()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>wl', ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>D', ":tab split | lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>rn', ":lua vim.lsp.buf.rename()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>ca', ":lua vim.lsp.buf.code_action()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>e', ":lua vim.diagnostic.open_float()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '[d', ":lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', ']d', ":lua vim.diagnostic.goto_next()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>q', ":lua vim.diagnostic.setloclist()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>f', ":lua vim.lsp.buf.formatting()<CR>", {noremap = true})
