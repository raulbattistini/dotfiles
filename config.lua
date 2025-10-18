-- Docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- For WSL
-- vim.opt.shell = "wsl.exe"
-- vim.opt.shellcmdflag = "-d Ubuntu-22.04 --exec bash -l -c"
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-c" -- PowerShell command flag
vim.opt.shellquote = ""
vim.opt.shellxquote = ""    -- No quotes around command arguments
vim.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]
vim.opt.wrap = true
vim.opt.linebreak = true -- Wraps by word rather than character

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
}

-- Compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- LunarVim Configuration
lvim.log.level = "warn"
lvim.format_on_save = true

-- Vim options
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = false
vim.opt.guicursor = "n-v-c-i:underscore"
vim.o.background = "dark" -- Dark background for better contrast 
lvim.transparent_window = true
lvim.colorscheme = "onedark"

-- Additional plugins (the ones that LunarVim doesn't include by default)
lvim.plugins = {
  { "junegunn/vim-easy-align" },
  -- { "github/copilot.vim" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        -- Filetypes for which auto-tagging is enabled
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact", -- Enables auto-closing/renaming for JSX (.jsx, .tsx)
          "typescriptreact", -- Enables auto-closing/renaming for TSX (.tsx)
          "xml",
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "typescript", "html", "css" },
        highlight = { enable = true },
        indent = { enable = false }, 
      })
    end,
  },
  {
    "rust-lang/rustfmt",
  },
  {
    "fatih/vim-go",
    build = ":GoUpdateBinaries"
  },
  { 
    'numToStr/Comment.nvim', 
    opts = {},
    config = function()
    require('Comment').setup() 
    end
  },
  { 
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = true 
  },
  {
    "yassinebridi/vim-purpura",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'paulo-granthon/hyper.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    ft = { "markdown" },
  },
  {
    "voldikss/vim-floaterm"
  },
  {
    "camspiers/luarocks",
    opts = { rocks = { "fzy" } },
  },
  {
    "camspiers/snap",
    dependencies = { "camspiers/luarocks" },
  },
  -- Colorschemes
  {
    "Mofiqul/dracula.nvim"
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },
  {
    "yorumicolors/yorumi.nvim",
    name = "yorumi",
    lazy = false,
    priority = 1000
  },
  {
    "bignimbus/pop-punk.vim",
    lazy = false,
    priority = 1000
  },
  {
    "Rigellute/shades-of-purple.vim",
    lazy = false,
    priority = 1000
  },
  {
    "amadeus/vim-evokai",
    lazy = false,
    priority = 1000
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    branch = "master",
    lazy = false,
    priority = 1000
  },
  {
    "rose-pine/vim",
    lazy = false,
    priority = 1000
  },
  {
    "artanikin/vim-synthwave84",
    lazy = false,
    priority = 1000
  },
  -- {
  --  "pinneapplegiant/spaceduck",
  -- priority = 1000
  -- blazy = false,
  -- },
  {
    "jaredgorski/spacecamp",
    lazy = false,
    priority = 1000
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, 
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  },
  -- {
  -- "dylanraps/wal.vim",
  -- lazy = false,
  -- priority = 1000
  -- },
  {
    "kaicataldo/material.vim",
    lazy = false,
    priority = 1000
  },
  {
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  }
}

-- File Explorer (NvimTree is built into LunarVim)
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.renderer.group_empty = true
lvim.builtin.nvimtree.setup.filters.dotfiles = true

-- Treesitter configuration
lvim.builtin.treesitter.indent = { enable = false }
lvim.builtin.indentlines.active = false
lvim.keys.normal_mode["<leader>tw"] = ":set wrap!<CR>"

-- Formatters (use LunarVim's built-in formatter setup)
-- Lvim built-in formatter configuration (conform.nvim)
lvim.builtin.conform = {
  -- Keep this active as it is the default formatter now
  active = true,
  -- Configure formatters for specific file types
  formatters_by_ft = {
    -- JavaScript and React
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    -- TypeScript and React
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    -- HTML and CSS
    html = { "prettier" },
    css = { "prettier" },
    -- Other common files
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    lua = { "stylua" }, -- Keep default Lua formatter or set to nil
  },
  -- Configuration for formatting on save
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "never", -- This is crucial to prevent LSPs from conflicting with Prettier
    async = false,
    quiet = false,
  },
}
-- Setup plugins after LunarVim loads
lvim.builtin.which_key.setup = {}
lvim.builtin.treesitter.ensure_installed = {}

-- Split ToggleTerm Horizontally with Shift+5 ("%") Inside Terminal
vim.keymap.set("t", "%", [[<C-\><C-n>:sp<CR>:ToggleTerm<CR>i]],
  { desc = "Vertical Split Terminal", noremap = true, silent = true })

-- Configure Harpoon after it's loaded
table.insert(lvim.plugins, {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Harpoon Keybindings
    vim.keymap.set("n", "<C-z>", function() harpoon:list():add() end, { desc = "Harpoon Add File" })
    vim.keymap.set("n", "<C-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon Toggle Menu" })
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon Select 1" })
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon Select 2" })
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon Select 3" })
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon Select 4" })
    vim.keymap.set("n", "<C-S-PageUp>", function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
    vim.keymap.set("n", "<C-S-PageDown>", function() harpoon:list():next() end, { desc = "Harpoon Next" })
  end
})



-- Open Floaterm Tab with <leader>tf (silent)
vim.keymap.set("n", "<leader>tf", ":FloatermNew<CR>", { noremap = true, silent = true, desc = "Open Floaterm" })
vim.keymap.set("n", "<leader>tn", ":FloatermNext<CR>", { noremap = true, silent = true, desc = "Next Floaterm" })
vim.keymap.set("n", "<leader>tp", ":FloatermPrev<CR>", { noremap = true, silent = true, desc = "Previous Floaterm" })

-- Close Floaterm Works Inside Terminal Mode Too
vim.keymap.set("t", "<leader>tc", [[<C-\><C-n>:FloatermKill<CR>]],
  { noremap = true, silent = true, desc = "Close Floaterm" })
vim.keymap.set("n", "<leader>tc", ":FloatermKill<CR>", { noremap = true, silent = true, desc = "Close Floaterm" })

-- NvimTree Keybindings (these use LunarVim's built-in NvimTree)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<C-e>", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Git Keybindings (LunarVim has gitsigns built-in)
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff" })
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
vim.keymap.set("n", "<leader>gB", ":Gitsigns blame_line<CR>", { desc = "Blame Line" })

-- Telescope keybindings (LunarVim has telescope built-in)
vim.keymap.set("n", "<C-f>", require('telescope.builtin').find_files, { desc = "Find Files" })
vim.keymap.set("n", "<C-g>", require('telescope.builtin').live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<C-b>", require('telescope.builtin').buffers, { desc = "Buffers" })
vim.keymap.set("n", "<C-S-h>", require('telescope.builtin').help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle Markdown Preview"
})

-- Markdown Preview Settings
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_preview_options = {
  disable_sync_scroll = 0,
  sync_scroll_type = "middle",
  hide_yaml_meta = 1,
}

-- Quick Log Statements (define the function first)
local function QuickLog(opts)
  opts = opts or {}
  local line = vim.api.nvim_get_current_line()
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  local log_statement = opts.addLineNumber and
      string.format('console.log("Line %d:", %s);', line_num, line) or
      string.format('console.log(%s);', line)
  vim.api.nvim_put({ log_statement }, 'l', true, true)
end

vim.keymap.set("n", "<leader>l", function() QuickLog({ addLineNumber = true }) end,
  { desc = "Quick Log with Line Number" })
vim.keymap.set("n", "<leader>L", function() QuickLog({ addLineNumber = false }) end, { desc = "Quick Log" })
-- Tab navigation with Ctrl+PageUp/PageDown
vim.keymap.set("n", "<C-PageUp>", function() vim.cmd("bprevious") end, { desc = "Previous Buffer/Tab" })
vim.keymap.set("n", "<C-PageDown>", function() vim.cmd("bnext") end, { desc = "Next Buffer/Tab" })

-- Appearance Highlighting - Apply after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- These are the minimum required for transparency
    vim.cmd([[highlight Normal guibg=none]])
    vim.cmd([[highlight NonText guibg=none]])
    -- These make the line number, fold, and sign columns transparent
    vim.cmd([[highlight LineNr guibg=none]])
    vim.cmd([[highlight FoldColumn guibg=none]])
    vim.cmd([[highlight SignColumn guibg=none]])
  end,
})
-- Forcing colorscheme application after everything loads
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd.colorscheme("onedark")
  end,
})
