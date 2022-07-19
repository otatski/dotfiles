return {
  -- the border type to use for all floating windows, the same options/formats
  -- used for ":h nvim_open_win" e.g. "single" | "shadow" | "rounded" | {<table-of-eight-chars>}
  ui = {
    border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  outline = { auto_open = false },
  decorations = {
    statusline = { device = true, app_version = true },
  },
  widget_guides = { enabled = true, debug = true },
  dev_log = { enabled = false, open_cmd = "tabedit" },
  lsp = {
    color = {
      enabled = true,
      background = true,
      virtual_text = false,
    },
    settings = {
      showTodos = true,
      renameFilesWithClasses = "prompt",
    },
    on_attach = astronvim.lsp and astronvim.lsp.on_attach or nil,
    -- on_attach = require("config.lsp").on_attach,
    -- capabilities = require("config.lsp").capabilities,
  }
}
