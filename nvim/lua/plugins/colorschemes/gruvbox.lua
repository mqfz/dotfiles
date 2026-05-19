vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
})

require("gruvbox").setup({
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  overrides = {
    SignColumn = { bg = "none" },
    GruvboxGreenSign = { bg = "none" },
    GruvboxYellowSign = { bg = "none" },
    GruvboxBlueSign = { bg = "none" },
    GruvboxPurpleSign = { bg = "none" },
    GruvboxAquaSign = { bg = "none" },
    GruvboxOrangeSign = { bg = "none" },
  },
})
