local util = require("tokyonight.util")
local colors = require("tokyonight.colors")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
  
  local config = require("tokyonight.config")
  local options = config.options
  
  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }

  local color = theme.colors

  theme.highlights = {
    
    Foo = { bg = color.magenta2, fg = color.magenta2 },
    Comment = { fg = color.comment, style = options.styles.comments }, -- any comment
    ColorColumn = { bg = color.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = color.dark5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = color.bg, bg = color.fg }, -- character under the cursor
    lCursor = { fg = color.bg, bg = color.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = color.bg, bg = color.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = color.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = color.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = color.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = color.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = color.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = color.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = color.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = color.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = color.error }, -- error messages on the command line
    VertSplit = { fg = color.border }, -- the column separating vertically split windows
    WinSeparator = { fg = color.border, bold = true }, -- the column separating vertically split windows
    Folded = { fg = color.blue, bg = color.fg_gutter }, -- line used for closed folds
    FoldColumn = { bg = options.transparent and color.none or color.bg, fg = color.comment }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and color.none or color.bg, fg = color.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = color.bg_sidebar, fg = color.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = color.red, fg = color.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = color.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = color.dark5 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = color.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = color.fg_dark, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = color.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = color.blue }, -- |more-prompt|
    NonText = { fg = color.dark3 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = color.fg, bg = options.transparent and color.none or color.bg }, -- normal text
    NormalNC = { fg = color.fg, bg = options.transparent and color.none or options.dim_inactive and color.bg_dark or color.bg }, -- normal text in non-current windows
    NormalSB = { fg = color.fg_sidebar, bg = color.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = color.fg_float, bg = color.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = color.border_highlight, bg = color.bg_float },
    Pmenu = { bg = color.bg_popup, fg = color.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(color.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(color.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = color.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = color.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = color.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = color.bg_search, fg = color.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = color.orange, fg = color.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = color.dark3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = color.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = color.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = color.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = color.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = color.fg_sidebar, bg = color.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = color.fg_gutter, bg = color.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = color.bg_statusline, fg = color.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = color.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = color.black, bg = color.blue }, -- tab pages line, active tab page label
    Title = { fg = color.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = color.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = color.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = color.warning }, -- warning messages
    Whitespace = { fg = color.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = color.bg_visual }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = color.orange }, -- (preferred) any constant
    String = { fg = color.green }, --   a string constant: "this is a string"
    Character = { fg = color.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = color.magenta, style = options.styles.variables }, -- (preferred) any variable name
    Function = { fg = color.blue, style = options.styles.functions }, -- function name (also: methods for classes)

    Statement = { fg = color.magenta }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = color.blue5 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = color.cyan, style = options.styles.keywords }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = color.cyan }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = color.blue1 }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = color.blue1 }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = color.error }, -- (preferred) any erroneous construct
    Todo = { bg = color.yellow, fg = color.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = color.dark5 },
    qfFileName = { fg = color.blue },

    htmlH1 = { fg = color.magenta, bold = true },
    htmlH2 = { fg = color.blue, bold = true },

    -- mkdHeading = { fg = color.orange, bold = true },
    -- mkdCode = { bg = color.terminal_black, fg = color.fg },
    mkdCodeDelimiter = { bg = color.terminal_black, fg = color.fg },
    mkdCodeStart = { fg = color.teal, bold = true },
    mkdCodeEnd = { fg = color.teal, bold = true },
    -- mkdLink = { fg = color.blue, underline = true },

    markdownHeadingDelimiter = { fg = color.orange, bold = true },
    markdownCode = { fg = color.teal },
    markdownCodeBlock = { fg = color.teal },
    markdownH1 = { fg = color.magenta, bold = true },
    markdownH2 = { fg = color.blue, bold = true },
    markdownLinkText = { fg = color.blue, underline = true },

    ["@punctuation.special.markdown"] = { fg = color.orange, bold = true },
    ["@text.todo.unchecked"] = { fg = color.blue }, -- For brackets and parens.
    ["@text.todo.checked"] = { fg = color.green1 }, -- For brackets and parens.
    ["@text.literal.markdown_inline"] = { bg = color.terminal_black, fg = color.blue },
    ["@text.literal.markdown"] = { link = "Normal" },

    debugPC = { bg = color.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(color.info, 0.1), fg = color.info }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = color.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = color.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = color.fg_gutter }, -- used for highlighting "write" references

    DiagnosticError = { fg = color.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = color.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = color.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = color.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = util.darken(color.error, 0.1), fg = color.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.darken(color.warning, 0.1), fg = color.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.darken(color.info, 0.1), fg = color.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.darken(color.hint, 0.1), fg = color.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = color.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = color.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = color.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = color.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = util.darken(color.bg_visual, 0.4), bold = true },
    LspCodeLens = { fg = color.comment },

    LspInfoBorder = { fg = color.border_highlight, bg = color.bg_float },

    ALEErrorSign = { fg = color.error },
    ALEWarningSign = { fg = color.warning },

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean           = { };    -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    TSNote = { fg = color.bg, bg = color.info },
    ["@text.warning"] = { fg = color.bg, bg = color.warning },
    ["@text.danger"] = { fg = color.bg, bg = color.error },
    ["@constructor"] = { fg = color.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    -- TSConstant          = { };    -- For constants
    -- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    ["@field"] = { fg = color.green1 }, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude           = { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    ["@keyword"] = { fg = color.purple, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = color.magenta, style = options.styles.functions }, -- For keywords used to define a fuction.
    ["@label"] = { fg = color.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    -- TSNamespace         = { };    -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    ["@operator"] = { fg = color.blue5 }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@parameter"] = { fg = color.yellow }, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    ["@property"] = { fg = color.green1 }, -- Same as `TSField`.
    ["@punctuation.delimiter"] = { fg = color.blue5 }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = color.fg_dark }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = color.blue5 }, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    ["@string.regex"] = { fg = color.blue6 }, -- For regexes.
    ["@string.escape"] = { fg = color.magenta }, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    -- TSTypeBuiltin       = { };    -- For builtin types.
    ["@variable"] = { style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = color.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag               = { };    -- Tags like html tag names.
    -- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
    -- TSText              = { };    -- For strings considered text in a markup language.
    ["@text.reference"] = { fg = color.teal },
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.
    ["@text.diff.add"] = { link = "DiffAdd" },
    ["@text.diff.delete"] = { link = "DiffDelete" },

    -- Lua
    -- luaTSProperty = { fg = color.red }, -- Same as `TSField`.

    -- ts-rainbow
    rainbowcol1 = { fg = color.red },
    rainbowcol2 = { fg = color.yellow },
    rainbowcol3 = { fg = color.green },
    rainbowcol4 = { fg = color.teal },
    rainbowcol5 = { fg = color.blue },
    rainbowcol6 = { fg = color.magenta },
    rainbowcol7 = { fg = color.purple },

    -- LspTrouble
    TroubleText = { fg = color.fg_dark },
    TroubleCount = { fg = color.magenta, bg = color.fg_gutter },
    TroubleNormal = { fg = color.fg_sidebar, bg = color.bg_sidebar },

    -- Illuminate
    illuminatedWord = { bg = color.fg_gutter },
    illuminatedCurWord = { bg = color.fg_gutter },
    IlluminatedWordText = { bg = color.fg_gutter },
    IlluminatedWordRead = { bg = color.fg_gutter },
    IlluminatedWordWrite = { bg = color.fg_gutter },

    -- diff
    diffAdded = { fg = color.git.add },
    diffRemoved = { fg = color.git.delete },
    diffChanged = { fg = color.git.change },
    diffOldFile = { fg = color.yellow },
    diffNewFile = { fg = color.orange },
    diffFile = { fg = color.blue },
    diffLine = { fg = color.comment },
    diffIndexLine = { fg = color.magenta },

    -- Neogit
    NeogitBranch = { fg = color.magenta },
    NeogitRemote = { fg = color.purple },
    NeogitHunkHeader = { bg = color.bg_highlight, fg = color.fg },
    NeogitHunkHeaderHighlight = { bg = color.fg_gutter, fg = color.blue },
    NeogitDiffContextHighlight = { bg = util.darken(color.fg_gutter, 0.5), fg = color.fg_dark },
    NeogitDiffDeleteHighlight = { fg = color.git.delete, bg = color.diff.delete },
    NeogitDiffAddHighlight = { fg = color.git.add, bg = color.diff.add },

    -- Neotest
    NeotestPassed = { fg = color.green },
    NeotestRunning = { fg = color.yellow },
    NeotestFailed = { fg = color.red },
    NeotestSkipped = { fg = color.blue },
    NeotestTest = { fg = color.fg_sidebar },
    NeotestNamespace = { fg = color.green2 },
    NeotestFocused = { fg = color.yellow },
    NeotestFile = { fg = color.teal },
    NeotestDir = { fg = color.blue },
    NeotestBorder = { fg = color.blue },
    NeotestIndent = { fg = color.fg_sidebar },
    NeotestExpandMarker = { fg = color.fg_sidebar },
    NeotestAdapterName = { fg = color.purple, bold = true },
    NeotestWinSelect = { fg = color.blue },
    NeotestMarked = { fg = color.blue },
    NeotestTarget = { fg = color.blue },
    --[[ NeotestUnknown = {}, ]]

    -- GitGutter
    GitGutterAdd = { fg = color.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = color.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = color.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = color.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = color.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = color.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = color.border_highlight, bg = color.bg_float },
    TelescopeNormal = { fg = color.fg, bg = color.bg_float },

    -- NvimTree
    NvimTreeNormal = { fg = color.fg_sidebar, bg = color.bg_sidebar },
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and color.border or color.bg_sidebar,
      bg = color.bg_sidebar,
    },
    NvimTreeNormalNC = { fg = color.fg_sidebar, bg = color.bg_sidebar },
    NvimTreeRootFolder = { fg = color.blue, bold = true },
    NvimTreeGitDirty = { fg = color.git.change },
    NvimTreeGitNew = { fg = color.git.add },
    NvimTreeGitDeleted = { fg = color.git.delete },
    NvimTreeOpenedFile = { bg = color.bg_highlight },
    NvimTreeSpecialFile = { fg = color.purple, underline = true },
    NvimTreeIndentMarker = { fg = color.fg_gutter },
    NvimTreeImageFile = { fg = color.fg_sidebar },
    NvimTreeSymlink = { fg = color.blue },
    NvimTreeFolderIcon = { bg = color.none, fg = color.blue },
    -- NvimTreeFolderName= { fg = color.fg_float },

    NeoTreeNormal = { fg = color.fg_sidebar, bg = color.bg_sidebar },
    NeoTreeNormalNC = { fg = color.fg_sidebar, bg = color.bg_sidebar },

    -- Fern
    FernBranchText = { fg = color.blue },

    -- glyph palette
    GlyphPalette1 = { fg = color.red1 },
    GlyphPalette2 = { fg = color.green },
    GlyphPalette3 = { fg = color.yellow },
    GlyphPalette4 = { fg = color.blue },
    GlyphPalette6 = { fg = color.green1 },
    GlyphPalette7 = { fg = color.fg },
    GlyphPalette9 = { fg = color.red },

    -- Dashboard
    DashboardShortCut = { fg = color.cyan },
    DashboardHeader = { fg = color.blue },
    DashboardCenter = { fg = color.magenta },
    DashboardFooter = { fg = color.yellow, italic = true },

    -- Alpha
    AlphaShortcut = { fg = color.cyan },
    AlphaHeader = { fg = color.blue },
    AlphaHeaderLabel = { fg = color.orange },
    AlphaFooter = { fg = color.yellow, italic = true },
    AlphaButtons = { fg = color.magenta },

    -- WhichKey
    WhichKey = { fg = color.cyan },
    WhichKeyGroup = { fg = color.blue },
    WhichKeyDesc = { fg = color.magenta },
    WhichKeySeperator = { fg = color.comment },
    WhichKeySeparator = { fg = color.comment },
    WhichKeyFloat = { bg = color.bg_sidebar },
    WhichKeyValue = { fg = color.dark5 },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { bg = color.bg_float },
    LspFloatWinBorder = { fg = color.border_highlight },
    LspSagaBorderTitle = { fg = color.cyan },
    LspSagaHoverBorder = { fg = color.blue },
    LspSagaRenameBorder = { fg = color.green },
    LspSagaDefPreviewBorder = { fg = color.green },
    LspSagaCodeActionBorder = { fg = color.blue },
    LspSagaFinderSelection = { fg = color.bg_visual },
    LspSagaCodeActionTitle = { fg = color.blue1 },
    LspSagaCodeActionContent = { fg = color.purple },
    LspSagaSignatureHelpBorder = { fg = color.red },
    ReferencesCount = { fg = color.purple },
    DefinitionCount = { fg = color.purple },
    DefinitionIcon = { fg = color.blue },
    ReferencesIcon = { fg = color.blue },
    TargetWord = { fg = color.cyan },

    -- NeoVim
    healthError = { fg = color.error },
    healthSuccess = { fg = color.green1 },
    healthWarning = { fg = color.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = color.git.change },

    -- Barbar
    BufferCurrent = { bg = color.fg_gutter, fg = color.fg },
    BufferCurrentIndex = { bg = color.fg_gutter, fg = color.info },
    BufferCurrentMod = { bg = color.fg_gutter, fg = color.warning },
    BufferCurrentSign = { bg = color.fg_gutter, fg = color.info },
    BufferCurrentTarget = { bg = color.fg_gutter, fg = color.red },
    BufferVisible = { bg = color.bg_statusline, fg = color.fg },
    BufferVisibleIndex = { bg = color.bg_statusline, fg = color.info },
    BufferVisibleMod = { bg = color.bg_statusline, fg = color.warning },
    BufferVisibleSign = { bg = color.bg_statusline, fg = color.info },
    BufferVisibleTarget = { bg = color.bg_statusline, fg = color.red },
    BufferInactive = { bg = color.bg_statusline, fg = color.dark5 },
    BufferInactiveIndex = { bg = color.bg_statusline, fg = color.dark5 },
    BufferInactiveMod = { bg = color.bg_statusline, fg = util.darken(color.warning, 0.7) },
    BufferInactiveSign = { bg = color.bg_statusline, fg = color.border_highlight },
    BufferInactiveTarget = { bg = color.bg_statusline, fg = color.red },
    BufferTabpages = { bg = color.bg_statusline, fg = color.none },
    BufferTabpage = { bg = color.bg_statusline, fg = color.border_highlight },

    -- Sneak
    Sneak = { fg = color.bg_highlight, bg = color.magenta },
    SneakScope = { bg = color.bg_visual },

    -- Hop
    HopNextKey = { fg = color.magenta2, bold = true },
    HopNextKey1 = { fg = color.blue2, bold = true },
    HopNextKey2 = { fg = util.darken(color.blue2, 0.6) },
    HopUnmatched = { fg = color.dark3 },

    TSNodeKey = { fg = color.magenta2, bold = true },
    TSNodeUnmatched = { fg = color.dark3 },

    LeapMatch = { bg = color.magenta2, fg = color.fg, bold = true },
    LeapLabelPrimary = { fg = color.magenta2, bold = true },
    LeapLabelSecondary = { fg = color.green1, bold = true },
    LeapBackdrop = { fg = color.dark3 },

    LightspeedGreyWash = { fg = color.dark3 },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = color.magenta2, bold = true, underline = true },
    LightspeedLabelDistant = { fg = color.green1, bold = true, underline = true },
    LightspeedLabelDistantOverlapped = { fg = color.green2, underline = true },
    LightspeedLabelOverlapped = { fg = color.magenta2, underline = true },
    LightspeedMaskedChar = { fg = color.orange },
    LightspeedOneCharMatch = { bg = color.magenta2, fg = color.fg, bold = true },
    LightspeedPendingOpArea = { bg = color.magenta2, fg = color.fg },
    LightspeedShortcut = { bg = color.magenta2, fg = color.fg, bold = true, underline = true },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = color.blue2, bold = true },

    -- Cmp
    CmpDocumentation = { fg = color.fg, bg = color.bg_float },
    CmpDocumentationBorder = { fg = color.border_highlight, bg = color.bg_float },

    CmpItemAbbr = { fg = color.fg, bg = color.none },
    CmpItemAbbrDeprecated = { fg = color.fg_gutter, bg = color.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = color.blue1, bg = color.none },
    CmpItemAbbrMatchFuzzy = { fg = color.blue1, bg = color.none },

    CmpItemMenu = { fg = color.comment, bg = color.none },

    CmpItemKindDefault = { fg = color.fg_dark, bg = color.none },

    CmpItemKindKeyword = { fg = color.cyan, bg = color.none },

    CmpItemKindVariable = { fg = color.magenta, bg = color.none },
    CmpItemKindConstant = { fg = color.magenta, bg = color.none },
    CmpItemKindReference = { fg = color.magenta, bg = color.none },
    CmpItemKindValue = { fg = color.magenta, bg = color.none },

    CmpItemKindFunction = { fg = color.blue, bg = color.none },
    CmpItemKindMethod = { fg = color.blue, bg = color.none },
    CmpItemKindConstructor = { fg = color.blue, bg = color.none },

    CmpItemKindClass = { fg = color.orange, bg = color.none },
    CmpItemKindInterface = { fg = color.orange, bg = color.none },
    CmpItemKindStruct = { fg = color.orange, bg = color.none },
    CmpItemKindEvent = { fg = color.orange, bg = color.none },
    CmpItemKindEnum = { fg = color.orange, bg = color.none },
    CmpItemKindUnit = { fg = color.orange, bg = color.none },

    CmpItemKindModule = { fg = color.yellow, bg = color.none },

    CmpItemKindProperty = { fg = color.green1, bg = color.none },
    CmpItemKindField = { fg = color.green1, bg = color.none },
    CmpItemKindTypeParameter = { fg = color.green1, bg = color.none },
    CmpItemKindEnumMember = { fg = color.green1, bg = color.none },
    CmpItemKindOperator = { fg = color.green1, bg = color.none },
    CmpItemKindSnippet = { fg = color.dark5, bg = color.none },

    -- navic
    NavicIconsFile = { fg = color.fg, bg = color.none },
    NavicIconsModule = { fg = color.yellow, bg = color.none },
    NavicIconsNamespace = { fg = color.fg, bg = color.none },
    NavicIconsPackage = { fg = color.fg, bg = color.none },
    NavicIconsClass = { fg = color.orange, bg = color.none },
    NavicIconsMethod = { fg = color.blue, bg = color.none },
    NavicIconsProperty = { fg = color.green1, bg = color.none },
    NavicIconsField = { fg = color.green1, bg = color.none },
    NavicIconsConstructor = { fg = color.orange, bg = color.none },
    NavicIconsEnum = { fg = color.orange, bg = color.none },
    NavicIconsInterface = { fg = color.orange, bg = color.none },
    NavicIconsFunction = { fg = color.blue, bg = color.none },
    NavicIconsVariable = { fg = color.magenta, bg = color.none },
    NavicIconsConstant = { fg = color.magenta, bg = color.none },
    NavicIconsString = { fg = color.green, bg = color.none },
    NavicIconsNumber = { fg = color.orange, bg = color.none },
    NavicIconsBoolean = { fg = color.orange, bg = color.none },
    NavicIconsArray = { fg = color.orange, bg = color.none },
    NavicIconsObject = { fg = color.orange, bg = color.none },
    NavicIconsKey = { fg = color.purple, bg = color.none },
    NavicIconsKeyword = { fg = color.purple, bg = color.none },
    NavicIconsNull = { fg = color.orange, bg = color.none },
    NavicIconsEnumMember = { fg = color.green1, bg = color.none },
    NavicIconsStruct = { fg = color.orange, bg = color.none },
    NavicIconsEvent = { fg = color.orange, bg = color.none },
    NavicIconsOperator = { fg = color.fg, bg = color.none },
    NavicIconsTypeParameter = { fg = color.green1, bg = color.none },
    NavicText = { fg = color.fg, bg = color.none },
    NavicSeparator = { fg = color.fg, bg = color.none },

    IndentBlanklineChar = { fg = color.fg_gutter, nocombine = true },
    IndentBlanklineContextChar = { fg = color.purple, nocombine = true },

    -- Scrollbar
    ScrollbarHandle = { fg = color.none, bg = color.bg_highlight },

    ScrollbarSearchHandle = { fg = color.orange, bg = color.bg_highlight },
    ScrollbarSearch = { fg = color.orange, bg = color.none },

    ScrollbarErrorHandle = { fg = color.error, bg = color.bg_highlight },
    ScrollbarError = { fg = color.error, bg = color.none },

    ScrollbarWarnHandle = { fg = color.warning, bg = color.bg_highlight },
    ScrollbarWarn = { fg = color.warning, bg = color.none },

    ScrollbarInfoHandle = { fg = color.info, bg = color.bg_highlight },
    ScrollbarInfo = { fg = color.info, bg = color.none },

    ScrollbarHintHandle = { fg = color.hint, bg = color.bg_highlight },
    ScrollbarHint = { fg = color.hint, bg = color.none },

    ScrollbarMiscHandle = { fg = color.purple, bg = color.bg_highlight },
    ScrollbarMisc = { fg = color.purple, bg = color.none },

    -- Yanky
    YankyPut = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },

    -- Notify
    --- Border
    NotifyERRORBorder = { fg = util.darken(color.error, 0.3), bg = options.transparent and color.none or color.bg },
    NotifyWARNBorder = { fg = util.darken(color.warning, 0.3), bg = options.transparent and color.none or color.bg },
    NotifyINFOBorder = { fg = util.darken(color.info, 0.3), bg = options.transparent and color.none or color.bg },
    NotifyDEBUGBorder = { fg = util.darken(color.comment, 0.3), bg = options.transparent and color.none or color.bg },
    NotifyTRACEBorder = { fg = util.darken(color.purple, 0.3), bg = options.transparent and color.none or color.bg },
    --- Icons
    NotifyERRORIcon = { fg = color.error },
    NotifyWARNIcon = { fg = color.warning },
    NotifyINFOIcon = { fg = color.info },
    NotifyDEBUGIcon = { fg = color.comment },
    NotifyTRACEIcon = { fg = color.purple },
    --- Title
    NotifyERRORTitle = { fg = color.error },
    NotifyWARNTitle = { fg = color.warning },
    NotifyINFOTitle = { fg = color.info },
    NotifyDEBUGTitle = { fg = color.comment },
    NotifyTRACETitle = { fg = color.purple },
    --- Body
    NotifyERRORBody = { fg = color.fg, bg = options.transparent and color.none or color.bg },
    NotifyWARNBody = { fg = color.fg, bg = options.transparent and color.none or color.bg },
    NotifyINFOBody = { fg = color.fg, bg = options.transparent and color.none or color.bg },
    NotifyDEBUGBody = { fg = color.fg, bg = options.transparent and color.none or color.bg },
    NotifyTRACEBody = { fg = color.fg, bg = options.transparent and color.none or color.bg },

    -- Mini
    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = color.fg_gutter },
    MiniCursorwordCurrent = { bg = color.fg_gutter },

    MiniIndentscopeSymbol = { fg = color.blue1 },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = color.magenta2, fg = "#ffffff" },

    MiniJump2dSpot = { fg = color.magenta2, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = color.yellow, italic = true },
    MiniStarterHeader = { fg = color.blue },
    MiniStarterInactive = { fg = color.comment, style = options.styles.comments },
    MiniStarterItem = { fg = color.fg, bg = options.transparent and color.none or color.bg },
    MiniStarterItemBullet = { fg = color.border_highlight },
    MiniStarterItemPrefix = { fg = color.warning },
    MiniStarterSection = { fg = color.blue1 },
    MiniStarterQuery = { fg = color.info },

    MiniStatuslineDevinfo = { fg = color.fg_dark, bg = color.bg_highlight },
    MiniStatuslineFileinfo = { fg = color.fg_dark, bg = color.bg_highlight },
    MiniStatuslineFilename = { fg = color.fg_dark, bg = color.fg_gutter },
    MiniStatuslineInactive = { fg = color.blue, bg = color.bg_statusline },
    MiniStatuslineModeCommand = { fg = color.black, bg = color.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = color.black, bg = color.green, bold = true },
    MiniStatuslineModeNormal = { fg = color.black, bg = color.blue, bold = true },
    MiniStatuslineModeOther = { fg = color.black, bg = color.teal, bold = true },
    MiniStatuslineModeReplace = { fg = color.black, bg = color.red, bold = true },
    MiniStatuslineModeVisual = { fg = color.black, bg = color.magenta, bold = true },

    MiniSurround = { bg = color.orange, fg = color.black },

    MiniTablineCurrent = { fg = color.fg, bg = color.fg_gutter },
    MiniTablineFill = { bg = color.black },
    MiniTablineHidden = { fg = color.dark5, bg = color.bg_statusline },
    MiniTablineModifiedCurrent = { fg = color.warning, bg = color.fg_gutter },
    MiniTablineModifiedHidden = { bg = color.bg_statusline, fg = util.darken(color.warning, 0.7) },
    MiniTablineModifiedVisible = { fg = color.warning, bg = color.bg_statusline },
    MiniTablineTabpagesection = { bg = color.bg_statusline, fg = color.none },
    MiniTablineVisible = { fg = color.fg, bg = color.bg_statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = color.red, bold = true },
    MiniTestPass = { fg = color.green, bold = true },

    MiniTrailspace = { bg = color.red },

    -- Noice

    NoiceCompletionItemKindDefault = { fg = color.fg_dark, bg = color.none },

    NoiceCompletionItemKindKeyword = { fg = color.cyan, bg = color.none },

    NoiceCompletionItemKindVariable = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindConstant = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindReference = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindValue = { fg = color.magenta, bg = color.none },

    NoiceCompletionItemKindFunction = { fg = color.blue, bg = color.none },
    NoiceCompletionItemKindMethod = { fg = color.blue, bg = color.none },
    NoiceCompletionItemKindConstructor = { fg = color.blue, bg = color.none },

    NoiceCompletionItemKindClass = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindInterface = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindStruct = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindEvent = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindEnum = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindUnit = { fg = color.orange, bg = color.none },

    NoiceCompletionItemKindModule = { fg = color.yellow, bg = color.none },

    NoiceCompletionItemKindProperty = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindField = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindTypeParameter = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindEnumMember = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindOperator = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindSnippet = { fg = color.dark5, bg = color.none },

    TreesitterContext = { bg = util.darken(color.fg_gutter, 0.8) },
    Hlargs = { fg = color.yellow },
    -- TreesitterContext = { bg = util.darken(color.bg_visual, 0.4) },
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = color.none, fg = color.bg, sp = color.border }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end

    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

  if config.is_day() then
    util.invert_colors(theme.colors)
    util.invert_highlights(theme.highlights)
  end

  return theme
end

return M
