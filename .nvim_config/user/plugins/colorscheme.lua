return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    name = "vscode",
    config = function()
      require("vscode").setup()
    end,
  }
}
