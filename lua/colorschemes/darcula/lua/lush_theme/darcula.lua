---@diagnostic disable: undefined-global, unused-local

-- stylua: ignore start

-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8

local lush = require 'lush'
local hsl = lush.hsl

--------------------------------------------------

-- GUI options
local bf, it, un = 'bold', 'italic', 'underline'

-- Base colors
local c0 = hsl(240, 1, 15)
local c1 = c0.lighten(5)
local c2 = c1.lighten(2)
local c3 = c2.lighten(20).sa(10)
local c4 = c3.lighten(10)
local c5 = c4.lighten(20)
local c6 = c5.lighten(70)
local c7 = c6.lighten(80)

-- Set base colors
local bg      = c0    -- base background
local overbg  = c1    -- other backgrounds
local subtle  = c2    -- out-of-buffer elements

local fg                  = hsl(210, 7, 82)
local comment             = hsl(0, 0, 54)    -- comments
local folder              = hsl(223, 8, 82)
local treebg              = hsl(220, 3, 18)
local mid                 = c2   -- either foreground or background
local fadefg              = hsl("#606366")    -- non-important text elements
local line_number_current = hsl("#A4A3A3")
local pop                 = c7
local selection           = hsl("#214283")

-- Color palette
local red         = hsl(1, 77, 59)
local salmon      = hsl(10,  90, 70)
local orange      = hsl(20, 50, 61)
local yellow      = hsl(37, 100, 71)

local green       = hsl(83, 27, 53)
local teal        = hsl(150,  40, 50)
local cyan        = hsl(180, 58, 38)
local celadon     = hsl(115, 42, 71)

local blue        = hsl(215, 80, 63).li(10)
local purple      = hsl(279, 30, 62)
local magenta     = hsl(310,  53, 76)
local sky_magenta  = hsl(310, 40, 64)

local black_olive = hsl(110, 10, 23)

return lush(function(injected_functions)
local sym = injected_functions.sym
return {
Normal       { fg=fg, bg=bg };
NormalFloat  { fg=fg,      bg=overbg.li(3) };
NormalNC     { fg=fg,      bg=bg.da(10) }; -- normal text in non-current windows

Comment      { fg=comment,  gui=it };
Whitespace   { fg=mid.li(20) };                  -- 'listchars'
Conceal      { fg=hsl(0, 0, 29) };
NonText      { fg=treebg.li(15) };              -- characters that don't exist in the text
SpecialKey   { Whitespace };              -- Unprintable characters: text displayed differently from what it really is


Cursor       { fg=bg,      bg=fg };
TermCursor   { fg=bg,      bg=fg };
ColorColumn  { bg=overbg };
CursorColumn { bg=subtle };
CursorLine   { CursorColumn };
MatchParen   { fg=pop,     bg=mid };

LineNr       { fg=fadefg };
CursorLineNr { fg=line_number_current };
SignColumn   { LineNr };
VertSplit    { fg=overbg,  bg=bg };    -- column separating vertically split windows
Folded       { fg=comment, bg=overbg };
FoldColumn   { LineNr };

Pmenu        { bg=overbg };                -- Popup menu normal item
PmenuSel     { bg=subtle.li(3) };                   -- selected item
PmenuSbar    { bg=overbg.da(7) };                    -- scrollbar
PmenuThumb   { PmenuSel };                 -- Thumb of the scrollbar
WildMenu     { Pmenu };                    -- current match in 'wildmenu' completion
QuickFixLine { fg=pop };                   -- Current |quickfix| item in the quickfix window

StatusLine   { bg=subtle };
StatusLineNC { fg=fadefg,   bg=overbg };

TabLine      { fg=fg.da(30), bg=mid };                   -- not active tab page label
TabLineFill  { bg=overbg };                -- where there are no labels
TabLineSel   { bg=mid.li(7) };                 -- active tab page label

WinSeparator { fg=c0, bg=c0 };
WinBar       { fg=fg, bg=bg };
WinBarNC     { fg=fg, bg=bg.da(10) };
Search       { fg=bg, bg=yellow };         -- Last search pattern highlighting (see 'hlsearch')
IncSearch    { Search };                   -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Substitute   { Search };                   -- |:substitute| replacement text highlighting

Visual       { bg=selection };             -- Visual mode selection
VisualNOS    { bg=subtle };                -- Visual mode selection when Vim is "Not Owning the Selection".

ModeMsg      { fg=fadefg };                 -- 'showmode' message (e.g. "-- INSERT -- ")
MsgArea      { Normal };                   -- Area for messages and cmdline
MsgSeparator { fg=orange };                -- Separator for scrolled messages `msgsep` flag of 'display'
MoreMsg      { fg=green };                 -- |more-prompt|
Question     { fg=green };                 -- |hit-enter| prompt and yes/no questions
ErrorMsg     { fg=red };                   -- error messages on the command line
WarningMsg   { fg=yellow };                   -- warning messages

Directory    { fg=folder.darken(5) };                  -- directory names (and other special names in listings)
Title        { fg=blue };                  -- titles for output from ":set all" ":autocmd" etc.

Added        { fg=green.li(50).saturate(100) };
Changed      { fg=yellow.li(10).saturate(100) };
Removed      { fg=red.li(20).saturate(100)};
DiffAdd      { fg=green.da(20) };
DiffDelete   { fg=red };
DiffChange   { fg=yellow.da(20) };
DiffText     { DiffChange, gui=un };
DiffAdded    { DiffAdd };
DiffRemoved  { DiffDelete };

SpellBad     { sp=orange,  gui="underline" };
SpellCap     { fg=magenta, gui=un };
SpellLocal   { fg=orange,  gui=un };
SpellRare    { fg=yellow,  gui=un };

DiagnosticHint           { fg=cyan.li(50).sa(50) };
DiagnosticError          { fg=red };
DiagnosticWarn           { fg=yellow };
DiagnosticUnderlineHint  { gui="undercurl", sp=cyan.li(50).sa(50) };
DiagnosticUnderlineError { gui="undercurl", sp=red };
DiagnosticUnderlineWarn { gui="undercurl", sp=yellow };


---- Language Server Protocol highlight groups ---------------------------------

LspReferenceText                  { bg=mid };    -- highlighting "text" references
LspReferenceRead                  { bg=mid };    -- highlighting "read" references
LspReferenceWrite                 { bg=mid };    -- highlighting "write" references

-- base highlight groups. Other LspDiagnostic highlights link to these by default (except Underline)
LspDiagnosticsDefaultError           { fg=red };
LspDiagnosticsDefaultWarning         { fg=yellow };
LspDiagnosticsDefaultInformation     { fg=fg };
LspDiagnosticsDefaultHint            { fg=teal };

--LspDiagnosticsVirtualTextError       { };    -- "Error" diagnostic virtual text
--LspDiagnosticsVirtualTextWarning     { };    -- "Warning" diagnostic virtual text
--LspDiagnosticsVirtualTextInformation { };    -- "Information" diagnostic virtual text
--LspDiagnosticsVirtualTextHint        { };    -- "Hint" diagnostic virtual text
LspDiagnosticsUnderlineError         { gui=un };    -- underline "Error" diagnostics
LspDiagnosticsUnderlineWarning       { gui=un };    -- underline "Warning" diagnostics
LspDiagnosticsUnderlineInformation   { gui=un };    -- underline "Information" diagnostics
LspDiagnosticsUnderlineHint          { gui=un };    -- underline "Hint" diagnostics
--LspDiagnosticsFloatingError          { };    -- color "Error" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingWarning        { };    -- color "Warning" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingInformation    { };    -- color "Information" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingHint           { };    -- color "Hint" diagnostic messages in diagnostics float
--LspDiagnosticsSignError              { };    -- "Error" signs in sign column
--LspDiagnosticsSignWarning            { };    -- "Warning" signs in sign column
--LspDiagnosticsSignInformation        { };    -- "Information" signs in sign column
--LspDiagnosticsSignHint               { };    -- "Hint" signs in sign column



---- Standard highlight groups -------------------------------------------------
-- See :help group-name

Constant       { fg=fg };
Number         { fg=blue };
Float          { Number };
Boolean        { Constant };
Character      { fg=salmon };
String         { fg=green };

Identifier     { fg=fg };
Function       { fg=yellow };

Statement      { fg=orange }; -- (preferred) any statement
Conditional    { Statement };
Repeat         { Statement };
Label          { Statement };       -- case, default, etc.
Operator       { fg=fg };
Keyword        { Statement };    -- any other keyword
Exception      { fg=red };

PreProc        { fg=orange };    --  generic Preprocessor
Include        { PreProc };    -- preprocessor #include
Define         { PreProc };    -- preprocessor #define
Macro          { PreProc };    -- same as Define
PreCondit      { PreProc };    -- preprocessor #if, #else, #endif, etc.

Type           { fg=fg };
StorageClass   { fg=magenta };    -- static, register, volatile, etc.
Structure      { fg=magenta };    -- struct, union, enum, etc.
Typedef        { Type };

Special        { fg=orange };  -- (preferred) any special symbol
SpecialChar    { Special };    -- special character in a constant
Tag            { fg=yellow };  -- you can use CTRL-] on this
Delimiter      { fg=fg };      -- character that needs attention
SpecialComment { Special };    -- special things inside a comment
Debug          { Special };    -- debugging statements

Underlined { gui = un };
Bold       { gui = bf };
Italic     { gui = it };
Ignore     { fg=fadefg };          --  left blank, hidden  |hl-Ignore|
Error      { fg=red };             --  any erroneous construct
Todo       { gui=bf };             --  anything that needs extra attention



---- TREESITTER ----------------------------------------------------------------

sym"@constant"                 { Constant };
sym"@constant.builtin"         { Constant,   gui=it };      -- constant that are built in the language: `nil` in Lua.
sym"@constant.macro"           { Constant,   gui=bf };    -- constants that are defined by macros: `NULL` in C.
sym"@number"                   { Number };
sym"@float"                    { Float };
sym"@boolean"                  { Boolean };
sym"@character"                { Character };
sym"@string"                   { String };
sym"@string.regex"             { Character };
sym"@string.escape"            { Character };             -- escape characters within a string
sym"@symbol"                   { fg=green, gui=it };      -- For identifiers referring to symbols or atoms.

sym"@field"                    { fg=purple };
sym"@property"                 { fg=purple };
sym"@property.yaml"            { fg=yellow };
sym"@property.toml"            { Keyword };
sym"@parameter"                { fg=fg };
sym"@parameter.reference"      { fg=fg };
sym"@variable"                 { fg=fg };                     -- Any variable name that does not have another highlight
sym"@variable.member"          { fg=purple };                 -- Any variable name that does not have another highlight
sym"@variable.parameter"       { fg=celadon };
sym"@variable.builtin"         { Constant, gui=it };          -- Variable names that are defined by the languages like `this` or `self`.

sym"@function"                 { Function };
sym"@function.builtin"         { Function };
sym"@function.macro"           { Function };              -- macro defined functions: each `macro_rules` in Rust
sym"@method"                   { Function };
sym"@constructor"              { fg=fg };                 -- For constructor: `{}` in Lua and Java constructors.
sym"@keyword.function"         { Keyword };

sym"@keyword"                  { Keyword };
sym"@conditional"              { Conditional };
sym"@repeat"                   { Repeat };
sym"@label"                    { Label };
sym"@operator"                 { Operator };
sym"@exception"                { Exception };

sym"@namespace"                { PreProc };               -- identifiers referring to modules and namespaces.
sym"@annotation"               { PreProc };               -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
sym"@attribute"                { PreProc };               -- Unstable
sym"@include"                  { PreProc };               -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

sym"@type"                     { Type };
sym"@type.sql"                 { Type };
sym"@type.builtin"             { Type,     gui=it };

sym"@punctuation.delimiter"    { Delimiter };             -- delimiters ie: `.`
sym"@punctuation.bracket"      { fg=fg };                 -- brackets and parents.
sym"@punctuation.special"      { Delimiter };             -- special punctuation that does not fall in the categories before.

sym"@comment"                  { Comment };
sym"@tag"                      { Tag };                   -- Tags like html tag names.
sym"@tag.delimiter"            { Special };               -- Tag delimiter like < > /
sym"@text"                     { fg=fg };
sym"@text.emphasis"            { fg=fg,     gui=it };
sym"@text.underline"           { fg=fg,     gui=un };
sym"@text.strike"              { Comment,   gui=un };
sym"@text.strong"              { fg=fg,     gui=bf };
sym"@text.title"               { fg=orange };             -- Text that is part of a title
sym"@text.literal"             { String };                -- Literal text
sym"@text.uri"                 { fg=green, gui=it };      -- Any URI like a link or email

sym"@error"                    { fg=red };                -- syntax/parser errors.


-- Other stuff
HelpHyperTextJump {fg=yellow};
markdownLinkText {fg=fg};

-- NvimTree
NvimTreeNormal           { bg=treebg, fg=fg };
NvimTreeIndentMarker     { fg=hsl(204, 3, 32) };
NvimTreeRootFolder       { fg=folder };
NvimTreeFolderIcon       { fg=folder };
NvimTreeGitNewIcon       { Added };
NvimTreeGitRenamedIcon   { Changed };
NvimTreeGitDirtyIcon     { Changed };

-- MiniCursorWord
MiniCursorWord        { bg=black_olive };
MiniCursorWordCurrent { bg=black_olive };

-- Neotest
NeotestAdapterName    { fg=fg.da(47).de(125) };
NeotestDir            { Directory };
NeotestFile           { fg=purple};

-- FzfLua
FzfLuaHeaderText       { fg=yellow };
FzfLuaTitle            { fg=c7, bg=cyan.li(10) };

-- Lazy
LazyNormal             { Normal };
LazyReasonEvent        { Changed };
LazyReasonKeys         { fg=blue.li(50) };
LazyReasonPlugin       { fg=sky_magenta.li(30).sa(40) };
LazyReasonStart        { fg=purple.li(30).sa(50) };
LazySpecial            { Comment };
LazyLocal              { fg=orange };

-- Ufo
UfoFoldedBg  { bg=subtle.li(5) };

}end)
-- stylua: ignore end
