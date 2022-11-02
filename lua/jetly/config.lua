local config

vim = vim or { g = {}, o = {} } 

local function opt(key, default)
  key = "jetly_" .. key
  if vim.g[key] == nil then
    return default
  end
  if vim.g[key] == 0 then
    return false
  end
  return vim.g[key]
end

config = {
  transparent = opt("transparent", false),
  telescope = opt("telescope", false),
  rustic_mode = opt("rustic_mode", false),
  normal_icons = opt("normal_icons", false),
}

return config
