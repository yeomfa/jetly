local hsluv = require("jetly.hsluv")
local theme_util = require("jetly.theme")

local util = {}

util.colorsUsed = {}

util.bg = "#000000"
util.fg = "#ffffff"

function util.highlight(group, color)
  if color.fg then
    util.colorsUsed[color.fg] = true
  end
  if color.bg then
    util.colorsUsed[color.bg] = true
  end
  if color.sp then
    util.colorsUsed[color.sp] = true
  end

  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  else
    local data = {}
    if color.fg then
      data.fg = color.fg
    end
    if color.bg then
      data.bg = color.bg
    end
    if color.sp then
      data.sp = color.sp
    end
    if color.style and not (color.style == "NONE") then
      if type(color.style) == "string" then
        data[color.style] = true
      end
      if type(color.style) == "table" then
        for _, style in ipairs(color.style) do
          data[style] = true
        end
      end
    end
    vim.api.nvim_set_hl(0, group, data)
  end
end

function util.load(theme) 
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "jetly"

  -- load base theme  
  for group, colors in pairs(theme.base) do
    util.highlight(group, colors)
  end

  theme_util.load_highlights()
end

return util
