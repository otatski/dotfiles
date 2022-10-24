--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

-- local trouble = require("trouble.providers.telescope")

local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = false, -- automatically reload and sync packer after a successful update
		auto_quit = false, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Set colorscheme to use
	colorscheme = "default_theme",

	-- Add highlight groups in any theme
	highlights = {
		-- init = { -- this table overrides highlights in all themes
		--   Normal = { bg = "#000000" },
		-- }
		-- duskfox = { -- a table of overrides/changes to the duskfox theme
		--   Normal = { bg = "#000000" },
		-- },
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			-- set to true or false etc.
			relativenumber = true, -- sets vim.opt.relativenumber
			number = true, -- sets vim.opt.number
			spell = false, -- sets vim.opt.spell
			signcolumn = "yes", -- sets vim.opt.signcolumn to auto
			wrap = false, -- sets vim.opt.wrap
			colorcolumn = "80",
			ignorecase = true,
			mouse = "a",
			showtabline = 0,
			hlsearch = false,
			expandtab = true,
			shiftwidth = 4,
			tabstop = 4,
			cursorline = true,
			conceallevel = 0,
			showmode = true,
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
			autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
			cmp_enabled = true, -- enable completion at start
			autopairs_enabled = true, -- enable autopairs at start
			diagnostics_enabled = true, -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
		},
	},
	-- If you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- Set dashboard header
	header = require("user.config.header"),

	-- Default theme configuration
	default_theme = {
		-- Modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		highlights = function(hl) -- or a function that returns a new table of colors to set
			local C = require "default_theme.colors"

			hl.Normal = { fg = C.fg, bg = C.bg }

			-- New approach instead of diagnostic_style
			hl.DiagnosticError.italic = true
			hl.DiagnosticHint.italic = true
			hl.DiagnosticInfo.italic = true
			hl.DiagnosticWarn.italic = true
			hl.Normal = { fg = C.fg, bg = C.none, ctermbg = C.none }
			hl.CursorColumn = { cterm = {}, ctermbg = C.none, ctermfg = C.none }


			return hl
		end,
		-- enable or disable highlighting for extra plugins
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			cmp = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = false,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			treesitter = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
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

	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
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
			-- Home / End
			["<leader>Q"] = { "<Home>", noremap = true, desc = "Home" },
			["<leader>E"] = { "<End>", noremap = true, desc = "End" },
			-- ALT + Left/Right/Up/Down Resize Windows
			["<A-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
			["<A-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
			["<A-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" },
			["<A-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" },
			["<leader>xx"] = { "<cmd>TroubleToggle<cr>", noremap = true, desc = "Toggle Trouble" },
			["<leader>xw"] = {
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				noremap = true,
				desc = "Toggle Trouble with Workspace Diagnostics",
			},
			["<leader>xd"] = {
				"<cmd>TroubleToggle document_diagnostics<cr>",
				noremap = true,
				desc = "Toggle Trouble with Document Diagnostics",
			},
			["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", noremap = true, desc = "Trouble Local List" },
			["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", noremap = true, desc = "Trouble Quickfix" },
			["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", noremap = true, desc = "Trouble Lsp References" },
		},
		i = {
			["kj"] = { "<ESC>", noremap = true, desc = "Escape Insert Mode" },
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
	},

	-- Configure plugins
	plugins = {
		init = {
			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },

			-- You can also add new plugins here as well:
			-- Add plugins, the packer syntax without the "use"
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },

			-- We also support a key value style plugin definition similar to NvChad:
			-- ["ray-x/lsp_signature.nvim"] = {
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			-- Copilot
			-- { "github/copilot.vim" },
			["zbirenbaum/copilot.lua"] = {
				config = function()
					require("copilot").setup({
						panel = {
							auto_refresh = true,
						},
						suggestion = {
							auto_trigger = true,
						},
					})
				end,
			},
			-- DAP
			{ "mfussenegger/nvim-dap" },
			-- Trouble
			["folke/trouble.nvim"] = {
				requires = "kyazdani42/nvim-web-devicons",
				config = function()
					require("trouble").setup({})
				end,
			},
			-- Markdown Priview
			{
				"iamcco/markdown-preview.nvim",
				run = function()
					vim.fn["mkdp#util#install"]()
				end,
			},
			-- LuaSnip
			["benfowler/telescope-luasnip.nvim"] = {
				after = "telescope.nvim",
				module = "telescope._extensions.luasnip",
				config = function()
					require("telescope").load_extension("luasnip")
				end,
			},
		},
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config variable is the default configuration table for the setup function call
			-- local null_ls = require "null-ls"

			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
			}
			return config -- return final config table
		end,
		treesitter = { -- overrides `require("treesitter").setup(...)`
			-- ensure_installed = { "lua" },
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			-- ensure_installed = { "sumneko_lua" },
		},
		-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
		["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
			-- ensure_installed = { "prettier", "stylua" },
		},

		["neo-tree"] = {
			window = {
				width = 50,
				mappings = {
					["l"] = "open",
					["<Right>"] = "open",
					["h"] = "close_node",
					["<Left>"] = "close_node",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
			},
		},
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			-- javascript = { "javascriptreact" },
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
	-- Telescope
	["telescope"] = {
		defaults = {
			mappings = {
				-- i = { ["<C-a>"] = trouble.open_with_trouble },
				-- n = { ["<C-a>"] = trouble.open_with_trouble },
			},
		},
	},
	--
	-- Modify which-key registration (Use this with mappings table in the above.)
	["which-key"] = {
		-- Add bindings
		register = {
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

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
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
