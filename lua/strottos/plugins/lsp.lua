return {
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = {
            'Kaiser-Yang/blink-cmp-avante',
            'rafamadriz/friendly-snippets',
        },

        build = 'cargo build --release',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = 'default' },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'avante', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    avante = {
                        module = 'blink-cmp-avante',
                        name = 'Avante',
                        opts = {
                            -- options for blink-cmp-avante
                        }
                    }
                },
            },
        },
        opts_extend = { "sources.default" }
    },

    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'saghen/blink.cmp'},
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('blink.cmp').get_lsp_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}

                    vim.keymap.set("n", "K",               "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                    vim.keymap.set("n", "gd",              "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                    vim.keymap.set("n", "gD",              "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                    vim.keymap.set("n", "gi",              "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                    vim.keymap.set("n", "go",              "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                    vim.keymap.set("n", "gr",              "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                    vim.keymap.set("n", "gs",              "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                    vim.keymap.set("n", "<localleader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
                    vim.keymap.set("n", "<localleader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
                    vim.keymap.set("n", "<localleader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
                    vim.keymap.set("n", "<localleader>D",  "<cmd>tab split | lua vim.lsp.buf.type_definition()<cr>", opts)
                    vim.keymap.set("n", "<localleader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                    vim.keymap.set("n", "<localleader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                    vim.keymap.set("n", "<localleader>e",  "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
                    vim.keymap.set("n", "[d",              "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
                    vim.keymap.set("n", "]d",              "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
                    vim.keymap.set("n", "<localleader>q",  "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
                    vim.keymap.set("n", "<localleader>f",  "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
                end,
            })

            local lspconfig = require("lspconfig")

            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        assist = {
                            importMergeBehavior = "preserve",
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
                        checkOnSave = true,
                    },
                },
                capabilities = capabilities,
            })

            local servers = {
                "clangd",
                "gopls",
                "omnisharp",
                "pyright",
                "ts_ls",
                "bashls",

                "terraformls",

                "html",
                "cssls",
                "vuels",
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end
        end
    },
}
