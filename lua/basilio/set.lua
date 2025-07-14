vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.spell = true
vim.opt.spelllang = "en,ru"

vim.opt.list = true
vim.opt.listchars = { tab = "→ ", extends = "", precedes = "", trail = "∙", eol = "" }

vim.opt.showbreak = "﬌ "

vim.opt.wrap = false
--vim.opt.tabstop = 4
--vim.opt.expandtab = false
--vim.opt.shiftwidth = 4
--vim.opt.softtabstop = 4

-- Устанавливаем табы для C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"cpp", "c"},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Устанавливаем табы для Rust, Python, Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"rust", "python", "lua"},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Устанавливаем табы для JS, solidity
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"solidity", "javascript", "javascriptreact", "json", "typescript", "typescriptreact"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})


vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"
