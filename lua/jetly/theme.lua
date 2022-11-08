local M = {}

function M.load_highlights()
  if vim.fn.has("nvim-0.8.0") == 0 then
    return
  end
  vim.cmd([[
    highlight! link @annotation TSAnnotation
    highlight! link @attribute TSAttribute
    highlight! link @boolean TSBoolean
    highlight! link @character TSCharacter
    highlight! link @comment TSComment
    highlight! link @conditional TSConditional
    highlight! link @constant TSConstant
    highlight! link @constant.builtin TSConstBuiltin
    highlight! link @constant.macro TSConstMacro
    highlight! link @constructor TSConstructor
    highlight! link @exception TSException
    highlight! link @field TSField
    highlight! link @float TSFloat
    highlight! link @function TSFunction
    highlight! link @function.builtin TSFuncBuiltin
    highlight! link @function.macro TSFuncMacro
    highlight! link @include TSInclude
    highlight! link @keyword TSKeyword
    highlight! link @keyword.function TSKeywordFunction
    highlight! link @keyword.operator TSKeywordOperator
    highlight! link @label TSLabel
    highlight! link @method TSMethod
    highlight! link @namespace TSNamespace
    highlight! link @none TSNone
    highlight! link @number TSNumber
    highlight! link @operator TSOperator
    highlight! link @parameter TSParameter
    highlight! link @parameter.reference TSParameterReference
    highlight! link @property TSProperty
    highlight! link @punctuation.bracket TSPunctBracket
    highlight! link @punctuation.delimiter TSPunctDelimiter
    highlight! link @punctuation.special TSPunctSpecial
    highlight! link @repeat TSRepeat
    highlight! link @storageclass TSStorageClass
    highlight! link @string TSString
    highlight! link @string.escape TSStringEscape
    highlight! link @string.regex TSStringRegex
    highlight! link @structure TSStructure
    highlight! link @symbol TSSymbol
    highlight! link @tag TSTag
    highlight! link @tag.attribute TSAttribute
    highlight! link @tag.delimiter TSTagDelimiter
    highlight! link @text TSText
    highlight! link @strike TSStrike
    highlight! link @math TSMath
    highlight! link @type TSType
    highlight! link @type.builtin TSTypeBuiltin
    highlight! link @uri TSURI
    highlight! link @variable TSVariable
    highlight! link @variable.builtin TSVariableBuiltin
    highlight! link @variable.python pythonTSVariable
    highlight! link @decorator.python pythonTSDecorator
    highlight! link @variable.rust rustTSVariable
    highlight! link @conditional.javascript javascriptTSConditional
    highlight! link @variable.javascript javascriptTSVariable   
  ]])
end

function M.setup(config)
  config = config or require("jetly.config")
  local colors = require("jetly.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    -- EDITOR
    Normal = { bg = c.background_jet, fg = c.foreground_milk },
    NormalFloat = { bg = c.dark_jet },
    Comment = { fg = c.comment_coral, style = "italic" },
    CursorLine = { bg = c.medium_jet },
    EndOfBuffer = { fg = c.background_jet },
    Directory = { fg = c.blue_pewter },
    Visual = { bg = c.onyx_jet },
    LineNr = { fg = c.high_jet },
    CursorLineNr = { fg = c.blue_pewter },
    Underlined = { fg = c.green_sea, style = "underline" }, -- Text that stands out, HTML links

    TabLine = { bg = c.background_jet },
    TabLineFill = { bg = c.background_jet },
    TabLineSel = { fg = c.foreground_milk, bg = c.background_jet },

    VertSplit = { fg = c.low_jet },
    Terminal = { fg = c.foreground_milk, bg = c.background_jet },

    Pmenu = { fg = c.blue_pewter, bg = c.dark_jet },
    PmenuSel = { fg = c.medium_jet, bg = c.green_sea },

    ColorColumn = { bg = c.background_jet },
    SignColumn = { bg = c.background_jet },
    FoldColumn = { bg = c.background_jet },

    -- CODE
    Constant = {},
    String = { fg = c.yellow_minion },
    Number = { fg = c.orange_yellow }, --   A number constant: 234, 0xff

    Function = { fg = c.rose_asian },
    Identifier = { fg = c.blue_pewter },

    Statement = { fg = c.green_sea },
    Operator = { fg = c.foreground_milk }, --   "sizeof", "+", "*", etc.
    
    Include = { fg = c.green_sea},

    Type = { fg = c.blue_munsell }, 

    Special = { fg = c.gray_jet}, --   Character that needs attention
    SpecialChar = { fg = c.blue_pewter }, --   Special character in a constant
    -- Constant       { fg = colors.portland_orange },
    -- String         { fg = colors.lime_green}, --   A string constant: "this is a string"
    -- Character      { String }, --   A character constant: 'c', '\n'
    -- Boolean        { fg = colors.amethyst_purple}, --   A boolean constant: TRUE, false
    -- Float          { Number }, --   A floating point constant: 2.3e10

    -- Identifier     { fg = colors.pewter_blue }, -- (*) Any variable name
    -- Function       { fg = colors.salmon_rose }, --   Function name (also: methods for classes)

    -- Statement      { fg = colors.portland_orange }, -- (*) Any statement
    -- Conditional    { Statement }, --   if, then, else, endif, switch, etc.
    -- Repeat         { Statement }, --   for, do, while, etc.
    -- Label          { Statement }, --   case, default, etc.
    -- Operator       { fg = colors.fg_vintage }, --   "sizeof", "+", "*", etc.
    -- Keyword        { Statement }, --   any other keyword
    -- Exception      { Statement }, --   try, catch, throw
    
    -- PreProc        { fg = colors.portland_orange }, -- (*) Generic Preprocessor
    -- Include        { PreProc }, --   Preprocessor #include
    -- Define         { PreProc }, --   Preprocessor #define
    -- Macro          { PreProc }, --   Same as Define
    -- PreCondit      { PreProc }, --   Preprocessor #if, #else, #endif, etc.
    
    -- Type           { fg = colors.sea_green }, -- (*) int, long, char, etc.
    -- StorageClass   { Type }, --   static, register, volatile, etc.
    -- Structure      { Type }, --   struct, union, enum, etc.
    -- Typedef        { Type }, --   A typedef

    -- Special        { fg = colors.pewter_blue }, -- (*) Any special symbol
    -- SpecialChar    { fg = colors.cascada_blue }, --   Special character in a constant
    -- Tag            { Special }, --   You can use CTRL-] on this
    -- Delimiter      { fg = colors.fg_vintage }, --   Character that needs attention
    -- SpecialComment { Special }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { Special }, --   Debugging statements

    -- Diff
    DiffAdd = { fg = c.blue_pewter, bg = c.background_jet },
    DiffChange = { fg = c.blue_munsell, bg = c.background_jet },
    DiffDelete = { fg = c.rose_asian, bg = c.background_jet },
    DiffText = { bg = c.background_jet },

    -- NvimTree
    NvimTreeNormal = { fg = c.foreground_milk , bg = c.dark_jet },
    NvimTreeNormalNC = { bg = c.dark_jet },
    NvimTreeFolderIcon = { fg = c.blue_munsell },
    NvimTreeExecFile = {},
    NvimTreeRootFolder = {},

    NvimTreeGitDirty = { fg = c.rose_asian },
    NvimTreeGitStaged = { fg = c.blue_munsell},
    NvimTreeGitNew = { fg = c.yellow_minion },
    NvimTreeGitDeleted = { fg = c.rose_asian },
    NvimTreeRenamed = {},
    NvimTreeMerge = { fg = c.blue_munsell},

    -- IndentBlankline
    IndentBlanklineChar = { fg = c.low_jet },
    IndentBlanklineSpaceChar = { fg = c.low_jet },
    IndentBlanklineContextChar = { fg = c.low_green },

    -- Dashboard
    DashboardShortCut = { fg = c.blue_munsell, bg = c.onyx_jet, style = "bold" },
    DashboardHeader = { fg = c.foreground_milk },
    DashboardCenter = { fg = c.foreground_milk },
    DashboardFooter = { fg = c.yellow_minion, style = "italic" },

  }
  -- Telescope
  if config.telescope then
    theme.base = vim.tbl_extend("force", theme.base, {
      TelescopeBorder = { fg = c.dark_jet, bg = c.dark_jet },
      TelescopePromptCounter = { fg = c.foreground_milk, bg = c.high_jet },
      TelescopePromptBorder = { fg = c.high_jet, bg = c.high_jet },
      TelescopePromptNormal = { fg = c.foreground_milk, bg = c.high_jet },
      TelescopePromptPrefix = { fg = c.blue_munsell, bg = c.high_jet },

      TelescopeNormal = { bg = c.dark_jet },
      TelescopePreviewTitle = { bg = c.dark_jet },
      TelescopePromptTitle = { fg = c.foreground_milk, bg = c.high_jet, style = {"italic"} },
      TelescopeResultsTitle = { fg = c.dark_jet, bg = c.foreground_milk },

      TelescopeSelection = { fg = c.foreground_milk, bg = c.medium_jet }

    })
  end

  return theme
end

return M
