local palette = {
  background_jet = "#212B30",
  low_jet = "#29353D",
  dark_jet = "#1C2429",
  medium_jet = "#1F282E",
  onyx_jet = "#29353D",
  high_jet = "#394A56",
  low_green = "#4A695C",
  gray_jet = "#B1BEC7",
  comment_coral = "#526A7A",
  purple_clare = "#9D60BE",
  blue_munsell = "#439FBD",
  blue_pewter = "#85BCC7",
  green_sea = "#73c5a1",
  yellow_minion = "#AEC785",
  rose_asian = "#EB818A",
  red_asian = "#FF3434",
  yellow_inspired = "#E7CF57",
  orange_yellow = "#E39B3D",
  orange_mantis = "#F88944",
  foreground_jet = "#DFEDC7",
  none = "NONE",
}

M = {} function M.config(config) config = config or require("jetly.config")
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
