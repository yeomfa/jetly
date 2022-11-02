local util = require("jetly.util")
local theme = require("jetly.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
  require("jetly.ts")
end

return M
