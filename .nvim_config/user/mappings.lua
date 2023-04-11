return {
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
        -- CTRL + Left/Right/Up/Down to Navigate Windows
        ["<C-Left>"] = { "<C-W>h", desc = "Navigate Window Left" },
        ["<C-Right>"] = { "<C-W>l", desc = "Navigate Window Right" },
        ["<C-Up>"] = { "<C-W>k", desc = "Navigate Window Up" },
        ["<C-Down>"] = { "<C-W>j", desc = "Navigate Window Down" },
        -- SHIFT + Left/Right to Navigate Buffers
        ["<S-Left>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Navigate Buffer Left" },
        ["<S-Right>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Navigate Buffer Right" },
        -- Home / End
        ["<leader>Q"] = { "^", desc = "Home" },
        ["<leader>E"] = { "$", desc = "End" },
        -- ALT + Left/Right/Up/Down to Resize Windows
        ["<A-Left>"] = { "<C-W><", desc = "Resize Window Left" },
        ["<A-Right>"] = { "<C-W>>", desc = "Resize Window Right" },
        ["<A-Up>"] = { "<C-W>+", desc = "Resize Window Up" },
        ["<A-Down>"] = { "<C-W>-", desc = "Resize Window Down" },
        -- SHIFT + Left/Right to Switch Tabs
        -- ["<S-Left>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Switch Tab Left" },
        ["<S-Left>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Next Buffer" },
        -- ["<S-Right>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Switch Tab Right" },
        ["<S-Right>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next Buffer" },
        -- Trouble mappings
        ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", desc = "Trouble Toggle" },
        ["<leader>xw"] = {
            "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
            desc = "Trouble Workspace Diagnostics",
        },
        ["<leader>xd"] = {
            "<cmd>TroubleToggle lsp_document_diagnostics<cr>",
            desc = "Trouble Document Diagnostics",
        },
        ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Trouble Location List" },
        ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble Quick Fix" },
        ["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble References" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    },
    i = {
        -- Exit insert mode
        ["kj"] = { "<ESC>", desc = "Exit Insert Mode" },
    },
    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    },
    v = {
        -- Indent Selection one level
        ["<leader>>"] = { ">>", desc = "Indent Selection Right" },
        ["<leader><"] = { "<<", desc = "Indent Selection Left" },
    },
}
