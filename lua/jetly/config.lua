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
  telescope = opt("telescope", true),
  rustic_mode = opt("rustic_mode", false),
  normal_icons = opt("normal_icons", false),
  comment_style = opt("comment_style", "italic"),
  string_style = opt("string_style", "nocombine"),
  function_style = opt("function_style", "italic"),
  keyword_style = opt("keyword_style", "italic"),
  variable_style = opt("variable_style", "italic"),
}

return config
