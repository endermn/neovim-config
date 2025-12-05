return {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
        lsp = {
            auto_attach = true, -- Easier integration
        },
        highlight = true, -- Use your theme colors
        separator = " > ", -- The separator style
        depth_limit = 0,
        depth_limit_indicator = "..",
    }
}

