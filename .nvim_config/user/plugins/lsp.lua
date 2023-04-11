return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "rust_analyzer",
                "tsserver",
            }
        }
    },
    -- {"neovim/nvim-lspconfig",}
    { "lvimuser/lsp-inlayhints.nvim", config = true },
    {
        "p00f/clangd_extensions.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        opts = function()
            return {
                server = astronvim.lsp.server_settings "clangd",
                extensions = { autoSetHints = false }
            }
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        ft = { "rs" },
        opts = function()
            return {
                server = astronvim.lsp.server_settings "rust_analyzer"
            }
        end
    },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        opts = {
            widget_guides = { enabled = true, debug = true },
            decoractions = { statusline = { device = true, app_version = true },
            }
        }
    },
    {
        "jose-elias-alvarez/typescript.nvim",
        ft = { "ts", "js", "vue", "jsx" },
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        opts = function()
            return {
                server = astronvim.lsp.server_settings "tsserver",
            }
        end
    },
}
