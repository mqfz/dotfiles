local M = {}

local ft_autoclose = { "^snacks_", "^dapui_", "^dap-repl$" }
local ft_autoclose_ignore = { "^snacks_dashboard$" }

-- Determines if Neovim should quit if the windows is the last one open.
---@param win integer
---@return boolean
M.is_win_autoclosable = function(win)
  local config = vim.api.nvim_win_get_config(win)
  local buf = vim.api.nvim_win_get_buf(win)
  local wininfo = vim.fn.getwininfo(win)[1]
  local is_ft = vim.iter(ft_autoclose):any(function(pattern)
    return vim.bo[buf].ft:match(pattern)
  end)
  local is_ignore = vim.iter(ft_autoclose_ignore):any(function(pattern)
    return vim.bo[buf].ft:match(pattern)
  end)
  local is_float = config.relative ~= ""
  local is_qf = wininfo.quickfix == 1 or wininfo.loclist == 1
  return not is_ignore and (is_ft or is_float or is_qf)
end

-- Filters windows by if neovim should quit if they are the last window open.
-- The first value contains all windows that should NOT allow Neovim to quit.
-- The second value contains all windows that should allow Neovim to quit.
---@return integer[], integer[]
M.filter_wins_by_autoclose = function()
  local open, close = {}, {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if M.is_win_autoclosable(win) then
      table.insert(close, win)
    else
      table.insert(open, win)
    end
  end
  return open, close
end

return M
