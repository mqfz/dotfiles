local utils = require("utils")

require("plugins.colorschemes.catppuccin")
require("plugins.colorschemes.gruvbox")
require("plugins.colorschemes.kanagawa")
require("plugins.colorschemes.tokyonight")

utils.transparency.exclude_group_prefix({})
utils.transparency.exclude_group({})
utils.transparency.add_group_prefix({})
utils.transparency.add_group({ "Normal" })

if vim.g.transparent then
  utils.transparency.enable()
end

vim.schedule(function()
  vim.cmd.colorscheme(vim.g.colorscheme)
end)
