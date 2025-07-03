-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Enable Ubuntu as the default shell
-- vim.opt.shell = "wsl.exe" -- Use WSL bash as the shell
-- vim.opt.shellcmdflag = "-d Ubuntu-22.04 --exec bash -l -c"
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-c" -- Use PowerShell command flag
vim.opt.shellquote = ""
vim.opt.shellxquote = ""    -- No quotes around command arguments
vim.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = 'horizontal', -- Can be 'vertical' | 'horizontal' | 'tab' | 'float'
}

-- Set a compatible clipboard manager
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
lvim.transparent_window = false

-- Vim options
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c-i:underscore"
vim.o.background = "dark"   -- Set background to dark for better contrast
vim.cmd.colorscheme "hyper" -- Set the colorscheme to hyper

-- Additional plugins (only add what LunarVim doesn't include by default)
lvim.plugins = {
  { "ThePrimeagen/harpoon",         branch = "harpoon2" },
  { "folke/tokyonight.nvim" },
  { "junegunn/vim-easy-align" },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  { "github/copilot.vim" },
  { "windwp/nvim-ts-autotag" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "typescript", "html", "css" },
        highlight = { enable = true },
        indent = { enable = false }, -- Keep disabled as you have it
      })
    end,
  },
  { 'akinsho/toggleterm.nvim',      version = "*",  config = true },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  { 'paulo-granthon/hyper.nvim' },
}

-- File Explorer (NvimTree is built into LunarVim)
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.renderer.group_empty = true
lvim.builtin.nvimtree.setup.filters.dotfiles = true

-- Treesitter configuration
lvim.builtin.treesitter.indent = { enable = false }
lvim.builtin.indentlines.active = false

-- Formatters (use LunarVim's built-in formatter setup)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
-- { command = "prettier", filetypes = { "typescript", "javascript", "json", "css", "html" } },
-- }

-- Setup plugins after LunarVim loads
lvim.builtin.which_key.setup = {}
lvim.builtin.treesitter.ensure_installed = {}



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


-- Appearance Highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd([[highlight Normal guibg=none]])
    vim.cmd([[highlight NonText guibg=none]])
    vim.cmd([[highlight LineNr guibg=#333bb7 guifg=#cfcfcf]])
  end,
})
