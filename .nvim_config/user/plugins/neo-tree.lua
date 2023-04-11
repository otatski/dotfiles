return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    opts = {
      window = {
        mappings = {
          ["<Right>"] = "child_or_open",
          ["<Left>"] = "parent_or_close",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      }
    }
  }
}
