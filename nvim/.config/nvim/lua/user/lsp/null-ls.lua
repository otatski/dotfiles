local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- Prettier
local sources = { null_ls.builtins.formatting.prettier }

-- Lua
local sources = { null_ls.builtins.formatting.stylua }

-- Java
local sources = { null_ls.builtins.formatting.google_java_format }

-- flake8
local sources = { null_ls.builtins.diagnostics.flake8 }

-- Dart
local sources = { null_ls.builtins.formatting.dart_format }


-- Rust
local sources = { null_ls.builtins.formatting.rustfmt }

-- Go
-- local sources = { null_ls.builtins.diagnostics.golangci_lint }


-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml", "solidity" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.google_java_format,
    diagnostics.flake8,
  },
}
