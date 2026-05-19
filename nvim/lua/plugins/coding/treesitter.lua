vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").install({
  "asm",
  "bash",
  "c",
  "cmake",
  "cpp",
  "css",
  "csv",
  "diff",
  "editorconfig",
  "java",
  "javadoc",
  "javascript",
  "json",
  "latex",
  "lua",
  "luadoc",
  "make",
  "markdown",
  "python",
  "regex",
  "rust",
  "toml",
  "vim",
  "vimdoc",
  "typescript",
  "xml",
  "yaml",
  "zsh",
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"
