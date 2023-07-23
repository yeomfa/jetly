-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local c = require("jetly.colors").config()

return {
  normal = {
    a = { bg = c.blue_munsell, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_pewter },
    c = { bg = c.background_jet, fg = c.blue_pewter },
  },
  insert = {
    a = { bg = c.green_sea, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_pewter },
    c = { bg = c.background_jet, fg = c.blue_pewter },
  },
  visual = {
    a = { bg = c.rose_asian, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_pewter },
    c = { bg = c.background_jet, fg = c.blue_pewter },
  },
  replace = {
    a = { bg = c.blue_pewter, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_pewter },
    c = { bg = c.background_jet, fg = c.blue_pewter },
  },
  command = {
    a = { bg = c.yellow_minion, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_pewter },
    c = { bg = c.background_jet, fg = c.blue_pewter },
  },
  inactive = {
    a = { bg = c.dark_jet, fg = c.gray_jet, gui = "bold" },
    b = { bg = c.dark_gray, fg = c.gray },
    c = { bg = c.dark_gray, fg = c.gray },
  },
}
