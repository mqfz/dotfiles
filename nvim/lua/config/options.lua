vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.colorscheme = "kanagawa"
vim.opt.background = "dark"
vim.g.transparent = true

vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.pumblend = 25

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  extends = "▶",
  precedes = "◀",
  nbsp = "␣",
}

vim.opt.foldlevelstart = 99

vim.opt.conceallevel = 2

vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.virtualedit = "block"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cindent = true
vim.opt.cinoptions = {"N-s", "g0", "j1", "(s", "m1"}

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

vim.opt.scrolloff = 4
vim.opt.smoothscroll = true

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.timeoutlen = 1000
vim.opt.updatetime = 200

vim.opt.mouse = "a"
