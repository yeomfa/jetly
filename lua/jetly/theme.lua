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
    Directory = { fg = c.blue_light },
    NvimTreeFolderIcon = { fg = c.orange_portland },
    Normal = { bg = c.background_jet },
  }

  return theme
end

return M
