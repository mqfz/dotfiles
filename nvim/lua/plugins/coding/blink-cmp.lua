vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/onsails/lspkind.nvim",
  "https://github.com/nvim-mini/mini.icons",
})

local cmp = require("blink.cmp")
local icons = require("mini.icons")
local lspkind = require("lspkind")

cmp.build():wait(60000)

cmp.setup({
  cmdline = {
    enabled = false,
  },

  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },

    menu = {
      auto_show = false,

      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              if ctx.source_name ~= "Path" then
                return lspkind.symbol_map[ctx.kind] or "" .. ctx.icon_gap
              end

              local is_unknown_type = vim.tbl_contains(
                { "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type
              )

              local mini_icon, _ = icons.get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )

              return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
            end,

            highlight = function(ctx)
              if ctx.source_name ~= "Path" then return ctx.kind_hl end

              local is_unknown_type = vim.tbl_contains(
                { "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type
              )

              local mini_icon, mini_hl = icons.get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )

              return mini_icon ~= nil and mini_hl or ctx.kind_hl
            end,
          },
        },
      },
    },
    
    documentation = {
      auto_show = false,
    },

    -- ghost_text = {
    --   enabled = true,
    --   show_with_menu = false,
    -- },
  },

  signature = {
    enabled = false,
  },
})
