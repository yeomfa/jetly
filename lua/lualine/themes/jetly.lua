-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local c = require("jetly.colors").config()

return {
  normal = {
    a = { bg = c.blue_munsell, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.blue_munsell },
    c = { bg = c.medium_jet, fg = c.foreground_milk },
  },
  insert = {
    a = { bg = c.green_sea, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.green_sea },
    c = { bg = c.medium_jet, fg = c.foreground_milk },
  },
  visual = {
    a = { bg = c.rose_asian, fg = c.background_jet, gui = "bold" },
    b = { bg = c.dark_jet, fg = c.rose_asian },
    c = { bg = c.medium_jet, fg = c.foreground_milk },
  },
  replace = {
    a = { bg = c.error_red, fg = c.dark, gui = "bold" },
    b = { bg = c.background, fg = c.error_red },
    c = { bg = c.background, fg = c.milk },
  },
  command = {
    a = { bg = c.soft_green, fg = c.dark, gui = "bold" },
    b = { bg = c.background, fg = c.soft_green },
    c = { bg = c.background, fg = c.milk },
  },
  inactive = {
    a = { bg = c.dark_gray, fg = c.gray, gui = "bold" },
    b = { bg = c.dark_gray, fg = c.gray },
    c = { bg = c.dark_gray, fg = c.gray },
  },
}
