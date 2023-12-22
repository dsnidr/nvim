-- Much of this was sourced from kickstart.vim
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Set highlight on search
vim.o.hlsearch = false

-- Enable line numbers
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync OS and nvim clipboards
-- See `:help clipboard` for more info
-- vim.o.clipboard = "unnamedplus"

vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching unless \C or capital is present in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to improve completion experience
vim.o.completeopt = "menuone,noselect"

-- Enables 24-bit colors in the TUI
vim.o.termguicolors = true

-- [[ Basic Keymaps ]] --

-- Make moving between windows easier
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Keymaps for a better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic mappings
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to the previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to the next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics lisj" })

-- [[Highlight on yank]] --
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
