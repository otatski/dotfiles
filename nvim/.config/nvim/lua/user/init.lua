local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Override highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides
    --   Normal = { bg = "#000000" },
    -- },
    default_theme = function(highlights) -- or a function that returns one
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- guicursor = "",
      relativenumber = true, -- sets vim.opt.relativenumber
      colorcolumn = "80",
      ignorecase = true,
      mouse = "a",
      showtabline = 0,
      hlsearch = false,
      expandtab = true,
      shiftwidth = 4,
      tabstop = 4,
      cursorline = true,
      signcolumn = "yes",
      conceallevel = 0,
      -- showmode = false,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    plugins = { -- enable or disable extra plugin highlighting
      -- ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },
      -- ["feline-nvim/feline.nvim"] = { disable = true },
      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      -- { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }}
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -----------------------------------------------------------------------
        -- Formatters
        -----------------------------------------------------------------------
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- ESLint - JS/JS(React)/TS/TS(React)/Vue
        null_ls.builtins.formatting.eslint,
        -- Dart / Flutter
        null_ls.builtins.formatting.dart_format,
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        -- Clang - C/C++/C#/Java/Cuda
        null_ls.builtins.formatting.clang_format,
        -- Ruby
        null_ls.builtins.formatting.rufo,
        -----------------------------------------------------------------------
        -----------------------------------------------------------------------
        -- Linters
        -----------------------------------------------------------------------
        -- Ruby
        null_ls.builtins.diagnostics.rubocop,
        -- ESLint
        null_ls.builtins.diagnostics.eslint,
        -- Make
        null_ls.builtins.diagnostics.checkmake,
        -- C/C++ Static Analysis
        null_ls.builtins.diagnostics.cppcheck,
        -- Flake8 Python
        null_ls.builtins.diagnostics.flake8,
        -- Golangci_lint Go
        null_ls.builtins.diagnostics.golangci_lint,
        -----------------------------------------------------------------------
        -- Code Actions
        -----------------------------------------------------------------------
        -- ESLint
        null_ls.builtins.code_actions.eslint,
        -----------------------------------------------------------------------
        -- Completion
        -----------------------------------------------------------------------
        -- {}
        null_ls.builtins.completion.luasnip,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
  },
  ["neo-tree"] = {
    window = {
      width = 150,
      mappings = {
        ["l"] = "open",
        ["Right"] = "open",
        -- ["h"] = "close",
        -- ["<C-Left>"] = "close",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
        ["b"] = {},
        ["c"] = {},
        ["e"] = {},
        ["f"] = {},
        ["g"] = {},
        ["i"] = {},
        ["m"] = {},
        ["n"] = {},
        ["p"] = {},
        ["q"] = {},
        ["r"] = {},
        ["s"] = {},
        ["t"] = {},
        ["u"] = {},
        ["v"] = {},
        ["w"] = {},
        ["x"] = {},
        ["z"] = {},
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- CTRL + S to save current buffer
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
      --
      -- CTRL + Left/Right/Up/Down Navigate windows
      ["<C-Left>"] = { "<C-w>h", noremap = true, desc = "Left Window" },
      ["<C-Right>"] = { "<C-w>l", noremap = true, desc = "Right Window" },
      ["<C-Up>"] = { "<C-w>k", noremap = true, desc = "Up Window" },
      ["<C-Down>"] = { "<C-w>j", noremap = true, desc = "Down Window" },
      -- CTRL + Left/Right Navigate buffers
      ["<S-Left>"] = { "<cmd>bprevious<CR>", noremap = true, desc = "Left Buffer" },
      ["<S-Right>"] = { "<cmd>bnext<CR>", noremap = true, desc = "Right Buffer" },
      -- Split Window
      -- ["<C-s>h"] = { "<C-w>s", noremap = true, desc = "Split Window Horizontally" },
      -- ["<C-s>v"] = { "<C-w>v", noremap = true, desc = "Split Window Vertically" },
    },
    i = {
      ["kj"] = { "<ESC>", noremap = true, desc = "Escape Insert Mode" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- local unmap = vim.api.nvim_del_keymap
    -- Set key binding
    -- unmap("n", "<C-Left>")
    -- unmap("n", "<C-Right>")
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
