---@diagnostic disable: undefined-global, unused-local

local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  -- stylua: ignore
  return {
    TermCursor                              { bg="#ced1d4", fg="#262627", }, -- TermCursor     xxx guifg=#262627 guibg=#ced1d4
    GitSignsAddInline                       { TermCursor }, -- GitSignsAddInline xxx links to TermCursor
    GitSignsDeleteInline                    { TermCursor }, -- GitSignsDeleteInline xxx links to TermCursor
    GitSignsChangeInline                    { TermCursor }, -- GitSignsChangeInline xxx links to TermCursor
    NonText                                 { fg="#2f3032", }, -- NonText        xxx guifg=#2f3032
    EndOfBuffer                             { NonText }, -- EndOfBuffer    xxx links to NonText
    LspCodeLens                             { NonText }, -- LspCodeLens    xxx links to NonText
    LspInlayHint                            { NonText }, -- LspInlayHint   xxx links to NonText
    GitSignsCurrentLineBlame                { NonText }, -- GitSignsCurrentLineBlame xxx links to NonText
    BlinkCmpLabelDeprecated                 { NonText }, -- BlinkCmpLabelDeprecated xxx links to NonText
    BlinkCmpLabelDetail                     { NonText }, -- BlinkCmpLabelDetail xxx links to NonText
    BlinkCmpLabelDescription                { NonText }, -- BlinkCmpLabelDescription xxx links to NonText
    BlinkCmpSource                          { NonText }, -- BlinkCmpSource xxx links to NonText
    BlinkCmpGhostText                       { NonText }, -- BlinkCmpGhostText xxx links to NonText
    Directory                               { fg="#68a0ee", }, -- Directory      xxx guifg=#68a0ee
    NvimTreeFolderName                      { Directory }, -- NvimTreeFolderName xxx links to Directory
    NvimTreeEmptyFolderName                 { Directory }, -- NvimTreeEmptyFolderName xxx links to Directory
    NvimTreeOpenedFolderName                { Directory }, -- NvimTreeOpenedFolderName xxx links to Directory
    NvimTreeSymlinkFolderName               { Directory }, -- NvimTreeSymlinkFolderName xxx links to Directory
    ErrorMsg                                { fg="#e74946", }, -- ErrorMsg       xxx guifg=#e74946
    NvimInvalidSpacing                      { ErrorMsg }, -- NvimInvalidSpacing xxx links to ErrorMsg
    Search                                  { bg="#ffc66b", fg="#262627", }, -- Search         xxx guifg=#262627 guibg=#ffc66b
    IncSearch                               { Search }, -- IncSearch      xxx links to Search
    Substitute                              { Search }, -- Substitute     xxx links to Search
    CurSearch                               { bg="nvimlightyellow", fg="nvimdarkgrey1", }, -- CurSearch      xxx ctermfg=0 ctermbg=11 guifg=NvimDarkGrey1 guibg=NvimLightYellow
    MoreMsg                                 { fg="#8fa867", }, -- MoreMsg        xxx guifg=#8fa867
    ModeMsg                                 { fg="#6b737b", }, -- ModeMsg        xxx guifg=#6b737b
    NvimTreeLiveFilterValue                 { ModeMsg }, -- NvimTreeLiveFilterValue xxx links to ModeMsg
    LineNr                                  { fg="#6b737b", }, -- LineNr         xxx guifg=#6b737b
    LineNrAbove                             { LineNr }, -- LineNrAbove    xxx links to LineNr
    LineNrBelow                             { LineNr }, -- LineNrBelow    xxx links to LineNr
    FoldColumn                              { LineNr }, -- FoldColumn     xxx links to LineNr
    SignColumn                              { LineNr }, -- SignColumn     xxx links to LineNr
    NvimTreeLineNr                          { LineNr }, -- NvimTreeLineNr xxx links to LineNr
    CursorLineNr                            { fg="#cd7832", }, -- CursorLineNr   xxx guifg=#cd7832
    NvimTreeCursorLineNr                    { CursorLineNr }, -- NvimTreeCursorLineNr xxx links to CursorLineNr
    Question                                { fg="#8fa867", }, -- Question       xxx guifg=#8fa867
    NvimTreeExecFile                        { Question }, -- NvimTreeExecFile xxx links to Question
    NvimTreeImageFile                       { Question }, -- NvimTreeImageFile xxx links to Question
    StatusLine                              { bg="#353536", }, -- StatusLine     xxx guibg=#353536
    StatusLineTerm                          { StatusLine }, -- StatusLineTerm xxx links to StatusLine
    NvimTreeStatusLine                      { StatusLine }, -- NvimTreeStatusLine xxx links to StatusLine
    StatusLineNC                            { bg="#303031", fg="#6b737b", }, -- StatusLineNC   xxx guifg=#6b737b guibg=#303031
    StatusLineTermNC                        { StatusLineNC }, -- StatusLineTermNC xxx links to StatusLineNC
    NvimTreeStatusLineNC                    { StatusLineNC }, -- NvimTreeStatusLineNC xxx links to StatusLineNC
    VertSplit                               { bg="#262627", fg="#303031", }, -- VertSplit      xxx guifg=#303031 guibg=#262627
    Title                                   { fg="#68a0ee", }, -- Title          xxx guifg=#68a0ee
    FloatTitle                              { Title }, -- FloatTitle     xxx links to Title
    sym"@markup.heading"                    { Title }, -- @markup.heading xxx links to Title
    NvimTreeSpecialFile                     { Title }, -- NvimTreeSpecialFile xxx links to Title
    Visual                                  { bg="#353536", }, -- Visual         xxx guibg=#353536
    LspSignatureActiveParameter             { Visual }, -- LspSignatureActiveParameter xxx links to Visual
    SnippetTabstop                          { Visual }, -- SnippetTabstop xxx links to Visual
    BlinkCmpDocCursorLine                   { Visual }, -- BlinkCmpDocCursorLine xxx links to Visual
    WarningMsg                              { fg="#e74946", }, -- WarningMsg     xxx guifg=#e74946
    Folded                                  { bg="#303031", fg="#8a8a8a", }, -- Folded         xxx guifg=#8a8a8a guibg=#303031
    DiffAdd                                 { fg="#72884e", }, -- DiffAdd        xxx guifg=#72884e
    DiffAdded                               { DiffAdd }, -- DiffAdded      xxx links to DiffAdd
    GitSignsAddLn                           { DiffAdd }, -- GitSignsAddLn  xxx links to DiffAdd
    GitSignsAddPreview                      { DiffAdd }, -- GitSignsAddPreview xxx links to DiffAdd
    DiffChange                              { fg="#ffab24", }, -- DiffChange     xxx guifg=#ffab24
    GitSignsChangeLn                        { DiffChange }, -- GitSignsChangeLn xxx links to DiffChange
    DiffDelete                              { fg="#e74946", }, -- DiffDelete     xxx guifg=#e74946
    DiffRemoved                             { DiffDelete }, -- DiffRemoved    xxx links to DiffDelete
    GitSignsDeletePreview                   { DiffDelete }, -- GitSignsDeletePreview xxx links to DiffDelete
    GitSignsDeleteVirtLn                    { DiffDelete }, -- GitSignsDeleteVirtLn xxx links to DiffDelete
    DiffText                                { gui="underline", fg="#ffab24", }, -- DiffText       xxx cterm=underline gui=underline guifg=#ffab24
    Conceal                                 { fg="#404040", }, -- Conceal        xxx guifg=#404040
    NvimTreeHiddenIcon                      { Conceal }, -- NvimTreeHiddenIcon xxx links to Conceal
    NvimTreeHiddenDisplay                   { Conceal }, -- NvimTreeHiddenDisplay xxx links to Conceal
    SpellBad                                { gui="underline", fg="#e74946", }, -- SpellBad       xxx cterm=underline gui=underline guifg=#e74946
    NvimTreeCutHL                           { SpellBad }, -- NvimTreeCutHL  xxx links to SpellBad
    SpellCap                                { gui="underline", fg="#d194c7", }, -- SpellCap       xxx cterm=underline gui=underline guifg=#d194c7
    SpellRare                               { gui="underline", fg="#ffc66b", }, -- SpellRare      xxx cterm=underline gui=underline guifg=#ffc66b
    NvimTreeCopiedHL                        { SpellRare }, -- NvimTreeCopiedHL xxx links to SpellRare
    SpellLocal                              { gui="underline", fg="#cd7832", }, -- SpellLocal     xxx cterm=underline gui=underline guifg=#cd7832
    NvimTreeBookmarkHL                      { SpellLocal }, -- NvimTreeBookmarkHL xxx links to SpellLocal
    Pmenu                                   { bg="#303031", }, -- Pmenu          xxx guibg=#303031
    WildMenu                                { Pmenu }, -- WildMenu       xxx links to Pmenu
    PmenuKind                               { Pmenu }, -- PmenuKind      xxx links to Pmenu
    PmenuExtra                              { Pmenu }, -- PmenuExtra     xxx links to Pmenu
    PmenuSbar                               { Pmenu }, -- PmenuSbar      xxx links to Pmenu
    BlinkCmpMenu                            { Pmenu }, -- BlinkCmpMenu   xxx links to Pmenu
    BlinkCmpMenuBorder                      { Pmenu }, -- BlinkCmpMenuBorder xxx links to Pmenu
    PmenuSel                                { bg="#49494b", }, -- PmenuSel       xxx guibg=#49494b
    PmenuKindSel                            { PmenuSel }, -- PmenuKindSel   xxx links to PmenuSel
    PmenuExtraSel                           { PmenuSel }, -- PmenuExtraSel  xxx links to PmenuSel
    PmenuThumb                              { PmenuSel }, -- PmenuThumb     xxx links to PmenuSel
    BlinkCmpMenuSelection                   { PmenuSel }, -- BlinkCmpMenuSelection xxx links to PmenuSel
    PmenuMatch                              { gui="bold", }, -- PmenuMatch     xxx cterm=bold gui=bold
    PmenuMatchSel                           { gui="bold", }, -- PmenuMatchSel  xxx cterm=bold gui=bold
    TabLine                                 { bg="#49494b", }, -- TabLine        xxx guibg=#49494b
    TabLineSel                              { bg="#6b737b", }, -- TabLineSel     xxx guibg=#6b737b
    TabLineFill                             { bg="#303031", }, -- TabLineFill    xxx guibg=#303031
    CursorColumn                            { bg="#353536", }, -- CursorColumn   xxx guibg=#353536
    CursorLine                              { CursorColumn }, -- CursorLine     xxx links to CursorColumn
    NvimTreeCursorColumn                    { CursorColumn }, -- NvimTreeCursorColumn xxx links to CursorColumn
    ColorColumn                             { bg="#303031", }, -- ColorColumn    xxx guibg=#303031
    QuickFixLine                            { fg="#f7f7f8", }, -- QuickFixLine   xxx guifg=#f7f7f8
    Whitespace                              { fg="#49494b", }, -- Whitespace     xxx guifg=#49494b
    SpecialKey                              { Whitespace }, -- SpecialKey     xxx links to Whitespace
    NormalNC                                { bg="#232324", fg="#ced1d4", }, -- NormalNC       xxx guifg=#ced1d4 guibg=#232324
    MsgSeparator                            { fg="#cd7832", }, -- MsgSeparator   xxx guifg=#cd7832
    NormalFloat                             { bg="#303031", fg="#ced1d4", }, -- NormalFloat    xxx guifg=#ced1d4 guibg=#303031
    FloatBorder                             { NormalFloat }, -- FloatBorder    xxx links to NormalFloat
    WhichKeyNormal                          { NormalFloat }, -- WhichKeyNormal xxx links to NormalFloat
    NvimTreeNormalFloat                     { NormalFloat }, -- NvimTreeNormalFloat xxx links to NormalFloat
    BlinkCmpDoc                             { NormalFloat }, -- BlinkCmpDoc    xxx links to NormalFloat
    BlinkCmpDocBorder                       { NormalFloat }, -- BlinkCmpDocBorder xxx links to NormalFloat
    BlinkCmpDocSeparator                    { NormalFloat }, -- BlinkCmpDocSeparator xxx links to NormalFloat
    BlinkCmpSignatureHelp                   { NormalFloat }, -- BlinkCmpSignatureHelp xxx links to NormalFloat
    BlinkCmpSignatureHelpBorder             { NormalFloat }, -- BlinkCmpSignatureHelpBorder xxx links to NormalFloat
    WinBar                                  { gui="bold", bg="nvimdarkgrey1", fg="nvimlightgrey4", }, -- WinBar         xxx cterm=bold gui=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
    WinBarNC                                { bg="nvimdarkgrey1", fg="nvimlightgrey4", }, -- WinBarNC       xxx cterm=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
    Cursor                                  { bg="#ced1d4", fg="#262627", }, -- Cursor         xxx guifg=#262627 guibg=#ced1d4
    CursorIM                                { Cursor }, -- CursorIM       xxx links to Cursor
    RedrawDebugNormal                       { gui="reverse", }, -- RedrawDebugNormal xxx cterm=reverse gui=reverse
    Underlined                              { gui="underline", }, -- Underlined     xxx cterm=underline gui=underline
    sym"@string.special.url"                { Underlined }, -- @string.special.url xxx links to Underlined
    sym"@markup.link"                       { Underlined }, -- @markup.link   xxx links to Underlined
    NvimTreeSymlink                         { Underlined }, -- NvimTreeSymlink xxx links to Underlined
    lCursor                                 { bg="fg", fg="bg", }, -- lCursor        xxx guifg=bg guibg=fg
    VisualNOS                               { bg="#353536", }, -- VisualNOS      xxx guibg=#353536
    Normal                                  { bg="#262627", fg="#ced1d4", }, -- Normal         xxx guifg=#ced1d4 guibg=#262627
    WinSeparator                            { Normal }, -- WinSeparator   xxx links to Normal
    MsgArea                                 { Normal }, -- MsgArea        xxx links to Normal
    NvimSpacing                             { Normal }, -- NvimSpacing    xxx links to Normal
    WhichKeyIconGrey                        { Normal }, -- WhichKeyIconGrey xxx links to Normal
    NvimTreePopup                           { Normal }, -- NvimTreePopup  xxx links to Normal
    Character                               { fg="#cd7832", }, -- Character      xxx guifg=#cd7832
    sym"@string.escape"                     { Character }, -- @string.escape xxx links to Character
    sym"@character"                         { Character }, -- @character     xxx links to Character
    sym"@string.regex"                      { Character }, -- @string.regex  xxx links to Character
    goCharacter                             { Character }, -- goCharacter    xxx links to Character
    Constant                                { fg="#cd7832", }, -- Constant       xxx guifg=#cd7832
    Boolean                                 { Constant }, -- Boolean        xxx links to Constant
    sym"@constant"                          { Constant }, -- @constant      xxx links to Constant
    WhichKeyIconPurple                      { Constant }, -- WhichKeyIconPurple xxx links to Constant
    NvimTreeGitStagedIcon                   { Constant }, -- NvimTreeGitStagedIcon xxx links to Constant
    NvimTreeGitMergeIcon                    { Constant }, -- NvimTreeGitMergeIcon xxx links to Constant
    luaConstant                             { Constant }, -- luaConstant    xxx links to Constant
    goPredefinedIdentifiers                 { Constant }, -- goPredefinedIdentifiers xxx links to Constant
    Number                                  { fg="#68a0ee", }, -- Number         xxx guifg=#68a0ee
    Float                                   { Number }, -- Float          xxx links to Number
    sym"@number"                            { Number }, -- @number        xxx links to Number
    NvimNumber                              { Number }, -- NvimNumber     xxx links to Number
    luaNumber                               { Number }, -- luaNumber      xxx links to Number
    Integer                                 { Number }, -- Integer        xxx links to Number
    goImaginaryDecimal                      { Number }, -- goImaginaryDecimal xxx links to Number
    goImaginaryHexadecimal                  { Number }, -- goImaginaryHexadecimal xxx links to Number
    goImaginaryOctal                        { Number }, -- goImaginaryOctal xxx links to Number
    goImaginaryBinary                       { Number }, -- goImaginaryBinary xxx links to Number
    Statement                               { fg="#cd7832", }, -- Statement      xxx guifg=#cd7832
    Conditional                             { Statement }, -- Conditional    xxx links to Statement
    Repeat                                  { Statement }, -- Repeat         xxx links to Statement
    Label                                   { Statement }, -- Label          xxx links to Statement
    Keyword                                 { Statement }, -- Keyword        xxx links to Statement
    NvimTreeGitDirtyIcon                    { Statement }, -- NvimTreeGitDirtyIcon xxx links to Statement
    NvimTreeGitDeletedIcon                  { Statement }, -- NvimTreeGitDeletedIcon xxx links to Statement
    luaStatement                            { Statement }, -- luaStatement   xxx links to Statement
    goPackage                               { Statement }, -- goPackage      xxx links to Statement
    goImport                                { Statement }, -- goImport       xxx links to Statement
    goStatement                             { Statement }, -- goStatement    xxx links to Statement
    Exception                               { fg="#e74946", }, -- Exception      xxx guifg=#e74946
    sym"@exception"                         { Exception }, -- @exception     xxx links to Exception
    PreProc                                 { fg="#cd7832", }, -- PreProc        xxx guifg=#cd7832
    Include                                 { PreProc }, -- Include        xxx links to PreProc
    Define                                  { PreProc }, -- Define         xxx links to PreProc
    Macro                                   { PreProc }, -- Macro          xxx links to PreProc
    PreCondit                               { PreProc }, -- PreCondit      xxx links to PreProc
    sym"@attribute"                         { PreProc }, -- @attribute     xxx links to PreProc
    sym"@include"                           { PreProc }, -- @include       xxx links to PreProc
    sym"@annotation"                        { PreProc }, -- @annotation    xxx links to PreProc
    sym"@namespace"                         { PreProc }, -- @namespace     xxx links to PreProc
    NvimTreeGitRenamedIcon                  { PreProc }, -- NvimTreeGitRenamedIcon xxx links to PreProc
    NvimTreeGitNewIcon                      { PreProc }, -- NvimTreeGitNewIcon xxx links to PreProc
    NvimTreeLiveFilterPrefix                { PreProc }, -- NvimTreeLiveFilterPrefix xxx links to PreProc
    StorageClass                            { fg="#d194c7", }, -- StorageClass   xxx guifg=#d194c7
    Type                                    { fg="#ced1d4", }, -- Type           xxx guifg=#ced1d4
    Typedef                                 { Type }, -- Typedef        xxx links to Type
    sym"@type"                              { Type }, -- @type          xxx links to Type
    NvimNumberPrefix                        { Type }, -- NvimNumberPrefix xxx links to Type
    NvimOptionSigil                         { Type }, -- NvimOptionSigil xxx links to Type
    NvimTreeModifiedIcon                    { Type }, -- NvimTreeModifiedIcon xxx links to Type
    goType                                  { Type }, -- goType         xxx links to Type
    goSignedInts                            { Type }, -- goSignedInts   xxx links to Type
    goUnsignedInts                          { Type }, -- goUnsignedInts xxx links to Type
    goFloats                                { Type }, -- goFloats       xxx links to Type
    goComplexes                             { Type }, -- goComplexes    xxx links to Type
    goTypeName                              { Type }, -- goTypeName     xxx links to Type
    goExtraType                             { Type }, -- goExtraType    xxx links to Type
    goFunctionCall                          { Type }, -- goFunctionCall xxx links to Type
    goTypeConstructor                       { Type }, -- goTypeConstructor xxx links to Type
    Structure                               { fg="#d194c7", }, -- Structure      xxx guifg=#d194c7
    sym"@module"                            { Structure }, -- @module        xxx links to Structure
    luaTable                                { Structure }, -- luaTable       xxx links to Structure
    Tag                                     { fg="#ffc66b", }, -- Tag            xxx guifg=#ffc66b
    sym"@tag"                               { Tag }, -- @tag           xxx links to Tag
    Special                                 { fg="#cd7832", }, -- Special        xxx guifg=#cd7832
    SpecialChar                             { Special }, -- SpecialChar    xxx links to Special
    SpecialComment                          { Special }, -- SpecialComment xxx links to Special
    Debug                                   { Special }, -- Debug          xxx links to Special
    sym"@variable.parameter.builtin"        { Special }, -- @variable.parameter.builtin xxx links to Special
    sym"@module.builtin"                    { Special }, -- @module.builtin xxx links to Special
    sym"@attribute.builtin"                 { Special }, -- @attribute.builtin xxx links to Special
    Delimiter                               { Special }, -- Delimiter      xxx links to Special
    sym"@markup"                            { Special }, -- @markup        xxx links to Special
    sym"@tag.builtin"                       { Special }, -- @tag.builtin   xxx links to Special
    sym"@tag.delimiter"                     { Special }, -- @tag.delimiter xxx links to Special
    NvimTreeOpenedHL                        { Special }, -- NvimTreeOpenedHL xxx links to Special
    BlinkCmpKind                            { Special }, -- BlinkCmpKind   xxx links to Special
    goSpecialString                         { Special }, -- goSpecialString xxx links to Special
    Ignore                                  { fg="#6b737b", }, -- Ignore         xxx guifg=#6b737b
    LspReferenceRead                        { bg="#49494b", }, -- LspReferenceRead xxx guibg=#49494b
    LspReferenceText                        { bg="#49494b", }, -- LspReferenceText xxx guibg=#49494b
    LspReferenceTarget                      { LspReferenceText }, -- LspReferenceTarget xxx links to LspReferenceText
    LspReferenceWrite                       { bg="#49494b", }, -- LspReferenceWrite xxx guibg=#49494b
    DiagnosticError                         { fg="nvimlightred", }, -- DiagnosticError xxx ctermfg=9 guifg=NvimLightRed
    DiagnosticFloatingError                 { DiagnosticError }, -- DiagnosticFloatingError xxx links to DiagnosticError
    DiagnosticVirtualTextError              { DiagnosticError }, -- DiagnosticVirtualTextError xxx links to DiagnosticError
    DiagnosticSignError                     { DiagnosticError }, -- DiagnosticSignError xxx links to DiagnosticError
    sym"@comment.error"                     { DiagnosticError }, -- @comment.error xxx links to DiagnosticError
    WhichKeyIconRed                         { DiagnosticError }, -- WhichKeyIconRed xxx links to DiagnosticError
    NvimTreeDiagnosticErrorIcon             { DiagnosticError }, -- NvimTreeDiagnosticErrorIcon xxx links to DiagnosticError
    DiagnosticWarn                          { fg="nvimlightyellow", }, -- DiagnosticWarn xxx ctermfg=11 guifg=NvimLightYellow
    DiagnosticFloatingWarn                  { DiagnosticWarn }, -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
    DiagnosticVirtualTextWarn               { DiagnosticWarn }, -- DiagnosticVirtualTextWarn xxx links to DiagnosticWarn
    DiagnosticSignWarn                      { DiagnosticWarn }, -- DiagnosticSignWarn xxx links to DiagnosticWarn
    sym"@comment.warning"                   { DiagnosticWarn }, -- @comment.warning xxx links to DiagnosticWarn
    WhichKeyIconYellow                      { DiagnosticWarn }, -- WhichKeyIconYellow xxx links to DiagnosticWarn
    WhichKeyIconOrange                      { DiagnosticWarn }, -- WhichKeyIconOrange xxx links to DiagnosticWarn
    NvimTreeDiagnosticWarnIcon              { DiagnosticWarn }, -- NvimTreeDiagnosticWarnIcon xxx links to DiagnosticWarn
    DiagnosticInfo                          { fg="nvimlightcyan", }, -- DiagnosticInfo xxx ctermfg=14 guifg=NvimLightCyan
    DiagnosticFloatingInfo                  { DiagnosticInfo }, -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
    DiagnosticVirtualTextInfo               { DiagnosticInfo }, -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
    DiagnosticSignInfo                      { DiagnosticInfo }, -- DiagnosticSignInfo xxx links to DiagnosticInfo
    sym"@comment.note"                      { DiagnosticInfo }, -- @comment.note  xxx links to DiagnosticInfo
    WhichKeyIconBlue                        { DiagnosticInfo }, -- WhichKeyIconBlue xxx links to DiagnosticInfo
    NvimTreeDiagnosticInfoIcon              { DiagnosticInfo }, -- NvimTreeDiagnosticInfoIcon xxx links to DiagnosticInfo
    DiagnosticHint                          { fg="nvimlightblue", }, -- DiagnosticHint xxx ctermfg=12 guifg=NvimLightBlue
    DiagnosticFloatingHint                  { DiagnosticHint }, -- DiagnosticFloatingHint xxx links to DiagnosticHint
    DiagnosticVirtualTextHint               { DiagnosticHint }, -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
    DiagnosticSignHint                      { DiagnosticHint }, -- DiagnosticSignHint xxx links to DiagnosticHint
    WhichKeyIconCyan                        { DiagnosticHint }, -- WhichKeyIconCyan xxx links to DiagnosticHint
    NvimTreeDiagnosticHintIcon              { DiagnosticHint }, -- NvimTreeDiagnosticHintIcon xxx links to DiagnosticHint
    DiagnosticOk                            { fg="nvimlightgreen", }, -- DiagnosticOk   xxx ctermfg=10 guifg=NvimLightGreen
    DiagnosticFloatingOk                    { DiagnosticOk }, -- DiagnosticFloatingOk xxx links to DiagnosticOk
    DiagnosticVirtualTextOk                 { DiagnosticOk }, -- DiagnosticVirtualTextOk xxx links to DiagnosticOk
    DiagnosticSignOk                        { DiagnosticOk }, -- DiagnosticSignOk xxx links to DiagnosticOk
    WhichKeyIconGreen                       { DiagnosticOk }, -- WhichKeyIconGreen xxx links to DiagnosticOk
    Comment                                 { gui="italic", fg="#8a8a8a", }, -- Comment        xxx cterm=italic gui=italic guifg=#8a8a8a
    DiagnosticUnnecessary                   { Comment }, -- DiagnosticUnnecessary xxx links to Comment
    sym"@comment"                           { Comment }, -- @comment       xxx links to Comment
    WhichKeySeparator                       { Comment }, -- WhichKeySeparator xxx links to Comment
    WhichKeyValue                           { Comment }, -- WhichKeyValue  xxx links to Comment
    NvimTreeGitIgnoredIcon                  { Comment }, -- NvimTreeGitIgnoredIcon xxx links to Comment
    luaComment                              { Comment }, -- luaComment     xxx links to Comment
    goComment                               { Comment }, -- goComment      xxx links to Comment
    goPackageComment                        { Comment }, -- goPackageComment xxx links to Comment
    goCoverageNormalText                    { Comment }, -- goCoverageNormalText xxx links to Comment
    sym"@variable"                          { fg="#ced1d4", }, -- @variable      xxx guifg=#ced1d4
    sym"@lsp.type.variable"                 { sym"@variable" }, -- @lsp.type.variable xxx links to @variable
    sym"@variable.builtin"                  { gui="italic", fg="#cd7832", }, -- @variable.builtin xxx cterm=italic gui=italic guifg=#cd7832
    sym"@constant.builtin"                  { gui="italic", fg="#cd7832", }, -- @constant.builtin xxx cterm=italic gui=italic guifg=#cd7832
    String                                  { fg="#8fa867", }, -- String         xxx guifg=#8fa867
    sym"@string"                            { String }, -- @string        xxx links to String
    NvimString                              { String }, -- NvimString     xxx links to String
    sym"@text.literal"                      { String }, -- @text.literal  xxx links to String
    luaString2                              { String }, -- luaString2     xxx links to String
    luaString                               { String }, -- luaString      xxx links to String
    goString                                { String }, -- goString       xxx links to String
    goRawString                             { String }, -- goRawString    xxx links to String
    goImportString                          { String }, -- goImportString xxx links to String
    sym"@type.builtin"                      { gui="italic", fg="#ced1d4", }, -- @type.builtin  xxx cterm=italic gui=italic guifg=#ced1d4
    sym"@property"                          { fg="#a781bb", }, -- @property      xxx guifg=#a781bb
    sym"@lsp.type.property"                 { sym"@property" }, -- @lsp.type.property xxx links to @property
    Identifier                              { fg="#ced1d4", }, -- Identifier     xxx guifg=#ced1d4
    NvimIdentifier                          { Identifier }, -- NvimIdentifier xxx links to Identifier
    WhichKeyDesc                            { Identifier }, -- WhichKeyDesc   xxx links to Identifier
    luaFunc                                 { Identifier }, -- luaFunc        xxx links to Identifier
    goBuiltins                              { Identifier }, -- goBuiltins     xxx links to Identifier
    goField                                 { Identifier }, -- goField        xxx links to Identifier
    Function                                { fg="#ffc66b", }, -- Function       xxx guifg=#ffc66b
    sym"@function"                          { Function }, -- @function      xxx links to Function
    sym"@function.builtin"                  { Function }, -- @function.builtin xxx links to Function
    sym"@method"                            { Function }, -- @method        xxx links to Function
    sym"@function.macro"                    { Function }, -- @function.macro xxx links to Function
    WhichKey                                { Function }, -- WhichKey       xxx links to Function
    WhichKeyIconAzure                       { Function }, -- WhichKeyIconAzure xxx links to Function
    luaMetaMethod                           { Function }, -- luaMetaMethod  xxx links to Function
    luaFunction                             { Function }, -- luaFunction    xxx links to Function
    goFunction                              { Function }, -- goFunction     xxx links to Function
    sym"@constructor"                       { fg="#ced1d4", }, -- @constructor   xxx guifg=#ced1d4
    Operator                                { fg="#ced1d4", }, -- Operator       xxx guifg=#ced1d4
    sym"@operator"                          { Operator }, -- @operator      xxx links to Operator
    NvimAssignment                          { Operator }, -- NvimAssignment xxx links to Operator
    NvimOperator                            { Operator }, -- NvimOperator   xxx links to Operator
    luaOperator                             { Operator }, -- luaOperator    xxx links to Operator
    goOperator                              { Operator }, -- goOperator     xxx links to Operator
    Todo                                    { gui="bold", }, -- Todo           xxx cterm=bold gui=bold
    sym"@comment.todo"                      { Todo }, -- @comment.todo  xxx links to Todo
    luaTodo                                 { Todo }, -- luaTodo        xxx links to Todo
    goTodo                                  { Todo }, -- goTodo         xxx links to Todo
    sym"@markup.strong"                     { gui="bold", }, -- @markup.strong xxx cterm=bold gui=bold
    sym"@markup.italic"                     { gui="italic", }, -- @markup.italic xxx cterm=italic gui=italic
    sym"@markup.strikethrough"              { gui="strikethrough", }, -- @markup.strikethrough xxx cterm=strikethrough gui=strikethrough
    sym"@markup.underline"                  { gui="underline", }, -- @markup.underline xxx cterm=underline gui=underline
    Added                                   { fg="nvimlightgreen", }, -- Added          xxx ctermfg=10 guifg=NvimLightGreen
    sym"@diff.plus"                         { Added }, -- @diff.plus     xxx links to Added
    GitSignsAdd                             { Added }, -- GitSignsAdd    xxx links to Added
    Removed                                 { fg="nvimlightred", }, -- Removed        xxx ctermfg=9 guifg=NvimLightRed
    sym"@diff.minus"                        { Removed }, -- @diff.minus    xxx links to Removed
    GitSignsDelete                          { Removed }, -- GitSignsDelete xxx links to Removed
    Changed                                 { fg="nvimlightcyan", }, -- Changed        xxx ctermfg=14 guifg=NvimLightCyan
    sym"@diff.delta"                        { Changed }, -- @diff.delta    xxx links to Changed
    GitSignsChange                          { Changed }, -- GitSignsChange xxx links to Changed
    sym"@markup.heading.1.delimiter.vimdoc" { sp="fg", bg="bg", fg="bg", gui="underdouble,nocombine", }, -- @markup.heading.1.delimiter.vimdoc xxx cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
    sym"@markup.heading.2.delimiter.vimdoc" { sp="fg", bg="bg", fg="bg", gui="underline,nocombine", }, -- @markup.heading.2.delimiter.vimdoc xxx cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg
    sym"@constant.macro"                    { gui="bold", fg="#cd7832", }, -- @constant.macro xxx cterm=bold gui=bold guifg=#cd7832
    sym"@lsp.type.macro"                    { sym"@constant.macro" }, -- @lsp.type.macro xxx links to @constant.macro
    DiagnosticDeprecated                    { sp="nvimlightred", gui="strikethrough", }, -- DiagnosticDeprecated xxx cterm=strikethrough gui=strikethrough guisp=NvimLightRed
    sym"@lsp.mod.deprecated"                { DiagnosticDeprecated }, -- @lsp.mod.deprecated xxx links to DiagnosticDeprecated
    FloatShadow                             { bg="nvimdarkgrey4", blend=80, }, -- FloatShadow    xxx ctermbg=0 guibg=NvimDarkGrey4 blend=80
    FloatShadowThrough                      { bg="nvimdarkgrey4", blend=100, }, -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100
    MatchParen                              { bg="#49494b", fg="#f7f7f8", }, -- MatchParen     xxx guifg=#f7f7f8 guibg=#49494b
    RedrawDebugClear                        { bg="nvimdarkyellow", }, -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
    RedrawDebugComposed                     { bg="nvimdarkgreen", }, -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
    RedrawDebugRecompose                    { bg="nvimdarkred", }, -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
    Error                                   { fg="#e74946", }, -- Error          xxx guifg=#e74946
    NvimInvalid                             { Error }, -- NvimInvalid    xxx links to Error
    luaParenError                           { Error }, -- luaParenError  xxx links to Error
    luaError                                { Error }, -- luaError       xxx links to Error
    goEscapeError                           { Error }, -- goEscapeError  xxx links to Error
    goDecimalError                          { Error }, -- goDecimalError xxx links to Error
    goHexadecimalError                      { Error }, -- goHexadecimalError xxx links to Error
    goOctalError                            { Error }, -- goOctalError   xxx links to Error
    goBinaryError                           { Error }, -- goBinaryError  xxx links to Error
    goSpaceError                            { Error }, -- goSpaceError   xxx links to Error
    DiagnosticUnderlineError                { sp="nvimlightred", gui="underline", }, -- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=NvimLightRed
    NvimTreeDiagnosticErrorFileHL           { DiagnosticUnderlineError }, -- NvimTreeDiagnosticErrorFileHL xxx links to DiagnosticUnderlineError
    DiagnosticUnderlineWarn                 { sp="nvimlightyellow", gui="underline", }, -- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=NvimLightYellow
    NvimTreeDiagnosticWarnFileHL            { DiagnosticUnderlineWarn }, -- NvimTreeDiagnosticWarnFileHL xxx links to DiagnosticUnderlineWarn
    DiagnosticUnderlineInfo                 { sp="nvimlightcyan", gui="underline", }, -- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=NvimLightCyan
    NvimTreeDiagnosticInfoFileHL            { DiagnosticUnderlineInfo }, -- NvimTreeDiagnosticInfoFileHL xxx links to DiagnosticUnderlineInfo
    DiagnosticUnderlineHint                 { sp="nvimlightblue", gui="underline", }, -- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=NvimLightBlue
    NvimTreeDiagnosticHintFileHL            { DiagnosticUnderlineHint }, -- NvimTreeDiagnosticHintFileHL xxx links to DiagnosticUnderlineHint
    DiagnosticUnderlineOk                   { sp="nvimlightgreen", gui="underline", }, -- DiagnosticUnderlineOk xxx cterm=underline gui=underline guisp=NvimLightGreen
    NvimInternalError                       { bg="red", fg="red", }, -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
    NvimFigureBrace                         { NvimInternalError }, -- NvimFigureBrace xxx links to NvimInternalError
    NvimSingleQuotedUnknownEscape           { NvimInternalError }, -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimInvalidSingleQuotedUnknownEscape    { NvimInternalError }, -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimTreeFolderIcon                      { fg="#87949b", }, -- NvimTreeFolderIcon xxx guifg=#87949b
    NvimTreeBookmarkIcon                    { NvimTreeFolderIcon }, -- NvimTreeBookmarkIcon xxx links to NvimTreeFolderIcon
    NvimTreeOpenedFolderIcon                { NvimTreeFolderIcon }, -- NvimTreeOpenedFolderIcon xxx links to NvimTreeFolderIcon
    NvimTreeClosedFolderIcon                { NvimTreeFolderIcon }, -- NvimTreeClosedFolderIcon xxx links to NvimTreeFolderIcon
    NvimTreeRootFolder                      { fg="#87949b", }, -- NvimTreeRootFolder xxx guifg=#87949b
    NvimTreeNormal                          { bg="#2f3032", fg="#ced1d4", }, -- NvimTreeNormal xxx guifg=#ced1d4 guibg=#2f3032
    NvimTreeNormalNC                        { NvimTreeNormal }, -- NvimTreeNormalNC xxx links to NvimTreeNormal
    NvimTreeSignColumn                      { NvimTreeNormal }, -- NvimTreeSignColumn xxx links to NvimTreeNormal
    NvimTreeFileIcon                        { NvimTreeNormal }, -- NvimTreeFileIcon xxx links to NvimTreeNormal
    NvimTreeSymlinkIcon                     { NvimTreeNormal }, -- NvimTreeSymlinkIcon xxx links to NvimTreeNormal
    HelpHyperTextJump                       { fg="#ffc66b", }, -- HelpHyperTextJump xxx guifg=#ffc66b
    sym"@error"                             { fg="#e74946", }, -- @error         xxx guifg=#e74946
    sym"@text"                              { fg="#ced1d4", }, -- @text          xxx guifg=#ced1d4
    sym"@text.uri"                          { gui="italic", fg="#8fa867", }, -- @text.uri      xxx cterm=italic gui=italic guifg=#8fa867
    sym"@text.title"                        { fg="#cd7832", }, -- @text.title    xxx guifg=#cd7832
    sym"@text.strong"                       { gui="bold", fg="#ced1d4", }, -- @text.strong   xxx cterm=bold gui=bold guifg=#ced1d4
    sym"@text.strike"                       { gui="underline", fg="#8a8a8a", }, -- @text.strike   xxx cterm=underline gui=underline guifg=#8a8a8a
    sym"@text.underline"                    { gui="underline", fg="#ced1d4", }, -- @text.underline xxx cterm=underline gui=underline guifg=#ced1d4
    sym"@text.emphasis"                     { gui="italic", fg="#ced1d4", }, -- @text.emphasis xxx cterm=italic gui=italic guifg=#ced1d4
    sym"@punctuation.bracket"               { fg="#ced1d4", }, -- @punctuation.bracket xxx guifg=#ced1d4
    sym"@parameter"                         { fg="#ced1d4", }, -- @parameter     xxx guifg=#ced1d4
    sym"@parameter.reference"               { fg="#ced1d4", }, -- @parameter.reference xxx guifg=#ced1d4
    sym"@field"                             { fg="#a781bb", }, -- @field         xxx guifg=#a781bb
    sym"@symbol"                            { gui="italic", fg="#8fa867", }, -- @symbol        xxx cterm=italic gui=italic guifg=#8fa867
    Italic                                  { gui="italic", }, -- Italic         xxx cterm=italic gui=italic
    LspDiagnosticsUnderlineHint             { gui="underline", }, -- LspDiagnosticsUnderlineHint xxx cterm=underline gui=underline
    LspDiagnosticsUnderlineInformation      { gui="underline", }, -- LspDiagnosticsUnderlineInformation xxx cterm=underline gui=underline
    LspDiagnosticsUnderlineWarning          { gui="underline", }, -- LspDiagnosticsUnderlineWarning xxx cterm=underline gui=underline
    LspDiagnosticsUnderlineError            { gui="underline", }, -- LspDiagnosticsUnderlineError xxx cterm=underline gui=underline
    LspDiagnosticsDefaultHint               { fg="#4db380", }, -- LspDiagnosticsDefaultHint xxx guifg=#4db380
    LspDiagnosticsDefaultInformation        { fg="#ced1d4", }, -- LspDiagnosticsDefaultInformation xxx guifg=#ced1d4
    LspDiagnosticsDefaultWarning            { fg="#ffc66b", }, -- LspDiagnosticsDefaultWarning xxx guifg=#ffc66b
    LspDiagnosticsDefaultError              { fg="#e74946", }, -- LspDiagnosticsDefaultError xxx guifg=#e74946
    Bold                                    { gui="bold", }, -- Bold           xxx cterm=bold gui=bold
    markdownLinkText                        { fg="#ced1d4", }, -- markdownLinkText xxx guifg=#ced1d4
    NvimTreeIndentMarker                    { fg="#4f5254", }, -- NvimTreeIndentMarker xxx guifg=#4f5254
    NvimTreeFolderArrowClosed               { NvimTreeIndentMarker }, -- NvimTreeFolderArrowClosed xxx links to NvimTreeIndentMarker
    NvimTreeFolderArrowOpen                 { NvimTreeIndentMarker }, -- NvimTreeFolderArrowOpen xxx links to NvimTreeIndentMarker
    NvimTreeWindowPicker                    { gui="bold", bg="#4493c8", fg="#ededed", }, -- NvimTreeWindowPicker xxx ctermfg=15 ctermbg=4 gui=bold guifg=#ededed guibg=#4493c8
    DevIconDefault                          { fg="#6d8086", }, -- DevIconDefault xxx ctermfg=66 guifg=#6d8086
    DevIconWindowsMediaAudio                { fg="#00afff", }, -- DevIconWindowsMediaAudio xxx ctermfg=39 guifg=#00afff
    DevIconArcoLinux                        { fg="#6690eb", }, -- DevIconArcoLinux xxx ctermfg=68 guifg=#6690eb
    DevIconVlang                            { fg="#5d87bf", }, -- DevIconVlang   xxx ctermfg=67 guifg=#5d87bf
    DevIconTypeScript                       { fg="#519aba", }, -- DevIconTypeScript xxx ctermfg=74 guifg=#519aba
    DevIconWaveformAudioFile                { fg="#00afff", }, -- DevIconWaveformAudioFile xxx ctermfg=39 guifg=#00afff
    DevIconTypst                            { fg="#0dbcc0", }, -- DevIconTypst   xxx ctermfg=37 guifg=#0dbcc0
    DevIconSig                              { fg="#e37933", }, -- DevIconSig     xxx ctermfg=166 guifg=#e37933
    DevIconKsh                              { fg="#4d5a5e", }, -- DevIconKsh     xxx ctermfg=240 guifg=#4d5a5e
    DevIconTsx                              { fg="#1354bf", }, -- DevIconTsx     xxx ctermfg=26 guifg=#1354bf
    DevIcon3DObjectFile                     { fg="#888888", }, -- DevIcon3DObjectFile xxx ctermfg=102 guifg=#888888
    DevIconCts                              { fg="#519aba", }, -- DevIconCts     xxx ctermfg=74 guifg=#519aba
    DevIconMts                              { fg="#519aba", }, -- DevIconMts     xxx ctermfg=74 guifg=#519aba
    DevIconTwig                             { fg="#8dc149", }, -- DevIconTwig    xxx ctermfg=113 guifg=#8dc149
    DevIconPl                               { fg="#519aba", }, -- DevIconPl      xxx ctermfg=74 guifg=#519aba
    DevIconBackup                           { fg="#6d8086", }, -- DevIconBackup  xxx ctermfg=66 guifg=#6d8086
    DevIconLabView                          { fg="#fec60a", }, -- DevIconLabView xxx ctermfg=220 guifg=#fec60a
    DevIconHurl                             { fg="#ff0288", }, -- DevIconHurl    xxx ctermfg=198 guifg=#ff0288
    DevIconMakefile                         { fg="#6d8086", }, -- DevIconMakefile xxx ctermfg=66 guifg=#6d8086
    DevIconGitCommit                        { fg="#f54d27", }, -- DevIconGitCommit xxx ctermfg=196 guifg=#f54d27
    DevIconM3u8                             { fg="#ed95ae", }, -- DevIconM3u8    xxx ctermfg=211 guifg=#ed95ae
    DevIconLicense                          { fg="#cbcb41", }, -- DevIconLicense xxx ctermfg=185 guifg=#cbcb41
    DevIconAppleScript                      { fg="#6d8085", }, -- DevIconAppleScript xxx ctermfg=66 guifg=#6d8085
    DevIconBinaryGLTF                       { fg="#ffb13b", }, -- DevIconBinaryGLTF xxx ctermfg=214 guifg=#ffb13b
    DevIconCoffee                           { fg="#cbcb41", }, -- DevIconCoffee  xxx ctermfg=185 guifg=#cbcb41
    DevIconBmp                              { fg="#a074c4", }, -- DevIconBmp     xxx ctermfg=140 guifg=#a074c4
    DevIconMd                               { fg="#dddddd", }, -- DevIconMd      xxx ctermfg=253 guifg=#dddddd
    DevIconCobol                            { fg="#005ca5", }, -- DevIconCobol   xxx ctermfg=25 guifg=#005ca5
    DevIconLuaurc                           { fg="#00a2ff", }, -- DevIconLuaurc  xxx ctermfg=75 guifg=#00a2ff
    DevIconPsd                              { fg="#519aba", }, -- DevIconPsd     xxx ctermfg=74 guifg=#519aba
    DevIconSublime                          { fg="#e37933", }, -- DevIconSublime xxx ctermfg=166 guifg=#e37933
    DevIconAdaSpecification                 { fg="#ffffff", }, -- DevIconAdaSpecification xxx ctermfg=231 guifg=#ffffff
    DevIconVim                              { fg="#019833", }, -- DevIconVim     xxx ctermfg=28 guifg=#019833
    DevIconWasm                             { fg="#5c4cdb", }, -- DevIconWasm    xxx ctermfg=62 guifg=#5c4cdb
    DevIconWebm                             { fg="#fd971f", }, -- DevIconWebm    xxx ctermfg=208 guifg=#fd971f
    DevIconXcPlayground                     { fg="#e37933", }, -- DevIconXcPlayground xxx ctermfg=166 guifg=#e37933
    DevIconScalaScript                      { fg="#cc3e44", }, -- DevIconScalaScript xxx ctermfg=167 guifg=#cc3e44
    DevIconPackedResource                   { fg="#6d8086", }, -- DevIconPackedResource xxx ctermfg=66 guifg=#6d8086
    DevIconOpenTypeFont                     { fg="#ececec", }, -- DevIconOpenTypeFont xxx ctermfg=255 guifg=#ececec
    DevIconOpusAudioFile                    { fg="#0075aa", }, -- DevIconOpusAudioFile xxx ctermfg=24 guifg=#0075aa
    DevIconProlog                           { fg="#e4b854", }, -- DevIconProlog  xxx ctermfg=179 guifg=#e4b854
    DevIconMint                             { fg="#87c095", }, -- DevIconMint    xxx ctermfg=108 guifg=#87c095
    DevIconMdx                              { fg="#519aba", }, -- DevIconMdx     xxx ctermfg=74 guifg=#519aba
    DevIconMaterial                         { fg="#b83998", }, -- DevIconMaterial xxx ctermfg=163 guifg=#b83998
    DevIconPp                               { fg="#ffa61a", }, -- DevIconPp      xxx ctermfg=214 guifg=#ffa61a
    DevIconOdin                             { fg="#3882d2", }, -- DevIconOdin    xxx ctermfg=32 guifg=#3882d2
    DevIconHtm                              { fg="#e34c26", }, -- DevIconHtm     xxx ctermfg=196 guifg=#e34c26
    DevIconIco                              { fg="#cbcb41", }, -- DevIconIco     xxx ctermfg=185 guifg=#cbcb41
    DevIconHtml                             { fg="#e44d26", }, -- DevIconHtml    xxx ctermfg=196 guifg=#e44d26
    DevIconHaxe                             { fg="#ea8220", }, -- DevIconHaxe    xxx ctermfg=208 guifg=#ea8220
    DevIconEx                               { fg="#a074c4", }, -- DevIconEx      xxx ctermfg=140 guifg=#a074c4
    DevIconElf                              { fg="#9f0500", }, -- DevIconElf     xxx ctermfg=124 guifg=#9f0500
    DevIconEpp                              { fg="#ffa61a", }, -- DevIconEpp     xxx ctermfg=214 guifg=#ffa61a
    DevIconFsscript                         { fg="#519aba", }, -- DevIconFsscript xxx ctermfg=74 guifg=#519aba
    DevIconErl                              { fg="#b83998", }, -- DevIconErl     xxx ctermfg=163 guifg=#b83998
    DevIconTcl                              { fg="#1e5cb3", }, -- DevIconTcl     xxx ctermfg=25 guifg=#1e5cb3
    DevIconNushell                          { fg="#3aa675", }, -- DevIconNushell xxx ctermfg=36 guifg=#3aa675
    DevIconTerminal                         { fg="#31b53e", }, -- DevIconTerminal xxx ctermfg=34 guifg=#31b53e
    DevIconEdn                              { fg="#519aba", }, -- DevIconEdn     xxx ctermfg=74 guifg=#519aba
    DevIconJustfile                         { fg="#6d8086", }, -- DevIconJustfile xxx ctermfg=66 guifg=#6d8086
    DevIconWebmanifest                      { fg="#f1e05a", }, -- DevIconWebmanifest xxx ctermfg=185 guifg=#f1e05a
    DevIconDll                              { fg="#4d2c0b", }, -- DevIconDll     xxx ctermfg=52 guifg=#4d2c0b
    DevIconCPlusPlus                        { fg="#f34b7d", }, -- DevIconCPlusPlus xxx ctermfg=204 guifg=#f34b7d
    DevIconCsh                              { fg="#4d5a5e", }, -- DevIconCsh     xxx ctermfg=240 guifg=#4d5a5e
    DevIconEslintrc                         { fg="#4b32c3", }, -- DevIconEslintrc xxx ctermfg=56 guifg=#4b32c3
    DevIconTypeScriptReactTest              { fg="#1354bf", }, -- DevIconTypeScriptReactTest xxx ctermfg=26 guifg=#1354bf
    DevIconTestTs                           { fg="#519aba", }, -- DevIconTestTs  xxx ctermfg=74 guifg=#519aba
    DevIconJavaScriptReactTest              { fg="#20c2e3", }, -- DevIconJavaScriptReactTest xxx ctermfg=45 guifg=#20c2e3
    DevIconTestJs                           { fg="#cbcb41", }, -- DevIconTestJs  xxx ctermfg=185 guifg=#cbcb41
    DevIconDb                               { fg="#dad8d8", }, -- DevIconDb      xxx ctermfg=188 guifg=#dad8d8
    DevIconEjs                              { fg="#cbcb41", }, -- DevIconEjs     xxx ctermfg=185 guifg=#cbcb41
    DevIconDropbox                          { fg="#0061fe", }, -- DevIconDropbox xxx ctermfg=27 guifg=#0061fe
    DevIconCjs                              { fg="#cbcb41", }, -- DevIconCjs     xxx ctermfg=185 guifg=#cbcb41
    DevIconDocx                             { fg="#185abd", }, -- DevIconDocx    xxx ctermfg=26 guifg=#185abd
    DevIconCson                             { fg="#cbcb41", }, -- DevIconCson    xxx ctermfg=185 guifg=#cbcb41
    DevIconCp                               { fg="#519aba", }, -- DevIconCp      xxx ctermfg=74 guifg=#519aba
    DevIconLock                             { fg="#bbbbbb", }, -- DevIconLock    xxx ctermfg=250 guifg=#bbbbbb
    DevIconVagrantfile                      { fg="#1563ff", }, -- DevIconVagrantfile xxx ctermfg=27 guifg=#1563ff
    DevIconHypridle                         { fg="#00aaae", }, -- DevIconHypridle xxx ctermfg=37 guifg=#00aaae
    DevIconGemfile                          { fg="#701516", }, -- DevIconGemfile xxx ctermfg=52 guifg=#701516
    DevIconJava                             { fg="#cc3e44", }, -- DevIconJava    xxx ctermfg=167 guifg=#cc3e44
    DevIconHyprland                         { fg="#00aaae", }, -- DevIconHyprland xxx ctermfg=37 guifg=#00aaae
    DevIconBrewfile                         { fg="#701516", }, -- DevIconBrewfile xxx ctermfg=52 guifg=#701516
    DevIconAPL                              { fg="#24a148", }, -- DevIconAPL     xxx ctermfg=35 guifg=#24a148
    DevIconAvif                             { fg="#a074c4", }, -- DevIconAvif    xxx ctermfg=140 guifg=#a074c4
    DevIconFsharp                           { fg="#519aba", }, -- DevIconFsharp  xxx ctermfg=74 guifg=#519aba
    DevIconPsb                              { fg="#519aba", }, -- DevIconPsb     xxx ctermfg=74 guifg=#519aba
    DevIconPy                               { fg="#ffbc03", }, -- DevIconPy      xxx ctermfg=214 guifg=#ffbc03
    DevIconPpt                              { fg="#cb4a32", }, -- DevIconPpt     xxx ctermfg=160 guifg=#cb4a32
    DevIconXls                              { fg="#207245", }, -- DevIconXls     xxx ctermfg=29 guifg=#207245
    DevIconWebpack                          { fg="#519aba", }, -- DevIconWebpack xxx ctermfg=74 guifg=#519aba
    DevIconPyx                              { fg="#5aa7e4", }, -- DevIconPyx     xxx ctermfg=39 guifg=#5aa7e4
    DevIconPxi                              { fg="#5aa7e4", }, -- DevIconPxi     xxx ctermfg=39 guifg=#5aa7e4
    DevIconPxd                              { fg="#5aa7e4", }, -- DevIconPxd     xxx ctermfg=39 guifg=#5aa7e4
    DevIconSlim                             { fg="#e34c26", }, -- DevIconSlim    xxx ctermfg=196 guifg=#e34c26
    DevIconRproj                            { fg="#358a5b", }, -- DevIconRproj   xxx ctermfg=29 guifg=#358a5b
    DevIconPyo                              { fg="#ffe291", }, -- DevIconPyo     xxx ctermfg=222 guifg=#ffe291
    DevIconi3                               { fg="#e8ebee", }, -- DevIconi3      xxx ctermfg=255 guifg=#e8ebee
    DevIconPsScriptfile                     { fg="#4273ca", }, -- DevIconPsScriptfile xxx ctermfg=68 guifg=#4273ca
    DevIconPsScriptModulefile               { fg="#6975c4", }, -- DevIconPsScriptModulefile xxx ctermfg=68 guifg=#6975c4
    DevIconCheckhealth                      { fg="#75b4fb", }, -- DevIconCheckhealth xxx ctermfg=75 guifg=#75b4fb
    DevIconHbs                              { fg="#f0772b", }, -- DevIconHbs     xxx ctermfg=202 guifg=#f0772b
    DevIconGodotTextScene                   { fg="#6d8086", }, -- DevIconGodotTextScene xxx ctermfg=66 guifg=#6d8086
    DevIconHaml                             { fg="#eaeae1", }, -- DevIconHaml    xxx ctermfg=255 guifg=#eaeae1
    DevIconHeex                             { fg="#a074c4", }, -- DevIconHeex    xxx ctermfg=140 guifg=#a074c4
    DevIconHexadecimal                      { fg="#2e63ff", }, -- DevIconHexadecimal xxx ctermfg=27 guifg=#2e63ff
    DevIconAi                               { fg="#cbcb41", }, -- DevIconAi      xxx ctermfg=185 guifg=#cbcb41
    DevIconGradle                           { fg="#005f87", }, -- DevIconGradle  xxx ctermfg=24 guifg=#005f87
    DevIconxmonad                           { fg="#fd4d5d", }, -- DevIconxmonad  xxx ctermfg=203 guifg=#fd4d5d
    DevIconGraphQL                          { fg="#e535ab", }, -- DevIconGraphQL xxx ctermfg=199 guifg=#e535ab
    DevIconClangConfig                      { fg="#6d8086", }, -- DevIconClangConfig xxx ctermfg=66 guifg=#6d8086
    DevIconLocalization                     { fg="#2596be", }, -- DevIconLocalization xxx ctermfg=31 guifg=#2596be
    DevIconConda                            { fg="#43b02a", }, -- DevIconConda   xxx ctermfg=34 guifg=#43b02a
    DevIconPls                              { fg="#ed95ae", }, -- DevIconPls     xxx ctermfg=211 guifg=#ed95ae
    DevIconQtile                            { fg="#ffffff", }, -- DevIconQtile   xxx ctermfg=231 guifg=#ffffff
    DevIconZshprofile                       { fg="#89e051", }, -- DevIconZshprofile xxx ctermfg=113 guifg=#89e051
    DevIconTypeScriptDeclaration            { fg="#d59855", }, -- DevIconTypeScriptDeclaration xxx ctermfg=172 guifg=#d59855
    DevIconZshenv                           { fg="#89e051", }, -- DevIconZshenv  xxx ctermfg=113 guifg=#89e051
    DevIconJWM                              { fg="#0078cd", }, -- DevIconJWM     xxx ctermfg=32 guifg=#0078cd
    DevIconBzl                              { fg="#89e051", }, -- DevIconBzl     xxx ctermfg=113 guifg=#89e051
    DevIconPhp                              { fg="#a074c4", }, -- DevIconPhp     xxx ctermfg=140 guifg=#a074c4
    DevIconDockerfile                       { fg="#458ee6", }, -- DevIconDockerfile xxx ctermfg=68 guifg=#458ee6
    DevIconSte                              { fg="#839463", }, -- DevIconSte     xxx ctermfg=101 guifg=#839463
    DevIconTempl                            { fg="#dbbd30", }, -- DevIconTempl   xxx ctermfg=178 guifg=#dbbd30
    DevIconTmux                             { fg="#14ba19", }, -- DevIconTmux    xxx ctermfg=34 guifg=#14ba19
    DevIconConf                             { fg="#6d8086", }, -- DevIconConf    xxx ctermfg=66 guifg=#6d8086
    DevIconEnlightenment                    { fg="#ffffff", }, -- DevIconEnlightenment xxx ctermfg=231 guifg=#ffffff
    DevIcondwm                              { fg="#1177aa", }, -- DevIcondwm     xxx ctermfg=31 guifg=#1177aa
    DevIconPrisma                           { fg="#5a67d8", }, -- DevIconPrisma  xxx ctermfg=62 guifg=#5a67d8
    DevIconTypeScriptReactSpec              { fg="#1354bf", }, -- DevIconTypeScriptReactSpec xxx ctermfg=26 guifg=#1354bf
    DevIconCpp                              { fg="#519aba", }, -- DevIconCpp     xxx ctermfg=74 guifg=#519aba
    DevIconJavaScriptReactSpec              { fg="#20c2e3", }, -- DevIconJavaScriptReactSpec xxx ctermfg=45 guifg=#20c2e3
    DevIconPdf                              { fg="#b30b00", }, -- DevIconPdf     xxx ctermfg=124 guifg=#b30b00
    DevIconSpecJs                           { fg="#cbcb41", }, -- DevIconSpecJs  xxx ctermfg=185 guifg=#cbcb41
    DevIconDart                             { fg="#03589c", }, -- DevIconDart    xxx ctermfg=25 guifg=#03589c
    DevIconCowsayFile                       { fg="#965824", }, -- DevIconCowsayFile xxx ctermfg=130 guifg=#965824
    DevIconXfce                             { fg="#00aadf", }, -- DevIconXfce    xxx ctermfg=74 guifg=#00aadf
    DevIconStep                             { fg="#839463", }, -- DevIconStep    xxx ctermfg=101 guifg=#839463
    DevIconConfigRu                         { fg="#701516", }, -- DevIconConfigRu xxx ctermfg=52 guifg=#701516
    DevIconSolveSpace                       { fg="#839463", }, -- DevIconSolveSpace xxx ctermfg=101 guifg=#839463
    DevIconSwift                            { fg="#e37933", }, -- DevIconSwift   xxx ctermfg=166 guifg=#e37933
    DevIconcuda                             { fg="#89e051", }, -- DevIconcuda    xxx ctermfg=113 guifg=#89e051
    DevIconSolidWorksPrt                    { fg="#839463", }, -- DevIconSolidWorksPrt xxx ctermfg=101 guifg=#839463
    DevIconSvg                              { fg="#ffb13b", }, -- DevIconSvg     xxx ctermfg=214 guifg=#ffb13b
    DevIconSolidWorksAsm                    { fg="#839463", }, -- DevIconSolidWorksAsm xxx ctermfg=101 guifg=#839463
    DevIconSketchUp                         { fg="#839463", }, -- DevIconSketchUp xxx ctermfg=101 guifg=#839463
    DevIconClojureDart                      { fg="#519aba", }, -- DevIconClojureDart xxx ctermfg=74 guifg=#519aba
    DevIconSha512                           { fg="#8c86af", }, -- DevIconSha512  xxx ctermfg=103 guifg=#8c86af
    DevIconLXDE                             { fg="#a4a4a4", }, -- DevIconLXDE    xxx ctermfg=248 guifg=#a4a4a4
    DevIconSha384                           { fg="#8c86af", }, -- DevIconSha384  xxx ctermfg=103 guifg=#8c86af
    DevIconTex                              { fg="#3d6117", }, -- DevIconTex     xxx ctermfg=22 guifg=#3d6117
    DevIconSha224                           { fg="#8c86af", }, -- DevIconSha224  xxx ctermfg=103 guifg=#8c86af
    DevIconSha1                             { fg="#8c86af", }, -- DevIconSha1    xxx ctermfg=103 guifg=#8c86af
    DevIconCinnamon                         { fg="#dc682e", }, -- DevIconCinnamon xxx ctermfg=166 guifg=#dc682e
    DevIconBz3                              { fg="#eca517", }, -- DevIconBz3     xxx ctermfg=214 guifg=#eca517
    DevIconBudgie                           { fg="#4e5361", }, -- DevIconBudgie  xxx ctermfg=240 guifg=#4e5361
    DevIconBz2                              { fg="#eca517", }, -- DevIconBz2     xxx ctermfg=214 guifg=#eca517
    DevIconBz                               { fg="#eca517", }, -- DevIconBz      xxx ctermfg=214 guifg=#eca517
    DevIconZorin                            { fg="#14a1e8", }, -- DevIconZorin   xxx ctermfg=39 guifg=#14a1e8
    DevIconBoundaryRepresentation           { fg="#839463", }, -- DevIconBoundaryRepresentation xxx ctermfg=101 guifg=#839463
    DevIconXeroLinux                        { fg="#888fe2", }, -- DevIconXeroLinux xxx ctermfg=104 guifg=#888fe2
    DevIconToml                             { fg="#9c4221", }, -- DevIconToml    xxx ctermfg=124 guifg=#9c4221
    DevIconVanillaOS                        { fg="#fabd4d", }, -- DevIconVanillaOS xxx ctermfg=214 guifg=#fabd4d
    DevIconBin                              { fg="#9f0500", }, -- DevIconBin     xxx ctermfg=124 guifg=#9f0500
    DevIconGif                              { fg="#a074c4", }, -- DevIconGif     xxx ctermfg=140 guifg=#a074c4
    DevIconPng                              { fg="#a074c4", }, -- DevIconPng     xxx ctermfg=140 guifg=#a074c4
    DevIconJpeg                             { fg="#a074c4", }, -- DevIconJpeg    xxx ctermfg=140 guifg=#a074c4
    DevIconJpegXl                           { fg="#a074c4", }, -- DevIconJpegXl  xxx ctermfg=140 guifg=#a074c4
    DevIconWebp                             { fg="#a074c4", }, -- DevIconWebp    xxx ctermfg=140 guifg=#a074c4
    DevIconJpg                              { fg="#a074c4", }, -- DevIconJpg     xxx ctermfg=140 guifg=#a074c4
    DevIconTumbleweed                       { fg="#35b9ab", }, -- DevIconTumbleweed xxx ctermfg=37 guifg=#35b9ab
    DevIconTrisquelGNULinux                 { fg="#0f58b6", }, -- DevIconTrisquelGNULinux xxx ctermfg=25 guifg=#0f58b6
    DevIconGroovy                           { fg="#4a687c", }, -- DevIconGroovy  xxx ctermfg=24 guifg=#4a687c
    DevIconRar                              { fg="#eca517", }, -- DevIconRar     xxx ctermfg=214 guifg=#eca517
    DevIconGoWork                           { fg="#519aba", }, -- DevIconGoWork  xxx ctermfg=74 guifg=#519aba
    DevIconYaml                             { fg="#6d8086", }, -- DevIconYaml    xxx ctermfg=66 guifg=#6d8086
    DevIconGoSum                            { fg="#519aba", }, -- DevIconGoSum   xxx ctermfg=74 guifg=#519aba
    DevIconQt                               { fg="#40cd52", }, -- DevIconQt      xxx ctermfg=77 guifg=#40cd52
    DevIconGitIgnore                        { fg="#f54d27", }, -- DevIconGitIgnore xxx ctermfg=196 guifg=#f54d27
    DevIconGitAttributes                    { fg="#f54d27", }, -- DevIconGitAttributes xxx ctermfg=196 guifg=#f54d27
    DevIconGitModules                       { fg="#f54d27", }, -- DevIconGitModules xxx ctermfg=196 guifg=#f54d27
    DevIconGitConfig                        { fg="#f54d27", }, -- DevIconGitConfig xxx ctermfg=196 guifg=#f54d27
    DevIconPub                              { fg="#e3c58e", }, -- DevIconPub     xxx ctermfg=222 guifg=#e3c58e
    DevIconDesktopEntry                     { fg="#563d7c", }, -- DevIconDesktopEntry xxx ctermfg=54 guifg=#563d7c
    DevIconReScript                         { fg="#cc3e44", }, -- DevIconReScript xxx ctermfg=167 guifg=#cc3e44
    DevIconZshrc                            { fg="#89e051", }, -- DevIconZshrc   xxx ctermfg=113 guifg=#89e051
    DevIconMixLock                          { fg="#a074c4", }, -- DevIconMixLock xxx ctermfg=140 guifg=#a074c4
    DevIconPptx                             { fg="#cb4a32", }, -- DevIconPptx    xxx ctermfg=160 guifg=#cb4a32
    DevIconEditorConfig                     { fg="#fff2f2", }, -- DevIconEditorConfig xxx ctermfg=255 guifg=#fff2f2
    DevIconMpv                              { fg="#3b1342", }, -- DevIconMpv     xxx ctermfg=53 guifg=#3b1342
    DevIconPulseCodeModulation              { fg="#0075aa", }, -- DevIconPulseCodeModulation xxx ctermfg=24 guifg=#0075aa
    DevIconImportConfiguration              { fg="#ececec", }, -- DevIconImportConfiguration xxx ctermfg=255 guifg=#ececec
    DevIconPyLintConfig                     { fg="#6d8086", }, -- DevIconPyLintConfig xxx ctermfg=66 guifg=#6d8086
    DevIconPart                             { fg="#44cda8", }, -- DevIconPart    xxx ctermfg=43 guifg=#44cda8
    DevIconOut                              { fg="#9f0500", }, -- DevIconOut     xxx ctermfg=124 guifg=#9f0500
    DevIconVHDL                             { fg="#019833", }, -- DevIconVHDL    xxx ctermfg=28 guifg=#019833
    DevIconNPMrc                            { fg="#e8274b", }, -- DevIconNPMrc   xxx ctermfg=197 guifg=#e8274b
    DevIconBibTeX                           { fg="#cbcb41", }, -- DevIconBibTeX  xxx ctermfg=185 guifg=#cbcb41
    DevIconOggVorbis                        { fg="#0075aa", }, -- DevIconOggVorbis xxx ctermfg=24 guifg=#0075aa
    DevIconLibreOfficeWriter                { fg="#2dcbfd", }, -- DevIconLibreOfficeWriter xxx ctermfg=81 guifg=#2dcbfd
    DevIconGTK                              { fg="#ffffff", }, -- DevIconGTK     xxx ctermfg=231 guifg=#ffffff
    DevIconLibreOfficeCalc                  { fg="#78fc4e", }, -- DevIconLibreOfficeCalc xxx ctermfg=119 guifg=#78fc4e
    DevIconArduino                          { fg="#56b6c2", }, -- DevIconArduino xxx ctermfg=73 guifg=#56b6c2
    DevIconLibreOfficeImpress               { fg="#fe9c45", }, -- DevIconLibreOfficeImpress xxx ctermfg=215 guifg=#fe9c45
    DevIconLibreOfficeGraphics              { fg="#fffb57", }, -- DevIconLibreOfficeGraphics xxx ctermfg=227 guifg=#fffb57
    DevIconLibreOfficeFormula               { fg="#ff5a96", }, -- DevIconLibreOfficeFormula xxx ctermfg=204 guifg=#ff5a96
    DevIconNswag                            { fg="#85ea2d", }, -- DevIconNswag   xxx ctermfg=112 guifg=#85ea2d
    DevIconKalgebrarc                       { fg="#1c99f3", }, -- DevIconKalgebrarc xxx ctermfg=32 guifg=#1c99f3
    DevIconNfo                              { fg="#ffffcd", }, -- DevIconNfo     xxx ctermfg=230 guifg=#ffffcd
    DevIconCantorrc                         { fg="#1c99f3", }, -- DevIconCantorrc xxx ctermfg=32 guifg=#1c99f3
    DevIconSharedObject                     { fg="#dcddd6", }, -- DevIconSharedObject xxx ctermfg=253 guifg=#dcddd6
    DevIconIonic                            { fg="#4f8ff7", }, -- DevIconIonic   xxx ctermfg=33 guifg=#4f8ff7
    DevIconIndexTheme                       { fg="#2db96f", }, -- DevIconIndexTheme xxx ctermfg=35 guifg=#2db96f
    DevIconI18nConfig                       { fg="#7986cb", }, -- DevIconI18nConfig xxx ctermfg=104 guifg=#7986cb
    DevIconMojo                             { fg="#ff4c1f", }, -- DevIconMojo    xxx ctermfg=196 guifg=#ff4c1f
    DevIconJsonc                            { fg="#cbcb41", }, -- DevIconJsonc   xxx ctermfg=185 guifg=#cbcb41
    DevIconGulpfile                         { fg="#cc3e44", }, -- DevIconGulpfile xxx ctermfg=167 guifg=#cc3e44
    DevIconClojureC                         { fg="#8dc149", }, -- DevIconClojureC xxx ctermfg=113 guifg=#8dc149
    DevIconClojureJS                        { fg="#519aba", }, -- DevIconClojureJS xxx ctermfg=74 guifg=#519aba
    DevIconGruntfile                        { fg="#e37933", }, -- DevIconGruntfile xxx ctermfg=166 guifg=#e37933
    DevIconCache                            { fg="#ffffff", }, -- DevIconCache   xxx ctermfg=231 guifg=#ffffff
    DevIconGradleWrapperProperties          { fg="#005f87", }, -- DevIconGradleWrapperProperties xxx ctermfg=24 guifg=#005f87
    DevIconLua                              { fg="#51a0cf", }, -- DevIconLua     xxx ctermfg=74 guifg=#51a0cf
    DevIconGradleWrapperScript              { fg="#005f87", }, -- DevIconGradleWrapperScript xxx ctermfg=24 guifg=#005f87
    DevIconCMake                            { fg="#dce3eb", }, -- DevIconCMake   xxx ctermfg=254 guifg=#dce3eb
    DevIconKiCadFootprintTable              { fg="#ffffff", }, -- DevIconKiCadFootprintTable xxx ctermfg=231 guifg=#ffffff
    DevIconConfiguration                    { fg="#6d8086", }, -- DevIconConfiguration xxx ctermfg=66 guifg=#6d8086
    DevIconKiCadCache                       { fg="#ffffff", }, -- DevIconKiCadCache xxx ctermfg=231 guifg=#ffffff
    DevIconFavicon                          { fg="#cbcb41", }, -- DevIconFavicon xxx ctermfg=185 guifg=#cbcb41
    DevIconFs                               { fg="#519aba", }, -- DevIconFs      xxx ctermfg=74 guifg=#519aba
    DevIconHxx                              { fg="#a074c4", }, -- DevIconHxx     xxx ctermfg=140 guifg=#a074c4
    DevIconHpp                              { fg="#a074c4", }, -- DevIconHpp     xxx ctermfg=140 guifg=#a074c4
    DevIconCPlusPlusModule                  { fg="#f34b7d", }, -- DevIconCPlusPlusModule xxx ctermfg=204 guifg=#f34b7d
    DevIconCppm                             { fg="#519aba", }, -- DevIconCppm    xxx ctermfg=74 guifg=#519aba
    DevIconCxxm                             { fg="#519aba", }, -- DevIconCxxm    xxx ctermfg=74 guifg=#519aba
    DevIconZsh                              { fg="#89e051", }, -- DevIconZsh     xxx ctermfg=113 guifg=#89e051
    DevIconCrystal                          { fg="#c8c8c8", }, -- DevIconCrystal xxx ctermfg=251 guifg=#c8c8c8
    DevIconCs                               { fg="#596706", }, -- DevIconCs      xxx ctermfg=58 guifg=#596706
    DevIconCommitlintConfig                 { fg="#2b9689", }, -- DevIconCommitlintConfig xxx ctermfg=30 guifg=#2b9689
    DevIconHTTP                             { fg="#008ec7", }, -- DevIconHTTP    xxx ctermfg=31 guifg=#008ec7
    DevIconVoid                             { fg="#295340", }, -- DevIconVoid    xxx ctermfg=23 guifg=#295340
    DevIconRazorPage                        { fg="#512bd4", }, -- DevIconRazorPage xxx ctermfg=56 guifg=#512bd4
    DevIconCss                              { fg="#42a5f5", }, -- DevIconCss     xxx ctermfg=75 guifg=#42a5f5
    DevIconCsv                              { fg="#89e051", }, -- DevIconCsv     xxx ctermfg=113 guifg=#89e051
    DevIconCodeOfConduct                    { fg="#e41662", }, -- DevIconCodeOfConduct xxx ctermfg=161 guifg=#e41662
    DevIconASM                              { fg="#0071c5", }, -- DevIconASM     xxx ctermfg=25 guifg=#0071c5
    DevIconcudah                            { fg="#a074c4", }, -- DevIconcudah   xxx ctermfg=140 guifg=#a074c4
    DevIconSh                               { fg="#4d5a5e", }, -- DevIconSh      xxx ctermfg=240 guifg=#4d5a5e
    DevIconSignature                        { fg="#e37933", }, -- DevIconSignature xxx ctermfg=166 guifg=#e37933
    DevIconNim                              { fg="#f3d400", }, -- DevIconNim     xxx ctermfg=220 guifg=#f3d400
    DevIconBunLockfile                      { fg="#eadcd1", }, -- DevIconBunLockfile xxx ctermfg=253 guifg=#eadcd1
    DevIconZigObjectNotation                { fg="#f69a1b", }, -- DevIconZigObjectNotation xxx ctermfg=172 guifg=#f69a1b
    DevIconGradleBuildScript                { fg="#005f87", }, -- DevIconGradleBuildScript xxx ctermfg=24 guifg=#005f87
    DevIconNix                              { fg="#7ebae4", }, -- DevIconNix     xxx ctermfg=110 guifg=#7ebae4
    DevIconNorg                             { fg="#4878be", }, -- DevIconNorg    xxx ctermfg=32 guifg=#4878be
    DevIconBSPWM                            { fg="#2f2f2f", }, -- DevIconBSPWM   xxx ctermfg=236 guifg=#2f2f2f
    DevIconMPEGAudioLayerIII                { fg="#00afff", }, -- DevIconMPEGAudioLayerIII xxx ctermfg=39 guifg=#00afff
    DevIconMOV                              { fg="#fd971f", }, -- DevIconMOV     xxx ctermfg=208 guifg=#fd971f
    DevIconTails                            { fg="#56347c", }, -- DevIconTails   xxx ctermfg=54 guifg=#56347c
    DevIconSolus                            { fg="#4b5163", }, -- DevIconSolus   xxx ctermfg=239 guifg=#4b5163
    DevIconSlackware                        { fg="#475fa9", }, -- DevIconSlackware xxx ctermfg=61 guifg=#475fa9
    DevIconAsciinema                        { fg="#fd971f", }, -- DevIconAsciinema xxx ctermfg=208 guifg=#fd971f
    DevIconSabayon                          { fg="#c6c6c6", }, -- DevIconSabayon xxx ctermfg=251 guifg=#c6c6c6
    DevIconRockyLinux                       { fg="#0fb37d", }, -- DevIconRockyLinux xxx ctermfg=36 guifg=#0fb37d
    DevIconObjectFile                       { fg="#9f0500", }, -- DevIconObjectFile xxx ctermfg=124 guifg=#9f0500
    DevIconRedhat                           { fg="#ee0000", }, -- DevIconRedhat  xxx ctermfg=196 guifg=#ee0000
    DevIconEnv                              { fg="#faf743", }, -- DevIconEnv     xxx ctermfg=227 guifg=#faf743
    DevIconRaspberryPiOS                    { fg="#be1848", }, -- DevIconRaspberryPiOS xxx ctermfg=161 guifg=#be1848
    DevIconQubesOS                          { fg="#3774d8", }, -- DevIconQubesOS xxx ctermfg=33 guifg=#3774d8
    DevIconCxx                              { fg="#519aba", }, -- DevIconCxx     xxx ctermfg=74 guifg=#519aba
    DevIconPuppyLinux                       { fg="#a2aeb9", }, -- DevIconPuppyLinux xxx ctermfg=145 guifg=#a2aeb9
    DevIconpostmarketOS                     { fg="#009900", }, -- DevIconpostmarketOS xxx ctermfg=28 guifg=#009900
    DevIconPop_OS                           { fg="#48b9c7", }, -- DevIconPop_OS  xxx ctermfg=73 guifg=#48b9c7
    DevIconParrot                           { fg="#54deff", }, -- DevIconParrot  xxx ctermfg=45 guifg=#54deff
    DevIconParabolaGNULinuxLibre            { fg="#797dac", }, -- DevIconParabolaGNULinuxLibre xxx ctermfg=103 guifg=#797dac
    DevIconSln                              { fg="#854cc7", }, -- DevIconSln     xxx ctermfg=98 guifg=#854cc7
    DevIconopenSUSE                         { fg="#6fb424", }, -- DevIconopenSUSE xxx ctermfg=70 guifg=#6fb424
    DevIconOpenBSD                          { fg="#f2ca30", }, -- DevIconOpenBSD xxx ctermfg=220 guifg=#f2ca30
    DevIconSml                              { fg="#e37933", }, -- DevIconSml     xxx ctermfg=166 guifg=#e37933
    DevIconNobaraLinux                      { fg="#ffffff", }, -- DevIconNobaraLinux xxx ctermfg=231 guifg=#ffffff
    DevIconClojure                          { fg="#8dc149", }, -- DevIconClojure xxx ctermfg=113 guifg=#8dc149
    DevIconGleam                            { fg="#ffaff3", }, -- DevIconGleam   xxx ctermfg=219 guifg=#ffaff3
    DevIconSolidity                         { fg="#519aba", }, -- DevIconSolidity xxx ctermfg=74 guifg=#519aba
    DevIconStyl                             { fg="#8dc149", }, -- DevIconStyl    xxx ctermfg=113 guifg=#8dc149
    DevIconStp                              { fg="#839463", }, -- DevIconStp     xxx ctermfg=101 guifg=#839463
    DevIconLhs                              { fg="#a074c4", }, -- DevIconLhs     xxx ctermfg=140 guifg=#a074c4
    DevIconManjaro                          { fg="#33b959", }, -- DevIconManjaro xxx ctermfg=35 guifg=#33b959
    DevIconMustache                         { fg="#e37933", }, -- DevIconMustache xxx ctermfg=166 guifg=#e37933
    DevIconGodotProject                     { fg="#6d8086", }, -- DevIconGodotProject xxx ctermfg=66 guifg=#6d8086
    DevIconPsManifestfile                   { fg="#6975c4", }, -- DevIconPsManifestfile xxx ctermfg=68 guifg=#6975c4
    DevIconSass                             { fg="#f55385", }, -- DevIconSass    xxx ctermfg=204 guifg=#f55385
    DevIconMageia                           { fg="#2397d4", }, -- DevIconMageia  xxx ctermfg=67 guifg=#2397d4
    DevIconApp                              { fg="#9f0500", }, -- DevIconApp     xxx ctermfg=124 guifg=#9f0500
    DevIconHs                               { fg="#a074c4", }, -- DevIconHs      xxx ctermfg=140 guifg=#a074c4
    DevIconSsa                              { fg="#ffb713", }, -- DevIconSsa     xxx ctermfg=214 guifg=#ffb713
    DevIconGDScript                         { fg="#6d8086", }, -- DevIconGDScript xxx ctermfg=66 guifg=#6d8086
    DevIconLXLE                             { fg="#474747", }, -- DevIconLXLE    xxx ctermfg=238 guifg=#474747
    DevIconGodotTextResource                { fg="#6d8086", }, -- DevIconGodotTextResource xxx ctermfg=66 guifg=#6d8086
    DevIconMotoko                           { fg="#9772fb", }, -- DevIconMotoko  xxx ctermfg=135 guifg=#9772fb
    DevIconSha256                           { fg="#8c86af", }, -- DevIconSha256  xxx ctermfg=103 guifg=#8c86af
    DevIconLuau                             { fg="#00a2ff", }, -- DevIconLuau    xxx ctermfg=75 guifg=#00a2ff
    DevIconLocOS                            { fg="#fab402", }, -- DevIconLocOS   xxx ctermfg=214 guifg=#fab402
    DevIconPrettierIgnore                   { fg="#4285f4", }, -- DevIconPrettierIgnore xxx ctermfg=33 guifg=#4285f4
    DevIconLeap                             { fg="#fbc75d", }, -- DevIconLeap    xxx ctermfg=221 guifg=#fbc75d
    DevIconOrgMode                          { fg="#77aa99", }, -- DevIconOrgMode xxx ctermfg=73 guifg=#77aa99
    DevIconRakefile                         { fg="#701516", }, -- DevIconRakefile xxx ctermfg=52 guifg=#701516
    DevIconIcs                              { fg="#2b2e83", }, -- DevIconIcs     xxx ctermfg=18 guifg=#2b2e83
    DevIconTypoScript                       { fg="#ff8700", }, -- DevIconTypoScript xxx ctermfg=208 guifg=#ff8700
    DevIconKubuntu                          { fg="#007ac2", }, -- DevIconKubuntu xxx ctermfg=32 guifg=#007ac2
    DevIconGentooBuild                      { fg="#4c416e", }, -- DevIconGentooBuild xxx ctermfg=60 guifg=#4c416e
    DevIconTorrent                          { fg="#44cda8", }, -- DevIconTorrent xxx ctermfg=43 guifg=#44cda8
    DevIconDownload                         { fg="#44cda8", }, -- DevIconDownload xxx ctermfg=43 guifg=#44cda8
    DevIconKDEneon                          { fg="#20a6a4", }, -- DevIconKDEneon xxx ctermfg=37 guifg=#20a6a4
    DevIconPyc                              { fg="#ffe291", }, -- DevIconPyc     xxx ctermfg=222 guifg=#ffe291
    DevIconElisp                            { fg="#8172be", }, -- DevIconElisp   xxx ctermfg=97 guifg=#8172be
    DevIconOpenSCAD                         { fg="#f9d72c", }, -- DevIconOpenSCAD xxx ctermfg=220 guifg=#f9d72c
    DevIconKali                             { fg="#2777ff", }, -- DevIconKali    xxx ctermfg=69 guifg=#2777ff
    DevIconVala                             { fg="#7b3db9", }, -- DevIconVala    xxx ctermfg=91 guifg=#7b3db9
    DevIconXsession                         { fg="#e54d18", }, -- DevIconXsession xxx ctermfg=196 guifg=#e54d18
    DevIconBazelBuild                       { fg="#89e051", }, -- DevIconBazelBuild xxx ctermfg=113 guifg=#89e051
    DevIconDconf                            { fg="#ffffff", }, -- DevIconDconf   xxx ctermfg=231 guifg=#ffffff
    DevIconIllumos                          { fg="#ff430f", }, -- DevIconIllumos xxx ctermfg=196 guifg=#ff430f
    DevIconArchcraft                        { fg="#86bba3", }, -- DevIconArchcraft xxx ctermfg=108 guifg=#86bba3
    DevIconDiff                             { fg="#41535b", }, -- DevIconDiff    xxx ctermfg=239 guifg=#41535b
    DevIconTgz                              { fg="#eca517", }, -- DevIconTgz     xxx ctermfg=214 guifg=#eca517
    DevIconHyperbolaGNULinuxLibre           { fg="#c0c0c0", }, -- DevIconHyperbolaGNULinuxLibre xxx ctermfg=250 guifg=#c0c0c0
    DevIconFsx                              { fg="#519aba", }, -- DevIconFsx     xxx ctermfg=74 guifg=#519aba
    DevIconFish                             { fg="#4d5a5e", }, -- DevIconFish    xxx ctermfg=240 guifg=#4d5a5e
    DevIconBlueprint                        { fg="#5796e2", }, -- DevIconBlueprint xxx ctermfg=68 guifg=#5796e2
    DevIconMli                              { fg="#e37933", }, -- DevIconMli     xxx ctermfg=166 guifg=#e37933
    DevIconGuix                             { fg="#ffcc00", }, -- DevIconGuix    xxx ctermfg=220 guifg=#ffcc00
    DevIconScala                            { fg="#cc3e44", }, -- DevIconScala   xxx ctermfg=167 guifg=#cc3e44
    DevIconsbt                              { fg="#cc3e44", }, -- DevIconsbt     xxx ctermfg=167 guifg=#cc3e44
    DevIconAstro                            { fg="#e23f67", }, -- DevIconAstro   xxx ctermfg=197 guifg=#e23f67
    DevIconFennel                           { fg="#fff3d7", }, -- DevIconFennel  xxx ctermfg=230 guifg=#fff3d7
    DevIconAzureCli                         { fg="#0078d4", }, -- DevIconAzureCli xxx ctermfg=32 guifg=#0078d4
    DevIconLib                              { fg="#4d2c0b", }, -- DevIconLib     xxx ctermfg=52 guifg=#4d2c0b
    DevIconVsix                             { fg="#854cc7", }, -- DevIconVsix    xxx ctermfg=98 guifg=#854cc7
    DevIconBicepParameters                  { fg="#9f74b3", }, -- DevIconBicepParameters xxx ctermfg=133 guifg=#9f74b3
    DevIconBicep                            { fg="#519aba", }, -- DevIconBicep   xxx ctermfg=74 guifg=#519aba
    DevIconNixOS                            { fg="#7ab1db", }, -- DevIconNixOS   xxx ctermfg=110 guifg=#7ab1db
    DevIconArch                             { fg="#0f94d2", }, -- DevIconArch    xxx ctermfg=67 guifg=#0f94d2
    DevIconPatch                            { fg="#41535b", }, -- DevIconPatch   xxx ctermfg=239 guifg=#41535b
    DevIconFreeBSD                          { fg="#c90f02", }, -- DevIconFreeBSD xxx ctermfg=160 guifg=#c90f02
    DevIconRake                             { fg="#701516", }, -- DevIconRake    xxx ctermfg=52 guifg=#701516
    DevIconMXLinux                          { fg="#ffffff", }, -- DevIconMXLinux xxx ctermfg=231 guifg=#ffffff
    DevIconGemspec                          { fg="#701516", }, -- DevIconGemspec xxx ctermfg=52 guifg=#701516
    DevIconTxz                              { fg="#eca517", }, -- DevIconTxz     xxx ctermfg=214 guifg=#eca517
    DevIconFedora                           { fg="#072a5e", }, -- DevIconFedora  xxx ctermfg=17 guifg=#072a5e
    DevIconPm                               { fg="#519aba", }, -- DevIconPm      xxx ctermfg=74 guifg=#519aba
    DevIconKotlin                           { fg="#7f52ff", }, -- DevIconKotlin  xxx ctermfg=99 guifg=#7f52ff
    DevIconKotlinScript                     { fg="#7f52ff", }, -- DevIconKotlinScript xxx ctermfg=99 guifg=#7f52ff
    DevIconFsi                              { fg="#519aba", }, -- DevIconFsi     xxx ctermfg=74 guifg=#519aba
    DevIconEndeavour                        { fg="#7b3db9", }, -- DevIconEndeavour xxx ctermfg=91 guifg=#7b3db9
    DevIconSystemVerilog                    { fg="#019833", }, -- DevIconSystemVerilog xxx ctermfg=28 guifg=#019833
    DevIconStaticLibraryArchive             { fg="#dcddd6", }, -- DevIconStaticLibraryArchive xxx ctermfg=253 guifg=#dcddd6
    DevIconTerraform                        { fg="#5f43e9", }, -- DevIconTerraform xxx ctermfg=93 guifg=#5f43e9
    DevIconD                                { fg="#b03931", }, -- DevIconD       xxx ctermfg=124 guifg=#b03931
    DevIconAwk                              { fg="#4d5a5e", }, -- DevIconAwk     xxx ctermfg=240 guifg=#4d5a5e
    DevIconDrools                           { fg="#ffafaf", }, -- DevIconDrools  xxx ctermfg=217 guifg=#ffafaf
    DevIconErb                              { fg="#701516", }, -- DevIconErb     xxx ctermfg=52 guifg=#701516
    DevIconCSharpProject                    { fg="#512bd4", }, -- DevIconCSharpProject xxx ctermfg=56 guifg=#512bd4
    DevIconHrl                              { fg="#b83998", }, -- DevIconHrl     xxx ctermfg=163 guifg=#b83998
    DevIconKiCad                            { fg="#ffffff", }, -- DevIconKiCad   xxx ctermfg=231 guifg=#ffffff
    DevIconDot                              { fg="#30638e", }, -- DevIconDot     xxx ctermfg=24 guifg=#30638e
    DevIconPyw                              { fg="#5aa7e4", }, -- DevIconPyw     xxx ctermfg=39 guifg=#5aa7e4
    DevIconJson5                            { fg="#cbcb41", }, -- DevIconJson5   xxx ctermfg=185 guifg=#cbcb41
    DevIconDoc                              { fg="#185abd", }, -- DevIconDoc     xxx ctermfg=26 guifg=#185abd
    DevIconXul                              { fg="#e37933", }, -- DevIconXul     xxx ctermfg=166 guifg=#e37933
    DevIconDevuan                           { fg="#404a52", }, -- DevIconDevuan  xxx ctermfg=238 guifg=#404a52
    DevIconAsc                              { fg="#576d7f", }, -- DevIconAsc     xxx ctermfg=242 guifg=#576d7f
    DevIconMpp                              { fg="#519aba", }, -- DevIconMpp     xxx ctermfg=74 guifg=#519aba
    DevIconElm                              { fg="#519aba", }, -- DevIconElm     xxx ctermfg=74 guifg=#519aba
    DevIconThunderbird                      { fg="#137be1", }, -- DevIconThunderbird xxx ctermfg=33 guifg=#137be1
    DevIconExs                              { fg="#a074c4", }, -- DevIconExs     xxx ctermfg=140 guifg=#a074c4
    DevIconScss                             { fg="#f55385", }, -- DevIconScss    xxx ctermfg=204 guifg=#f55385
    DevIconNotebook                         { fg="#f57d01", }, -- DevIconNotebook xxx ctermfg=208 guifg=#f57d01
    DevIconLeex                             { fg="#a074c4", }, -- DevIconLeex    xxx ctermfg=140 guifg=#a074c4
    DevIconRmd                              { fg="#519aba", }, -- DevIconRmd     xxx ctermfg=74 guifg=#519aba
    DevIconEex                              { fg="#a074c4", }, -- DevIconEex     xxx ctermfg=140 guifg=#a074c4
    DevIconVimrc                            { fg="#019833", }, -- DevIconVimrc   xxx ctermfg=28 guifg=#019833
    DevIconGvimrc                           { fg="#019833", }, -- DevIconGvimrc  xxx ctermfg=28 guifg=#019833
    DevIconAndroid                          { fg="#34a853", }, -- DevIconAndroid xxx ctermfg=35 guifg=#34a853
    DevIconGitLogo                          { fg="#f14c28", }, -- DevIconGitLogo xxx ctermfg=196 guifg=#f14c28
    DevIconGarudaLinux                      { fg="#2974e1", }, -- DevIconGarudaLinux xxx ctermfg=33 guifg=#2974e1
    DevIconMonkeysAudio                     { fg="#00afff", }, -- DevIconMonkeysAudio xxx ctermfg=39 guifg=#00afff
    DevIconArtix                            { fg="#41b4d7", }, -- DevIconArtix   xxx ctermfg=38 guifg=#41b4d7
    DevIconAudioInterchangeFileFormat       { fg="#00afff", }, -- DevIconAudioInterchangeFileFormat xxx ctermfg=39 guifg=#00afff
    DevIconXInitrc                          { fg="#e54d18", }, -- DevIconXInitrc xxx ctermfg=196 guifg=#e54d18
    DevIconVue                              { fg="#8dc149", }, -- DevIconVue     xxx ctermfg=113 guifg=#8dc149
    DevIconKrita                            { fg="#f245fb", }, -- DevIconKrita   xxx ctermfg=201 guifg=#f245fb
    DevIconGentoo                           { fg="#b1abce", }, -- DevIconGentoo  xxx ctermfg=146 guifg=#b1abce
    DevIconReScriptInterface                { fg="#f55385", }, -- DevIconReScriptInterface xxx ctermfg=204 guifg=#f55385
    DevIconSettingsJson                     { fg="#854cc7", }, -- DevIconSettingsJson xxx ctermfg=98 guifg=#854cc7
    DevIconKDEPlasma                        { fg="#1b89f4", }, -- DevIconKDEPlasma xxx ctermfg=33 guifg=#1b89f4
    DevIcon7z                               { fg="#eca517", }, -- DevIcon7z      xxx ctermfg=214 guifg=#eca517
    DevIcon3gp                              { fg="#fd971f", }, -- DevIcon3gp     xxx ctermfg=208 guifg=#fd971f
    DevIconPrettierConfig                   { fg="#4285f4", }, -- DevIconPrettierConfig xxx ctermfg=33 guifg=#4285f4
    DevIconBat                              { fg="#c1f12e", }, -- DevIconBat     xxx ctermfg=191 guifg=#c1f12e
    DevIconIso                              { fg="#d0bec8", }, -- DevIconIso     xxx ctermfg=181 guifg=#d0bec8
    DevIconPreCommitConfig                  { fg="#f8b424", }, -- DevIconPreCommitConfig xxx ctermfg=214 guifg=#f8b424
    DevIconLXQt                             { fg="#0191d2", }, -- DevIconLXQt    xxx ctermfg=32 guifg=#0191d2
    DevIconWeston                           { fg="#ffbb01", }, -- DevIconWeston  xxx ctermfg=214 guifg=#ffbb01
    DevIconnode                             { fg="#5fa04e", }, -- DevIconnode    xxx ctermfg=71 guifg=#5fa04e
    DevIconXorgConf                         { fg="#e54d18", }, -- DevIconXorgConf xxx ctermfg=196 guifg=#e54d18
    DevIconNuxtConfig                       { fg="#00c58e", }, -- DevIconNuxtConfig xxx ctermfg=42 guifg=#00c58e
    DevIconVercel                           { fg="#ffffff", }, -- DevIconVercel  xxx ctermfg=231 guifg=#ffffff
    DevIconNPMIgnore                        { fg="#e8274b", }, -- DevIconNPMIgnore xxx ctermfg=197 guifg=#e8274b
    DevIconMATE                             { fg="#9bda5c", }, -- DevIconMATE    xxx ctermfg=113 guifg=#9bda5c
    DevIconVLC                              { fg="#ee7a00", }, -- DevIconVLC     xxx ctermfg=208 guifg=#ee7a00
    DevIconImage                            { fg="#d0bec8", }, -- DevIconImage   xxx ctermfg=181 guifg=#d0bec8
    DevIconSrt                              { fg="#ffb713", }, -- DevIconSrt     xxx ctermfg=214 guifg=#ffb713
    DevIconIgs                              { fg="#839463", }, -- DevIconIgs     xxx ctermfg=101 guifg=#839463
    DevIconAss                              { fg="#ffb713", }, -- DevIconAss     xxx ctermfg=214 guifg=#ffb713
    DevIconIges                             { fg="#839463", }, -- DevIconIges    xxx ctermfg=101 guifg=#839463
    DevIconBashrc                           { fg="#89e051", }, -- DevIconBashrc  xxx ctermfg=113 guifg=#89e051
    DevIconIge                              { fg="#839463", }, -- DevIconIge     xxx ctermfg=101 guifg=#839463
    DevIconSway                             { fg="#68751c", }, -- DevIconSway    xxx ctermfg=64 guifg=#68751c
    DevIconIfc                              { fg="#839463", }, -- DevIconIfc     xxx ctermfg=101 guifg=#839463
    DevIconTailwindConfig                   { fg="#20c2e3", }, -- DevIconTailwindConfig xxx ctermfg=45 guifg=#20c2e3
    DevIconFluxbox                          { fg="#555555", }, -- DevIconFluxbox xxx ctermfg=240 guifg=#555555
    DevIconawesome                          { fg="#535d6c", }, -- DevIconawesome xxx ctermfg=59 guifg=#535d6c
    DevIconKiCadSymbolTable                 { fg="#ffffff", }, -- DevIconKiCadSymbolTable xxx ctermfg=231 guifg=#ffffff
    DevIconIcalendar                        { fg="#2b2e83", }, -- DevIconIcalendar xxx ctermfg=18 guifg=#2b2e83
    DevIconIcal                             { fg="#2b2e83", }, -- DevIconIcal    xxx ctermfg=18 guifg=#2b2e83
    DevIconriver                            { fg="#000000", }, -- DevIconriver   xxx ctermfg=16 guifg=#000000
    DevIconSvelteConfig                     { fg="#ff3e00", }, -- DevIconSvelteConfig xxx ctermfg=196 guifg=#ff3e00
    DevIconIxx                              { fg="#519aba", }, -- DevIconIxx     xxx ctermfg=74 guifg=#519aba
    DevIconGradleSettings                   { fg="#005f87", }, -- DevIconGradleSettings xxx ctermfg=24 guifg=#005f87
    DevIconSecurity                         { fg="#bec4c9", }, -- DevIconSecurity xxx ctermfg=251 guifg=#bec4c9
    DevIconBashProfile                      { fg="#89e051", }, -- DevIconBashProfile xxx ctermfg=113 guifg=#89e051
    DevIconArchlabs                         { fg="#503f42", }, -- DevIconArchlabs xxx ctermfg=238 guifg=#503f42
    DevIconGNOME                            { fg="#ffffff", }, -- DevIconGNOME   xxx ctermfg=231 guifg=#ffffff
    DevIconHuff                             { fg="#4242c7", }, -- DevIconHuff    xxx ctermfg=56 guifg=#4242c7
    DevIconGradleProperties                 { fg="#005f87", }, -- DevIconGradleProperties xxx ctermfg=24 guifg=#005f87
    DevIconTrueTypeFont                     { fg="#ececec", }, -- DevIconTrueTypeFont xxx ctermfg=255 guifg=#ececec
    DevIconBazelWorkspace                   { fg="#89e051", }, -- DevIconBazelWorkspace xxx ctermfg=113 guifg=#89e051
    DevIconGo                               { fg="#519aba", }, -- DevIconGo      xxx ctermfg=74 guifg=#519aba
    DevIconLogos                            { fg="#599eff", }, -- DevIconLogos   xxx ctermfg=111 guifg=#599eff
    sym"DevIconPy.typed"                    { fg="#ffbc03", }, -- DevIconPy.typed xxx ctermfg=214 guifg=#ffbc03
    DevIconTypoScriptSetup                  { fg="#ff8700", }, -- DevIconTypoScriptSetup xxx ctermfg=208 guifg=#ff8700
    DevIconXcLocalization                   { fg="#2596be", }, -- DevIconXcLocalization xxx ctermfg=31 guifg=#2596be
    DevIconBash                             { fg="#89e051", }, -- DevIconBash    xxx ctermfg=113 guifg=#89e051
    DevIconCMakeLists                       { fg="#dce3eb", }, -- DevIconCMakeLists xxx ctermfg=254 guifg=#dce3eb
    DevIconTor                              { fg="#519aba", }, -- DevIconTor     xxx ctermfg=74 guifg=#519aba
    DevIconJl                               { fg="#a270ba", }, -- DevIconJl      xxx ctermfg=133 guifg=#a270ba
    DevIconMaven                            { fg="#7a0d21", }, -- DevIconMaven   xxx ctermfg=52 guifg=#7a0d21
    DevIconBabelrc                          { fg="#cbcb41", }, -- DevIconBabelrc xxx ctermfg=185 guifg=#cbcb41
    DevIconGoMod                            { fg="#519aba", }, -- DevIconGoMod   xxx ctermfg=74 guifg=#519aba
    DevIconPlatformio                       { fg="#f6822b", }, -- DevIconPlatformio xxx ctermfg=208 guifg=#f6822b
    DevIconQuery                            { fg="#90a850", }, -- DevIconQuery   xxx ctermfg=107 guifg=#90a850
    DevIconGz                               { fg="#eca517", }, -- DevIconGz      xxx ctermfg=214 guifg=#eca517
    DevIconAlmalinux                        { fg="#ff4649", }, -- DevIconAlmalinux xxx ctermfg=203 guifg=#ff4649
    DevIconPackageLockJson                  { fg="#7a0d21", }, -- DevIconPackageLockJson xxx ctermfg=52 guifg=#7a0d21
    DevIconJson                             { fg="#cbcb41", }, -- DevIconJson    xxx ctermfg=185 guifg=#cbcb41
    DevIconPackageJson                      { fg="#e8274b", }, -- DevIconPackageJson xxx ctermfg=197 guifg=#e8274b
    DevIconXresources                       { fg="#e54d18", }, -- DevIconXresources xxx ctermfg=196 guifg=#e54d18
    DevIconUI                               { fg="#015bf0", }, -- DevIconUI      xxx ctermfg=27 guifg=#015bf0
    DevIconAlpine                           { fg="#0d597f", }, -- DevIconAlpine  xxx ctermfg=24 guifg=#0d597f
    DevIconJsx                              { fg="#20c2e3", }, -- DevIconJsx     xxx ctermfg=45 guifg=#20c2e3
    DevIconKbx                              { fg="#737672", }, -- DevIconKbx     xxx ctermfg=243 guifg=#737672
    DevIconKdb                              { fg="#529b34", }, -- DevIconKdb     xxx ctermfg=71 guifg=#529b34
    DevIconRss                              { fg="#fb9d3b", }, -- DevIconRss     xxx ctermfg=215 guifg=#fb9d3b
    DevIconH                                { fg="#a074c4", }, -- DevIconH       xxx ctermfg=140 guifg=#a074c4
    DevIconEbook                            { fg="#eab16d", }, -- DevIconEbook   xxx ctermfg=215 guifg=#eab16d
    DevIconJs                               { fg="#cbcb41", }, -- DevIconJs      xxx ctermfg=185 guifg=#cbcb41
    DevIconMarkdown                         { fg="#dddddd", }, -- DevIconMarkdown xxx ctermfg=253 guifg=#dddddd
    DevIconSpecTs                           { fg="#519aba", }, -- DevIconSpecTs  xxx ctermfg=74 guifg=#519aba
    DevIconLXQtConfigFile                   { fg="#0192d3", }, -- DevIconLXQtConfigFile xxx ctermfg=32 guifg=#0192d3
    DevIconMagnet                           { fg="#a51b16", }, -- DevIconMagnet  xxx ctermfg=124 guifg=#a51b16
    DevIconC                                { fg="#599eff", }, -- DevIconC       xxx ctermfg=111 guifg=#599eff
    DevIconLXDEConfigFile                   { fg="#909090", }, -- DevIconLXDEConfigFile xxx ctermfg=246 guifg=#909090
    DevIconLess                             { fg="#563d7c", }, -- DevIconLess    xxx ctermfg=54 guifg=#563d7c
    DevIconGCode                            { fg="#1471ad", }, -- DevIconGCode   xxx ctermfg=32 guifg=#1471ad
    DevIconKritarc                          { fg="#f245fb", }, -- DevIconKritarc xxx ctermfg=201 guifg=#f245fb
    DevIconLiquid                           { fg="#95bf47", }, -- DevIconLiquid  xxx ctermfg=106 guifg=#95bf47
    DevIconKritadisplayrc                   { fg="#f245fb", }, -- DevIconKritadisplayrc xxx ctermfg=201 guifg=#f245fb
    DevIconKdenliverc                       { fg="#83b8f2", }, -- DevIconKdenliverc xxx ctermfg=110 guifg=#83b8f2
    DevIconAutoCADDxf                       { fg="#839463", }, -- DevIconAutoCADDxf xxx ctermfg=101 guifg=#839463
    DevIconKdenliveLayoutsrc                { fg="#83b8f2", }, -- DevIconKdenliveLayoutsrc xxx ctermfg=110 guifg=#83b8f2
    DevIconM3u                              { fg="#ed95ae", }, -- DevIconM3u     xxx ctermfg=211 guifg=#ed95ae
    DevIconKDEglobals                       { fg="#1c99f3", }, -- DevIconKDEglobals xxx ctermfg=32 guifg=#1c99f3
    DevIconFIGletFontFormat                 { fg="#ececec", }, -- DevIconFIGletFontFormat xxx ctermfg=255 guifg=#ececec
    DevIconFIGletFontControl                { fg="#ececec", }, -- DevIconFIGletFontControl xxx ctermfg=255 guifg=#ececec
    DevIconMjs                              { fg="#f1e05a", }, -- DevIconMjs     xxx ctermfg=185 guifg=#f1e05a
    DevIconFreeLosslessAudioCodec           { fg="#0075aa", }, -- DevIconFreeLosslessAudioCodec xxx ctermfg=24 guifg=#0075aa
    DevIconFdmdownload                      { fg="#44cda8", }, -- DevIconFdmdownload xxx ctermfg=43 guifg=#44cda8
    DevIconHyprlock                         { fg="#00aaae", }, -- DevIconHyprlock xxx ctermfg=37 guifg=#00aaae
    DevIconFreeCAD                          { fg="#cb333b", }, -- DevIconFreeCAD xxx ctermfg=160 guifg=#cb333b
    DevIconMkv                              { fg="#fd971f", }, -- DevIconMkv     xxx ctermfg=208 guifg=#fd971f
    DevIconVerilog                          { fg="#019833", }, -- DevIconVerilog xxx ctermfg=28 guifg=#019833
    DevIconBazel                            { fg="#89e051", }, -- DevIconBazel   xxx ctermfg=113 guifg=#89e051
    DevIconBlender                          { fg="#ea7600", }, -- DevIconBlender xxx ctermfg=208 guifg=#ea7600
    DevIconEpub                             { fg="#eab16d", }, -- DevIconEpub    xxx ctermfg=215 guifg=#eab16d
    DevIconMp4                              { fg="#fd971f", }, -- DevIconMp4     xxx ctermfg=208 guifg=#fd971f
    DevIconMobi                             { fg="#eab16d", }, -- DevIconMobi    xxx ctermfg=215 guifg=#eab16d
    DevIconFusion360                        { fg="#839463", }, -- DevIconFusion360 xxx ctermfg=101 guifg=#839463
    DevIconObjectiveCPlusPlus               { fg="#519aba", }, -- DevIconObjectiveCPlusPlus xxx ctermfg=74 guifg=#519aba
    DevIconObjectiveC                       { fg="#599eff", }, -- DevIconObjectiveC xxx ctermfg=111 guifg=#599eff
    DevIconNodeModules                      { fg="#e8274b", }, -- DevIconNodeModules xxx ctermfg=197 guifg=#e8274b
    DevIconMailmap                          { fg="#f54d27", }, -- DevIconMailmap xxx ctermfg=196 guifg=#f54d27
    DevIconExe                              { fg="#9f0500", }, -- DevIconExe     xxx ctermfg=124 guifg=#9f0500
    DevIconTxt                              { fg="#89e051", }, -- DevIconTxt     xxx ctermfg=113 guifg=#89e051
    DevIconTFVars                           { fg="#5f43e9", }, -- DevIconTFVars  xxx ctermfg=93 guifg=#5f43e9
    DevIconGitlabCI                         { fg="#e24329", }, -- DevIconGitlabCI xxx ctermfg=196 guifg=#e24329
    DevIconEmbeddedOpenTypeFont             { fg="#ececec", }, -- DevIconEmbeddedOpenTypeFont xxx ctermfg=255 guifg=#ececec
    DevIconMl                               { fg="#e37933", }, -- DevIconMl      xxx ctermfg=166 guifg=#e37933
    DevIconAdaBody                          { fg="#22ffff", }, -- DevIconAdaBody xxx ctermfg=51 guifg=#22ffff
    DevIconPyi                              { fg="#ffbc03", }, -- DevIconPyi     xxx ctermfg=214 guifg=#ffbc03
    DevIconTSConfig                         { fg="#519aba", }, -- DevIconTSConfig xxx ctermfg=74 guifg=#519aba
    DevIconGitBlameIgnore                   { fg="#f54d27", }, -- DevIconGitBlameIgnore xxx ctermfg=196 guifg=#f54d27
    DevIconEslintIgnore                     { fg="#4b32c3", }, -- DevIconEslintIgnore xxx ctermfg=56 guifg=#4b32c3
    DevIconMd5                              { fg="#8c86af", }, -- DevIconMd5     xxx ctermfg=103 guifg=#8c86af
    DevIconLrc                              { fg="#ffb713", }, -- DevIconLrc     xxx ctermfg=214 guifg=#ffb713
    DevIconXSettingsdConf                   { fg="#e54d18", }, -- DevIconXSettingsdConf xxx ctermfg=196 guifg=#e54d18
    DevIconDsStore                          { fg="#41535b", }, -- DevIconDsStore xxx ctermfg=239 guifg=#41535b
    DevIconScheme                           { fg="#eeeeee", }, -- DevIconScheme  xxx ctermfg=255 guifg=#eeeeee
    DevIconCodespell                        { fg="#35da60", }, -- DevIconCodespell xxx ctermfg=41 guifg=#35da60
    DevIconReadme                           { fg="#ededed", }, -- DevIconReadme  xxx ctermfg=255 guifg=#ededed
    DevIconImg                              { fg="#d0bec8", }, -- DevIconImg     xxx ctermfg=181 guifg=#d0bec8
    DevIconM4V                              { fg="#fd971f", }, -- DevIconM4V     xxx ctermfg=208 guifg=#fd971f
    DevIconMPEG4                            { fg="#00afff", }, -- DevIconMPEG4   xxx ctermfg=39 guifg=#00afff
    DevIconAOSC                             { fg="#c00000", }, -- DevIconAOSC    xxx ctermfg=124 guifg=#c00000
    DevIconAutoCADDwg                       { fg="#839463", }, -- DevIconAutoCADDwg xxx ctermfg=101 guifg=#839463
    DevIconAUTHORS                          { fg="#a172ff", }, -- DevIconAUTHORS xxx ctermfg=135 guifg=#a172ff
    DevIconPrusaSlicer                      { fg="#ec6b23", }, -- DevIconPrusaSlicer xxx ctermfg=202 guifg=#ec6b23
    DevIconConfig                           { fg="#6d8086", }, -- DevIconConfig  xxx ctermfg=66 guifg=#6d8086
    DevIconFreeCADConfig                    { fg="#cb333b", }, -- DevIconFreeCADConfig xxx ctermfg=160 guifg=#cb333b
    DevIconXauthority                       { fg="#e54d18", }, -- DevIconXauthority xxx ctermfg=196 guifg=#e54d18
    DevIconSRCINFO                          { fg="#0f94d2", }, -- DevIconSRCINFO xxx ctermfg=67 guifg=#0f94d2
    DevIconPKGBUILD                         { fg="#0f94d2", }, -- DevIconPKGBUILD xxx ctermfg=67 guifg=#0f94d2
    DevIconYml                              { fg="#6d8086", }, -- DevIconYml     xxx ctermfg=66 guifg=#6d8086
    DevIconLinux                            { fg="#fdfdfb", }, -- DevIconLinux   xxx ctermfg=231 guifg=#fdfdfb
    DevIconCue                              { fg="#ed95ae", }, -- DevIconCue     xxx ctermfg=211 guifg=#ed95ae
    DevIconProcfile                         { fg="#a074c4", }, -- DevIconProcfile xxx ctermfg=140 guifg=#a074c4
    DevIconXlsx                             { fg="#207245", }, -- DevIconXlsx    xxx ctermfg=29 guifg=#207245
    DevIconIfb                              { fg="#2b2e83", }, -- DevIconIfb     xxx ctermfg=18 guifg=#2b2e83
    DevIconApple                            { fg="#a2aaad", }, -- DevIconApple   xxx ctermfg=248 guifg=#a2aaad
    DevIconXml                              { fg="#e37933", }, -- DevIconXml     xxx ctermfg=166 guifg=#e37933
    DevIconRb                               { fg="#701516", }, -- DevIconRb      xxx ctermfg=52 guifg=#701516
    DevIconZst                              { fg="#eca517", }, -- DevIconZst     xxx ctermfg=214 guifg=#eca517
    DevIconHh                               { fg="#a074c4", }, -- DevIconHh      xxx ctermfg=140 guifg=#a074c4
    DevIconLibrecadFontFile                 { fg="#ececec", }, -- DevIconLibrecadFontFile xxx ctermfg=255 guifg=#ececec
    DevIconNano                             { fg="#440077", }, -- DevIconNano    xxx ctermfg=54 guifg=#440077
    DevIconBlade                            { fg="#f05340", }, -- DevIconBlade   xxx ctermfg=203 guifg=#f05340
    DevIconUbuntu                           { fg="#dd4814", }, -- DevIconUbuntu  xxx ctermfg=196 guifg=#dd4814
    DevIconZip                              { fg="#eca517", }, -- DevIconZip     xxx ctermfg=214 guifg=#eca517
    DevIconWindows                          { fg="#00a4ef", }, -- DevIconWindows xxx ctermfg=39 guifg=#00a4ef
    DevIconapk                              { fg="#34a853", }, -- DevIconapk     xxx ctermfg=35 guifg=#34a853
    DevIconR                                { fg="#2266ba", }, -- DevIconR       xxx ctermfg=25 guifg=#2266ba
    DevIconSql                              { fg="#dad8d8", }, -- DevIconSql     xxx ctermfg=188 guifg=#dad8d8
    DevIconXz                               { fg="#eca517", }, -- DevIconXz      xxx ctermfg=214 guifg=#eca517
    DevIconZig                              { fg="#f69a1b", }, -- DevIconZig     xxx ctermfg=172 guifg=#f69a1b
    DevIconPyd                              { fg="#ffe291", }, -- DevIconPyd     xxx ctermfg=222 guifg=#ffe291
    DevIconRs                               { fg="#dea584", }, -- DevIconRs      xxx ctermfg=216 guifg=#dea584
    DevIconXpi                              { fg="#ff1b01", }, -- DevIconXpi     xxx ctermfg=196 guifg=#ff1b01
    DevIconLinuxKernelObject                { fg="#dcddd6", }, -- DevIconLinuxKernelObject xxx ctermfg=253 guifg=#dcddd6
    DevIconAdvancedAudioCoding              { fg="#00afff", }, -- DevIconAdvancedAudioCoding xxx ctermfg=39 guifg=#00afff
    DevIconRlib                             { fg="#dea584", }, -- DevIconRlib    xxx ctermfg=216 guifg=#dea584
    DevIconSub                              { fg="#ffb713", }, -- DevIconSub     xxx ctermfg=214 guifg=#ffb713
    DevIconKdenlive                         { fg="#83b8f2", }, -- DevIconKdenlive xxx ctermfg=110 guifg=#83b8f2
    DevIconDump                             { fg="#dad8d8", }, -- DevIconDump    xxx ctermfg=188 guifg=#dad8d8
    DevIconGIMP                             { fg="#635b46", }, -- DevIconGIMP    xxx ctermfg=240 guifg=#635b46
    DevIconKdbx                             { fg="#529b34", }, -- DevIconKdbx    xxx ctermfg=71 guifg=#529b34
    DevIconXaml                             { fg="#512bd4", }, -- DevIconXaml    xxx ctermfg=56 guifg=#512bd4
    DevIconElementary                       { fg="#5890c2", }, -- DevIconElementary xxx ctermfg=67 guifg=#5890c2
    DevIconSuo                              { fg="#854cc7", }, -- DevIconSuo     xxx ctermfg=98 guifg=#854cc7
    DevIconCrdownload                       { fg="#44cda8", }, -- DevIconCrdownload xxx ctermfg=43 guifg=#44cda8
    DevIconDeepin                           { fg="#2ca7f8", }, -- DevIconDeepin  xxx ctermfg=39 guifg=#2ca7f8
    DevIconGPRBuildProject                  { fg="#ff33ff", }, -- DevIconGPRBuildProject xxx ctermfg=201 guifg=#ff33ff
    DevIconDebian                           { fg="#a80030", }, -- DevIconDebian  xxx ctermfg=88 guifg=#a80030
    DevIconSvelte                           { fg="#ff3e00", }, -- DevIconSvelte  xxx ctermfg=196 guifg=#ff3e00
    DevIconInfo                             { fg="#ffffcd", }, -- DevIconInfo    xxx ctermfg=230 guifg=#ffffcd
    DevIconWavPackCorrection                { fg="#00afff", }, -- DevIconWavPackCorrection xxx ctermfg=39 guifg=#00afff
    DevIconFortran                          { fg="#734f96", }, -- DevIconFortran xxx ctermfg=97 guifg=#734f96
    DevIconCrystalLinux                     { fg="#a900ff", }, -- DevIconCrystalLinux xxx ctermfg=129 guifg=#a900ff
    DevIconGv                               { fg="#30638e", }, -- DevIconGv      xxx ctermfg=24 guifg=#30638e
    DevIconWavPack                          { fg="#00afff", }, -- DevIconWavPack xxx ctermfg=39 guifg=#00afff
    DevIconTypoScriptConfig                 { fg="#ff8700", }, -- DevIconTypoScriptConfig xxx ctermfg=208 guifg=#ff8700
    DevIconVRML                             { fg="#888888", }, -- DevIconVRML    xxx ctermfg=102 guifg=#888888
    DevIconCentos                           { fg="#a2518d", }, -- DevIconCentos  xxx ctermfg=132 guifg=#a2518d
    DevIconIni                              { fg="#6d8086", }, -- DevIconIni     xxx ctermfg=66 guifg=#6d8086
    DevIconLog                              { fg="#dddddd", }, -- DevIconLog     xxx ctermfg=253 guifg=#dddddd
    DevIconWebOpenFontFormat                { fg="#ececec", }, -- DevIconWebOpenFontFormat xxx ctermfg=255 guifg=#ececec
    DevIconBigLinux                         { fg="#189fc8", }, -- DevIconBigLinux xxx ctermfg=38 guifg=#189fc8
    DevIconRobotsTxt                        { fg="#5d7096", }, -- DevIconRobotsTxt xxx ctermfg=60 guifg=#5d7096
    DevIconHyprpaper                        { fg="#00aaae", }, -- DevIconHyprpaper xxx ctermfg=37 guifg=#00aaae
    GitSignsStagedAdd                       { fg="#597b60", }, -- GitSignsStagedAdd xxx guifg=#597b60
    GitSignsStagedChange                    { fg="#467c7b", }, -- GitSignsStagedChange xxx guifg=#467c7b
    GitSignsStagedDelete                    { fg="#7f605c", }, -- GitSignsStagedDelete xxx guifg=#7f605c
    GitSignsStagedChangedelete              { fg="#467c7b", }, -- GitSignsStagedChangedelete xxx guifg=#467c7b
    GitSignsStagedTopdelete                 { fg="#7f605c", }, -- GitSignsStagedTopdelete xxx guifg=#7f605c
    GitSignsStagedAddNr                     { fg="#597b60", }, -- GitSignsStagedAddNr xxx guifg=#597b60
    GitSignsStagedChangeNr                  { fg="#467c7b", }, -- GitSignsStagedChangeNr xxx guifg=#467c7b
    GitSignsStagedDeleteNr                  { fg="#7f605c", }, -- GitSignsStagedDeleteNr xxx guifg=#7f605c
    GitSignsStagedChangedeleteNr            { fg="#467c7b", }, -- GitSignsStagedChangedeleteNr xxx guifg=#467c7b
    GitSignsStagedTopdeleteNr               { fg="#7f605c", }, -- GitSignsStagedTopdeleteNr xxx guifg=#7f605c
    GitSignsStagedAddLn                     { fg="#394427", }, -- GitSignsStagedAddLn xxx guifg=#394427
    GitSignsStagedChangeLn                  { fg="#7f5512", }, -- GitSignsStagedChangeLn xxx guifg=#7f5512
    GitSignsStagedChangedeleteLn            { fg="#7f5512", }, -- GitSignsStagedChangedeleteLn xxx guifg=#7f5512
    GitSignsStagedAddCul                    { fg="#597b60", }, -- GitSignsStagedAddCul xxx guifg=#597b60
    GitSignsStagedChangeCul                 { fg="#467c7b", }, -- GitSignsStagedChangeCul xxx guifg=#467c7b
    GitSignsStagedDeleteCul                 { fg="#7f605c", }, -- GitSignsStagedDeleteCul xxx guifg=#7f605c
    GitSignsStagedChangedeleteCul           { fg="#467c7b", }, -- GitSignsStagedChangedeleteCul xxx guifg=#467c7b
    GitSignsStagedTopdeleteCul              { fg="#7f605c", }, -- GitSignsStagedTopdeleteCul xxx guifg=#7f605c
    BufferDefaultCurrent                    { bg="#6b737b", fg="#efefef", }, -- BufferDefaultCurrent xxx ctermfg=255 guifg=#efefef guibg=#6b737b
    BufferCurrent                           { BufferDefaultCurrent }, -- BufferCurrent  xxx links to BufferDefaultCurrent
    BufferDefaultCurrentADDED               { bg="#6b737b", fg="#b3f6c0", }, -- BufferDefaultCurrentADDED xxx ctermfg=10 guifg=#b3f6c0 guibg=#6b737b
    BufferCurrentADDED                      { BufferDefaultCurrentADDED }, -- BufferCurrentADDED xxx links to BufferDefaultCurrentADDED
    BufferDefaultCurrentCHANGED             { bg="#6b737b", fg="#8cf8f7", }, -- BufferDefaultCurrentCHANGED xxx ctermfg=14 guifg=#8cf8f7 guibg=#6b737b
    BufferCurrentCHANGED                    { BufferDefaultCurrentCHANGED }, -- BufferCurrentCHANGED xxx links to BufferDefaultCurrentCHANGED
    BufferDefaultCurrentDELETED             { bg="#6b737b", fg="#ffc0b9", }, -- BufferDefaultCurrentDELETED xxx ctermfg=9 guifg=#ffc0b9 guibg=#6b737b
    BufferCurrentDELETED                    { BufferDefaultCurrentDELETED }, -- BufferCurrentDELETED xxx links to BufferDefaultCurrentDELETED
    BufferDefaultCurrentERROR               { bg="#6b737b", fg="#ffc0b9", }, -- BufferDefaultCurrentERROR xxx ctermfg=9 guifg=#ffc0b9 guibg=#6b737b
    BufferCurrentERROR                      { BufferDefaultCurrentERROR }, -- BufferCurrentERROR xxx links to BufferDefaultCurrentERROR
    BufferDefaultCurrentHINT                { bg="#6b737b", fg="#a6dbff", }, -- BufferDefaultCurrentHINT xxx ctermfg=12 guifg=#a6dbff guibg=#6b737b
    BufferCurrentHINT                       { BufferDefaultCurrentHINT }, -- BufferCurrentHINT xxx links to BufferDefaultCurrentHINT
    BufferDefaultCurrentIndex               { bg="#6b737b", fg="#cd7832", }, -- BufferDefaultCurrentIndex xxx ctermfg=75 guifg=#cd7832 guibg=#6b737b
    BufferCurrentIndex                      { BufferDefaultCurrentIndex }, -- BufferCurrentIndex xxx links to BufferDefaultCurrentIndex
    BufferDefaultCurrentINFO                { bg="#6b737b", fg="#8cf8f7", }, -- BufferDefaultCurrentINFO xxx ctermfg=14 guifg=#8cf8f7 guibg=#6b737b
    BufferCurrentINFO                       { BufferDefaultCurrentINFO }, -- BufferCurrentINFO xxx links to BufferDefaultCurrentINFO
    BufferDefaultCurrentMod                 { bg="#6b737b", fg="#e74946", }, -- BufferDefaultCurrentMod xxx ctermfg=178 guifg=#e74946 guibg=#6b737b
    BufferCurrentMod                        { BufferDefaultCurrentMod }, -- BufferCurrentMod xxx links to BufferDefaultCurrentMod
    BufferDefaultCurrentSign                { bg="#6b737b", fg="#cd7832", }, -- BufferDefaultCurrentSign xxx ctermfg=75 guifg=#cd7832 guibg=#6b737b
    BufferCurrentSign                       { BufferDefaultCurrentSign }, -- BufferCurrentSign xxx links to BufferDefaultCurrentSign
    BufferDefaultCurrentTarget              { gui="bold", bg="#6b737b", fg="red", }, -- BufferDefaultCurrentTarget xxx cterm=bold ctermfg=9 gui=bold guifg=Red guibg=#6b737b
    BufferCurrentTarget                     { BufferDefaultCurrentTarget }, -- BufferCurrentTarget xxx links to BufferDefaultCurrentTarget
    BufferDefaultCurrentWARN                { bg="#6b737b", fg="#fce094", }, -- BufferDefaultCurrentWARN xxx ctermfg=11 guifg=#fce094 guibg=#6b737b
    BufferCurrentWARN                       { BufferDefaultCurrentWARN }, -- BufferCurrentWARN xxx links to BufferDefaultCurrentWARN
    BufferDefaultInactive                   { bg="#49494b", fg="#efefef", }, -- BufferDefaultInactive xxx ctermfg=255 guifg=#efefef guibg=#49494b
    BufferInactive                          { BufferDefaultInactive }, -- BufferInactive xxx links to BufferDefaultInactive
    BufferDefaultInactiveADDED              { bg="#49494b", fg="#b3f6c0", }, -- BufferDefaultInactiveADDED xxx ctermfg=10 guifg=#b3f6c0 guibg=#49494b
    BufferInactiveADDED                     { BufferDefaultInactiveADDED }, -- BufferInactiveADDED xxx links to BufferDefaultInactiveADDED
    BufferDefaultInactiveCHANGED            { bg="#49494b", fg="#8cf8f7", }, -- BufferDefaultInactiveCHANGED xxx ctermfg=14 guifg=#8cf8f7 guibg=#49494b
    BufferInactiveCHANGED                   { BufferDefaultInactiveCHANGED }, -- BufferInactiveCHANGED xxx links to BufferDefaultInactiveCHANGED
    BufferDefaultInactiveDELETED            { bg="#49494b", fg="#ffc0b9", }, -- BufferDefaultInactiveDELETED xxx ctermfg=9 guifg=#ffc0b9 guibg=#49494b
    BufferInactiveDELETED                   { BufferDefaultInactiveDELETED }, -- BufferInactiveDELETED xxx links to BufferDefaultInactiveDELETED
    BufferDefaultInactiveERROR              { bg="#49494b", fg="#ffc0b9", }, -- BufferDefaultInactiveERROR xxx ctermfg=9 guifg=#ffc0b9 guibg=#49494b
    BufferInactiveERROR                     { BufferDefaultInactiveERROR }, -- BufferInactiveERROR xxx links to BufferDefaultInactiveERROR
    BufferDefaultInactiveHINT               { bg="#49494b", fg="#a6dbff", }, -- BufferDefaultInactiveHINT xxx ctermfg=12 guifg=#a6dbff guibg=#49494b
    BufferInactiveHINT                      { BufferDefaultInactiveHINT }, -- BufferInactiveHINT xxx links to BufferDefaultInactiveHINT
    BufferDefaultInactiveIndex              { bg="#49494b", fg="#2f3032", }, -- BufferDefaultInactiveIndex xxx ctermfg=240 guifg=#2f3032 guibg=#49494b
    BufferInactiveIndex                     { BufferDefaultInactiveIndex }, -- BufferInactiveIndex xxx links to BufferDefaultInactiveIndex
    BufferDefaultInactiveINFO               { bg="#49494b", fg="#8cf8f7", }, -- BufferDefaultInactiveINFO xxx ctermfg=14 guifg=#8cf8f7 guibg=#49494b
    BufferInactiveINFO                      { BufferDefaultInactiveINFO }, -- BufferInactiveINFO xxx links to BufferDefaultInactiveINFO
    BufferDefaultInactiveMod                { bg="#49494b", fg="#e74946", }, -- BufferDefaultInactiveMod xxx ctermfg=178 guifg=#e74946 guibg=#49494b
    BufferInactiveMod                       { BufferDefaultInactiveMod }, -- BufferInactiveMod xxx links to BufferDefaultInactiveMod
    BufferDefaultInactiveSign               { bg="#49494b", fg="#2f3032", }, -- BufferDefaultInactiveSign xxx ctermfg=240 guifg=#2f3032 guibg=#49494b
    BufferInactiveSign                      { BufferDefaultInactiveSign }, -- BufferInactiveSign xxx links to BufferDefaultInactiveSign
    BufferDefaultInactiveTarget             { gui="bold", bg="#49494b", fg="red", }, -- BufferDefaultInactiveTarget xxx cterm=bold ctermfg=9 gui=bold guifg=Red guibg=#49494b
    BufferInactiveTarget                    { BufferDefaultInactiveTarget }, -- BufferInactiveTarget xxx links to BufferDefaultInactiveTarget
    BufferDefaultInactiveWARN               { bg="#49494b", fg="#fce094", }, -- BufferDefaultInactiveWARN xxx ctermfg=11 guifg=#fce094 guibg=#49494b
    BufferInactiveWARN                      { BufferDefaultInactiveWARN }, -- BufferInactiveWARN xxx links to BufferDefaultInactiveWARN
    BufferDefaultTabpagesSep                { gui="bold", bg="#303031", fg="#cd7832", }, -- BufferDefaultTabpagesSep xxx cterm=bold ctermfg=255 gui=bold guifg=#cd7832 guibg=#303031
    BufferScrollArrow                       { BufferDefaultTabpagesSep }, -- BufferScrollArrow xxx links to BufferDefaultTabpagesSep
    BufferTabpagesSep                       { BufferDefaultTabpagesSep }, -- BufferTabpagesSep xxx links to BufferDefaultTabpagesSep
    BufferDefaultTabpageFill                { bg="#303031", fg="#888888", }, -- BufferDefaultTabpageFill xxx ctermfg=102 guifg=#888888 guibg=#303031
    BufferTabpageFill                       { BufferDefaultTabpageFill }, -- BufferTabpageFill xxx links to BufferDefaultTabpageFill
    BufferDefaultTabpages                   { gui="bold", bg="#303031", fg="#68a0ee", }, -- BufferDefaultTabpages xxx cterm=bold ctermfg=75 gui=bold guifg=#68a0ee guibg=#303031
    BufferTabpages                          { BufferDefaultTabpages }, -- BufferTabpages xxx links to BufferDefaultTabpages
    BufferDefaultVisible                    { bg="#49494b", fg="#efefef", }, -- BufferDefaultVisible xxx ctermfg=255 guifg=#efefef guibg=#49494b
    BufferVisible                           { BufferDefaultVisible }, -- BufferVisible  xxx links to BufferDefaultVisible
    BufferDefaultVisibleADDED               { bg="#49494b", fg="#fce094", }, -- BufferDefaultVisibleADDED xxx ctermfg=11 guifg=#fce094 guibg=#49494b
    BufferVisibleADDED                      { BufferDefaultVisibleADDED }, -- BufferVisibleADDED xxx links to BufferDefaultVisibleADDED
    BufferDefaultVisibleCHANGED             { bg="#49494b", fg="#fce094", }, -- BufferDefaultVisibleCHANGED xxx ctermfg=11 guifg=#fce094 guibg=#49494b
    BufferVisibleCHANGED                    { BufferDefaultVisibleCHANGED }, -- BufferVisibleCHANGED xxx links to BufferDefaultVisibleCHANGED
    BufferDefaultVisibleDELETED             { bg="#49494b", fg="#fce094", }, -- BufferDefaultVisibleDELETED xxx ctermfg=11 guifg=#fce094 guibg=#49494b
    BufferVisibleDELETED                    { BufferDefaultVisibleDELETED }, -- BufferVisibleDELETED xxx links to BufferDefaultVisibleDELETED
    BufferDefaultVisibleERROR               { bg="#49494b", fg="#ffc0b9", }, -- BufferDefaultVisibleERROR xxx ctermfg=9 guifg=#ffc0b9 guibg=#49494b
    BufferVisibleERROR                      { BufferDefaultVisibleERROR }, -- BufferVisibleERROR xxx links to BufferDefaultVisibleERROR
    BufferDefaultVisibleHINT                { bg="#49494b", fg="#a6dbff", }, -- BufferDefaultVisibleHINT xxx ctermfg=12 guifg=#a6dbff guibg=#49494b
    BufferVisibleHINT                       { BufferDefaultVisibleHINT }, -- BufferVisibleHINT xxx links to BufferDefaultVisibleHINT
    BufferDefaultVisibleIndex               { bg="#49494b", fg="#efefef", }, -- BufferDefaultVisibleIndex xxx ctermfg=255 guifg=#efefef guibg=#49494b
    BufferVisibleIndex                      { BufferDefaultVisibleIndex }, -- BufferVisibleIndex xxx links to BufferDefaultVisibleIndex
    BufferDefaultVisibleINFO                { bg="#49494b", fg="#8cf8f7", }, -- BufferDefaultVisibleINFO xxx ctermfg=14 guifg=#8cf8f7 guibg=#49494b
    BufferVisibleINFO                       { BufferDefaultVisibleINFO }, -- BufferVisibleINFO xxx links to BufferDefaultVisibleINFO
    BufferDefaultVisibleMod                 { bg="#49494b", fg="#e74946", }, -- BufferDefaultVisibleMod xxx ctermfg=178 guifg=#e74946 guibg=#49494b
    BufferVisibleMod                        { BufferDefaultVisibleMod }, -- BufferVisibleMod xxx links to BufferDefaultVisibleMod
    BufferDefaultVisibleSign                { bg="#49494b", fg="#efefef", }, -- BufferDefaultVisibleSign xxx ctermfg=255 guifg=#efefef guibg=#49494b
    BufferVisibleSign                       { BufferDefaultVisibleSign }, -- BufferVisibleSign xxx links to BufferDefaultVisibleSign
    BufferDefaultVisibleTarget              { gui="bold", bg="#49494b", fg="red", }, -- BufferDefaultVisibleTarget xxx cterm=bold ctermfg=9 gui=bold guifg=Red guibg=#49494b
    BufferVisibleTarget                     { BufferDefaultVisibleTarget }, -- BufferVisibleTarget xxx links to BufferDefaultVisibleTarget
    BufferDefaultVisibleWARN                { bg="#49494b", fg="#fce094", }, -- BufferDefaultVisibleWARN xxx ctermfg=11 guifg=#fce094 guibg=#49494b
    BufferVisibleWARN                       { BufferDefaultVisibleWARN }, -- BufferVisibleWARN xxx links to BufferDefaultVisibleWARN
    DevIconLuaCurrent                       { bg="#6b737b", fg="#51a0cf", }, -- DevIconLuaCurrent xxx ctermfg=74 guifg=#51a0cf guibg=#6b737b
    DevIconGoInactive                       { bg="#49494b", fg="#519aba", }, -- DevIconGoInactive xxx ctermfg=74 guifg=#519aba guibg=#49494b
    DevIconLuaInactive                      { bg="#49494b", fg="#51a0cf", }, -- DevIconLuaInactive xxx ctermfg=74 guifg=#51a0cf guibg=#49494b
    MiniCursorword                          { gui="underline", }, -- MiniCursorword xxx cterm=underline gui=underline
    MiniCursorwordCurrent                   { MiniCursorword }, -- MiniCursorwordCurrent xxx links to MiniCursorword
    DevIconLuaVisible                       { bg="#49494b", fg="#51a0cf", }, -- DevIconLuaVisible xxx ctermfg=74 guifg=#51a0cf guibg=#49494b
    DevIconGoCurrent                        { bg="#6b737b", fg="#519aba", }, -- DevIconGoCurrent xxx ctermfg=74 guifg=#519aba guibg=#6b737b
  }
end)
return theme
