local Plug = require 'strottos.vimplug'

Plug.begin()

-- Prereqs
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')

Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

Plug 'rebelot/kanagawa.nvim'

Plug('nvim-treesitter/nvim-treesitter', { run = function()
  vim.cmd('TSUpdate')
end })
Plug 'nvim-treesitter/playground'

Plug 'mbbill/undotree'

Plug 'folke/neoconf.nvim'

Plug('strottos/nvim-vadre', { branch = 'feat/productionism', run = 'cargo build' })

Plug('nvim-neo-tree/neo-tree.nvim', { branch = 'v3.x' })

Plug 'github/copilot.vim'
Plug 'will133/vim-dirdiff'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'f-person/git-blame.nvim'

Plug 'rust-lang/rust.vim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')
Plug 'ray-x/lsp_signature.nvim'

Plug.ends()
