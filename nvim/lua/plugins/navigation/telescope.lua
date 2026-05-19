local utils = require("utils")

vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({
  
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>fg", builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set("n", "<Leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set("n", "<Leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Telescope current buffer fuzzy find" })
vim.keymap.set("n", "<Leader>gd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<Leader>gr", builtin.lsp_references, { desc = "Telescope lsp references" })
vim.keymap.set("n", "<Leader>gs", builtin.lsp_document_symbols, { desc = "Telescope lsp document symbols" })
vim.keymap.set("n", "<Leader>gw", builtin.lsp_workspace_symbols, { desc = "Telescope lsp reference symbols" })

utils.transparency.add_group({ "TelescopeBorder" })
