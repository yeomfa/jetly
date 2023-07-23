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
    Normal = { bg = c.background_jet, fg = c.foreground_jet },
    NormalFloat = { bg = c.dark_jet },
    Comment = { fg = c.comment_coral, style = "italic" },
    CursorLine = { bg = c.medium_jet },
    Cursor = { fg = c.background_jet, bg = c.green_sea },
    EndOfBuffer = { fg = c.background_jet },
    Directory = { fg = c.blue_pewter },
    Visual = { bg = c.blue_base },
    LineNr = { fg = c.comment_coral },
    CursorLineNr = { fg = c.blue_pewter },
    Underlined = { fg = c.green_sea, style = "underline" },
    Title = { fg = c.foreground_jet },

    Label = { fg = c.green_sea },

    VertSplit = { fg = c.background_jet },
    Terminal = { fg = c.foreground_jet, bg = c.background_jet },

    Pmenu = { fg = c.blue_pewter, bg = c.dark_jet },
    PmenuSel = { fg = c.medium_jet, bg = c.green_sea },

    ColorColumn = { bg = c.background_jet },
    SignColumn = { bg = c.background_jet },
    FoldColumn = { bg = c.background_jet },
    Conceal = { fg = c.comment_coral },

    TabLine = { bg = c.dark_jet, fg = c.comment_coral },
    TabLineFill = { bg = c.background_jet },
    TabLineSel = { fg = c.blue_pewter, bg = c.background_jet },

    ErrorMsg = { fg = c.rose_asian },
    Folded = { fg = c.comment_coral },
    IncSearch = { bg = c.gray_jet },
    MatchParen = { fg = c.foreground_jet, bg = c.high_jet, style = "underline" },
    NonText = { fg = c.comment_coral },
    Question = { fg = c.purple_clare },
    QuickFixLine = { fg = c.background_jet, bg = c.yellow_inspired },
    Search = { bg = c.gray_jet },
    SpecialKey = { fg = c.comment_coral },
    SpellBad = { fg = c.rose_asian, style = "underline" },
    SpellCap = { fg = c.yellow_inspired },
    SpellLocal = { fg = c.yellow_inspired },
    SpellRare = { fg = c.yellow_inspired },
    StatusLine = { fg = c.foreground_jet, bg = c.background_jet },
    StatusLineNC = { fg = c.comment_coral },
    StatusLineTerm = { fg = c.foreground_jet, bg = c.gray_jet },
    StatusLineTermNC = { fg = c.gray_jet },
    VisualNOS = { fg = c.gray_jet },
    WarningMsg = { fg = c.yellow_inspired },
    WildMenu = { fg = c.background_jet, bg = c.blue_munsell },

    -- CODE
    Constant = {},
    Character = { fg = c.yellow_minion },
    String = { fg = c.yellow_minion },
    Number = { fg = c.orange_mantis },
    Boolean = { fg = c.orange_yellow },
    Float = { fg = c.orange_yellow },

    Function = { fg = c.rose_asian },
    Identifier = { fg = c.blue_pewter },

    Statement = { fg = c.green_sea },
    Conditional = { fg = c.green_sea },
    Repeat = { fg = c.green_sea },
    Operator = { fg = c.foreground_jet },
    Keyword = { fg = c.green_sea, style = 'italic' },
    Exception = { fg = c.purple_clare },
    
    Include = { fg = c.green_sea },
    PreProc = { fg = c.rose_asian },
    Define = { fg = c.green_sea },
    Macro = { fg = c.orange_mantis },
    PreCondit = { fg = c.purple_clare },

    Type = { fg = c.blue_munsell }, 
    Typedef = { fg = c.green_sea },
    StorageClass = { fg = c.blue_pewter },
    Structure = { fg = c.green_sea },

    Special = { fg = c.orange_yellow },
    SpecialChar = { fg = c.blue_pewter },
    Tag = { fg = c.orange_yellow },
    Delimiter = { fg = c.gray_jet },
    SpecialComment = { fg = c.orange_yellow },
    Debug = { fg = c.orange_yellow },

    MoreMsg = { fg = c.foreground_jet },
    Todo = { fg = c.purple_clare },

    -- Diff
    DiffAdd = { fg = c.blue_pewter, bg = c.background_jet },
    DiffChange = { fg = c.blue_munsell, bg = c.background_jet },
    DiffDelete = { fg = c.rose_asian, bg = c.background_jet },
    DiffText = { bg = c.background_jet },

    -- LSP Native
    DiagnosticError = { fg = c.red_asian, bg = c.red_base },
    DiagnosticWarn = { fg = c.orange_advise, bg = c.orange_base },
    DiagnosticInfo = { fg = c.green_sea, bg = c.green_base },
    DiagnosticHint = { fg = c.blue_pewter, bg = c.blue_base },
    DiagnosticUnnecessary = { fg = c.orange_advise, bg = c.orange_base },

    -- TreeSitter
    ["@boolean"] = { fg = c.orange_yellow },
    ["@define"] = { fg = c.green_sea },
    ["@comment"] = { fg = c.comment_coral, style = config.comment_style },
    ["@error"] = { fg = c.red_asian },
    ["@punctuation.delimiter"] = { fg = c.foreground_jet },
    ["@punctuation.bracket"] = { fg = c.foreground_jet },
    ["@punctuation.special"] = { fg = c.foreground_jet },
    ["@constant"] = { fg = c.rose_asian, style = "bold" },
    ["@const.builtin"] = { fg = c.rose_asian },
    ["@string"] = { fg = c.yellow_minion, style = config.string_style },
    ["@character"] = { fg = c.yellow_minion },
    ["@number"] = { fg = c.orange_mantis },
    ["@namespace"] = { fg = c.blue_pewter },
    ["@func.builtin"] = { fg = c.yellow_inspired },
    ["@function"] = { fg = c.yellow_inspired, style = config.function_style },
    ["@func.macro"] = { fg = c.yellow_inspired },
    ["@parameter"] = { fg = c.blue_pewter, style = "nocombine" },
    ["@parameter.reference"] = { fg = c.dark_gray },
    ["@method"] = { fg = c.yellow_inspired, style = config.function_style },
    ["@field"] = { fg = c.blue_pewter },
    ["@property"] = { fg = c.blue_pewter },
    ["@constructor"] = { fg = c.green_sea, style = "nocombine" },
    ["@conditional"] = { fg = c.red_asian },
    ["@repeat"] = { fg = c.red_asian },
    ["@label"] = { fg = c.blue_pewter },
    ["@keyword"] = { fg = c.red_asian, style = config.keyword_style },
    ["@keyword.return"] = { fg = c.green_sea, style = config.keyword_style },
    ["@keyword.function"] = { fg = c.red_asian, style = config.keyword_style },
    ["@keyword.operator"] = { fg = c.red_asian },
    ["@operator"] = { fg = c.foreground_jet },
    ["@exception"] = { fg = c.red_asian },
    ["@type"] = { fg = c.green_sea },
    ["@type.builtin"] = { fg = c.blue_pewter },
    ["@type.qualifier"] = { fg = c.orange_mantis },
    ["@storageclass.lifetime"] = {fg = c.orange_mantis},
    ["@structure"] = { fg = c.blue_pewter },
    ["@variable"] = { fg = c.blue_pewter, style = config.variable_style },
    ["@variable.builtin"] = { fg = c.blue_pewter },
    ["@text"] = { fg = c.yellow_inspired },
    ["@text.strong"] = { fg = c.yellow_inspired },
    ["@text.emphasis"] = { fg = c.yellow_inspired },
    ["@text.underline"] = { fg = c.yellow_inspired },
    ["@text.title"] = { fg = c.yellow_inspired },
    ["@text.literal"] = { fg = c.yellow_inspired },
    ["@uri"] = { fg = c.yellow_inspired },
    ["@tag"] = { fg = c.green_sea },
    ["@tag.delimiter"] = { fg = c.comment },
    ["@tag.attribute"] = { fg = c.yellow_inspired },

    -- Languages 
    ["@variable.python"] = { fg = c.foreground_jet, style = "NONE" },
    pythonDecorator = { fg = c.orange_mantis, style = "bold" },
    ["@variable.rust"] = { fg = c.foreground_jet, style = "NONE" },
    ["@conditional.javascript"] = { fg = c.red_asian },
    ["@variable.javascript"] = { fg = c.blue_pewter },

    ['@lsp.type.namespace'] = { link =  '@namespace'},
    ['@lsp.type.type'] = { link = '@type'},
    ['@lsp.type.class'] = { link = '@type'},
    ['@lsp.type.enum'] = { link = '@type'},
    ['@lsp.type.interface'] = { link = '@type'},
    ['@lsp.type.struct'] = { link = '@structure'},
    ['@lsp.type.parameter'] = { link = '@parameter'},
    ['@lsp.type.variable'] = { link = '@variable'},
    ['@lsp.type.property'] = { link = '@property'},
    ['@lsp.type.enumMember'] = { link = '@constant'},
    ['@lsp.type.function'] = { link = '@function'},
    ['@lsp.type.method'] = { link = '@method'},
    ['@lsp.type.macro'] = { link = '@macro'},
    ['@lsp.type.decorator'] = { link = '@function'},

    htmlArg = { fg = c.yellow_inspired },
    htmlBold = { fg = c.yellow_inspired, style = "bold" },
    htmlEndTag = { fg = c.foreground_jet },
    htmlH1 = { fg = c.foreground_jet },
    htmlH2 = { fg = c.foreground_jet },
    htmlH3 = { fg = c.foreground_jet },
    htmlH4 = { fg = c.foreground_jet },
    htmlH5 = { fg = c.foreground_jet },
    htmlH6 = { fg = c.foreground_jet },
    htmlItalic = { fg = c.purple_clare, style = "italic" },
    htmlLink = { fg = c.foreground_jet, style = "underline" },
    htmlSpecialChar = { fg = c.yellow_inspired },
    htmlSpecialTagName = { fg = c.blue_pewter },
    htmlTag = { fg = c.gray_jet },
    htmlTagN = { fg = c.orange_mantis },
    htmlTagName = { fg = c.orange_mantis },
    htmlTitle = { fg = c.foreground_jet },

    -- NvimTree
    NvimTreeNormal = { fg = c.foreground_jet , bg = c.dark_jet },
    NvimTreeNormalNC = { bg = c.dark_jet },
    NvimTreeFolderIcon = { fg = c.yellow_inspired },
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

    -- Dashboard General
    DashboardHeader = { fg = c.foreground_jet, style = "italic" },
    DashboardFooter = { fg = c.green_sea, style = "italic" },
    DashboardShortCut = { fg = c.blue_pewter, bg = c.blue_base, style = "bold" },

    -- Dashboard Hyper
    DashboardProjectTitleIcon = { fg = c.blue_pewter },
    DashboardFiles = { fg = c.gray_jet },
    DashboardMruTitle = { fg = c.blue_pewter, style = "italic" },
    DashboardShortCutIcon = { fg = c.blue_munsell, },

  }
  -- Telescope
  if config.telescope then
    theme.base = vim.tbl_extend("force", theme.base, {
      TelescopeBorder = { fg = c.dark_jet, bg = c.dark_jet },
      TelescopePromptCounter = { fg = c.foreground_jet, bg = c.high_jet },
      TelescopePromptBorder = { fg = c.high_jet, bg = c.high_jet },
      TelescopePromptNormal = { fg = c.foreground_jet, bg = c.high_jet },
      TelescopePromptPrefix = { fg = c.blue_munsell, bg = c.high_jet },

      TelescopeNormal = { bg = c.dark_jet },
      TelescopePreviewTitle = { bg = c.dark_jet },
      TelescopePromptTitle = { fg = c.foreground_jet, bg = c.high_jet, style = {"italic"} },
      TelescopeResultsTitle = { fg = c.dark_jet, bg = c.foreground_jet },

      TelescopeSelection = { fg = c.foreground_jet, bg = c.medium_jet }

    })
  end

  return theme
end

return M
