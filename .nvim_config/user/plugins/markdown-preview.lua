return {
    "iamcco/markdown-preview.nvim",
    ft = "md",
    opts = {
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }
}
