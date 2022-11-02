local palette = {
  background_jet = "#292929",
  dark_jet = "#1c1e21",
  medium_jet = "#42454c",
  comment_coral = "#607590",
  yellow_minion = "#ffe668",
  blue_navy = "#2f7ad0",
  blue_light = "#bcd3ee",
  orange_portland = "#f1602f",
  red_geranium = "#e12727",
  red_imperial = "#e43b3b",
  yellow_sunglow = "#fdcd1c",
  foreground_milk = "#eeedc8",
  none = "NONE",
}

palette.diff = {
  add = "#2F382C",
  change = "#2E4B4C",
  delete = "#4c2e2e",
  text = "#2F364D",
}

M = {}

function M.config(config)
  config = config or require("jetly.config")
  local colors
  colors = palette
  if config.transparent then
    local transparent = {
      background_jet = colors.none
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end

  return colors
end

return M
