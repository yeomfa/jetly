-- local config = config or require("jetly.config")
local bluesic = {
  background_jet = "#192124",
  low_jet = "#29353D",
  dark_jet = "#141A1D",
  medium_jet = "#1F282E",
  onyx_jet = "#29353D",
  high_jet = "#394A56",
  low_green = "#4A695C",
  gray_jet = "#B1BEC7",
  comment_coral = "#526A7A",
  purple_clare = "#ba85d6",
  blue_munsell = "#439FBD",
  blue_pewter = "#85BCC7",
  blue_base = "#293539";
  green_sea = "#73c5a1",
  green_base = "#26332D";
  yellow_minion = "#AEC785",
  rose_asian = "#FF6A77",
  red_asian = "#FF3434",
  red_base = "#332626";
  yellow_inspired = "#E7CF57",
  orange_yellow = "#E39B3D",
  orange_advise = "#e8880c",
  orange_mantis = "#F88944",
  orange_base = "#392F29";
  foreground_jet = "#DFEDC7",
  none = "NONE",
}

local darksic = {
  background_jet = "#171717",
  low_jet = "#29353D",
  dark_jet = "#151515",
  medium_jet = "#1F282E",
  onyx_jet = "#29353D",
  high_jet = "#394A56",
  low_green = "#4A695C",
  gray_jet = "#B1BEC7",
  comment_coral = "#526A7A",
  purple_clare = "#ba85d6",
  blue_munsell = "#439FBD",
  blue_pewter = "#85BCC7",
  green_sea = "#73c5a1",
  yellow_minion = "#AEC785",
  rose_asian = "#FF6A77",
  red_asian = "#FF3434",
  yellow_inspired = "#E7CF57",
  orange_yellow = "#E39B3D",
  orange_mantis = "#F88944",
  foreground_jet = "#DFEDC7",
  none = "NONE",
}

M = {} function M.config(config) config = config or require("jetly.config")
  local colors
  if config.variant == "darksic" then
    colors = darksic
  else
    colors = bluesic
  end
  if config.transparent then
    local transparent = {
      background_jet = colors.none
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end

  return colors
end

return M
