local M = {}

local augroup = vim.api.nvim_create_augroup("Transparent", { clear = true })
local enabled = false

local exclude_groups = {}
local exclude_group_prefixes = {}
local groups = {}
local group_prefixes = {}

local clearable = function(name)
  if
    vim.iter(exclude_group_prefixes):any(function(s)
      return vim.startswith(name, s)
    end)
    or vim.iter(exclude_groups):any(function(s)
      return s == name
    end)
  then
    return false
  end
  if
    vim.iter(group_prefixes):any(function(s)
      return vim.startswith(name, s)
    end) or vim.iter(groups):any(function(s)
      return s == name
    end)
  then
    return true
  end
  return false
end

local clear = function()
  for name, attrs in pairs(vim.api.nvim_get_hl(0, {})) do
    if clearable(name) and (attrs.bg or attrs.ctermbg) then
      vim.api.nvim_set_hl(
        0,
        name,
        vim.tbl_extend("force", attrs, {
          bg = "none",
          ctermbg = "none",
        })
      )
    end
  end
end

M.clear = function()
  if not enabled then
    return
  end

  clear()
end

-- Enables Transparency.
M.enable = function()
  if enabled then
    return
  end
  enabled = true
  M.clear()
end

-- Disables Transparency.
M.disable = function()
  if not enabled then
    return
  end
  enabled = false
  local colorscheme =
    vim.api.nvim_exec2("colorscheme", { output = true }).output
  vim.cmd.colorscheme(colorscheme)
end

-- Toggles Transparency.
M.toggle = function()
  if enabled then
    M.disable()
  else
    M.enable()
  end
end

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  group = augroup,
  desc = "Clear background colors",
  pattern = "*",
  callback = M.clear,
})

-- Exclude highlight group prefix from transparent list.
---@param group_prefix table | string
M.exclude_group_prefix = function(group_prefix)
  if type(group_prefix) == "string" then
    group_prefix = { group_prefix }
  end
  vim.list_extend(exclude_group_prefixes, group_prefix)
end

-- Exclude highlight group from transparent list.
---@param group table | string
M.exclude_group = function(group)
  if type(group) == "string" then
    group = { group }
  end
  vim.list_extend(exclude_groups, group)
end

-- Add highlight group prefix to transparent list.
---@param group_prefix table | string
M.add_group_prefix = function(group_prefix)
  if type(group_prefix) == "string" then
    group_prefix = { group_prefix }
  end
  vim.list_extend(group_prefixes, group_prefix)
end

-- Add highlight group to transparent list.
---@param group table | string
M.add_group = function(group)
  if type(group) == "string" then
    group = { group }
  end
  vim.list_extend(groups, group)
end

return M
