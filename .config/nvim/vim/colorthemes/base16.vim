lua <<EOF
vim.o.termguicolors = false
EOF

set t_u8=
set t_RV=
let &t_ZH="\e[4m"
let &t_ZR="\e[33m"

set background=dark

if exists('syntax_on')
    syntax reset
endif

hi Normal ctermbg=NONE ctermfg=15
hi NonText ctermbg=NONE ctermfg=0
hi Conceal ctermbg=NONE
hi Error ctermbg=1 ctermfg=7
hi Identifier ctermbg=NONE ctermfg=4 cterm=BOLD
hi Ignore ctermbg=8 ctermfg=0
hi PreProc ctermbg=NONE ctermfg=3
hi Statement ctermbg=NONE ctermfg=2
hi Todo ctermbg=2 ctermfg=0
hi Type ctermbg=NONE ctermfg=3
hi Underlined ctermbg=NONE ctermfg=2 cterm=underline
hi TabLine ctermbg=NONE ctermfg=8
hi TabLineFill ctermbg=NONE ctermfg=8
hi TabLineSel ctermbg=4 ctermfg=0
hi TermCursorNC ctermbg=3 ctermfg=0
hi VertSplit ctermbg=8 ctermfg=0
hi Title ctermbg=NONE ctermfg=4
hi CursorLine ctermbg=2 ctermfg=0
hi CursorLineNr ctermbg=NONE ctermfg=8
hi helpLeadBlank ctermbg=NONE ctermfg=7
hi helpNormal ctermbg=NONE ctermfg=7
hi Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse
hi VisualNOS ctermbg=NONE ctermfg=2
hi Pmenu ctermbg=8 ctermfg=7
hi PmenuSbar ctermbg=6 ctermfg=7
hi PmenuSel ctermbg=4 ctermfg=0
hi PmenuThumb ctermbg=8 ctermfg=8
hi FoldColumn ctermbg=NONE ctermfg=7
hi Folded ctermbg=NONE ctermfg=8
hi WildMenu ctermbg=2 ctermfg=0
hi SpecialKey ctermbg=NONE ctermfg=8
hi DiffAdd ctermbg=NONE ctermfg=2
hi DiffChange ctermbg=NONE ctermfg=8
hi DiffDelete ctermbg=NONE ctermfg=2
hi DiffText ctermbg=NONE ctermfg=4
hi Directory ctermbg=NONE ctermfg=4
hi ColorColumn ctermbg=4 ctermfg=0
hi signColumn ctermbg=NONE ctermfg=4
hi ErrorMsg ctermbg=NONE ctermfg=8
hi ModeMsg ctermbg=NONE ctermfg=2
hi MoreMsg ctermbg=NONE ctermfg=2
hi Question ctermbg=NONE ctermfg=4
hi WarningMsg ctermbg=2 ctermfg=0
hi Cursor ctermbg=NONE ctermfg=8
hi Structure ctermbg=NONE ctermfg=5
hi CursorColumn ctermbg=8 ctermfg=7
hi ModeMsg ctermbg=NONE ctermfg=7
hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline
hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline
hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline
hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline
hi Boolean ctermbg=NONE ctermfg=5
hi Character ctermbg=NONE ctermfg=2
hi Conditional ctermbg=NONE ctermfg=5
hi Define ctermbg=NONE ctermfg=5
hi Include ctermbg=NONE ctermfg=4
hi Label ctermbg=NONE ctermfg=3
hi Repeat ctermbg=NONE ctermfg=3
hi SpecialChar ctermbg=NONE ctermfg=5
hi Tag ctermbg=NONE ctermfg=3
hi Typedef ctermbg=NONE ctermfg=3
hi vimUserCommand ctermbg=NONE ctermfg=2 cterm=BOLD
    hi link vimMap vimUserCommand
    hi link vimLet vimUserCommand
    hi link vimCommand vimUserCommand
    hi link vimFTCmd vimUserCommand
    hi link vimAutoCmd vimUserCommand
    hi link vimNotFunc vimUserCommand
hi vimNotation ctermbg=NONE ctermfg=4
hi vimMapModKey ctermbg=NONE ctermfg=4
hi vimBracket ctermbg=NONE ctermfg=7
hi vimCommentString ctermbg=NONE ctermfg=8
hi htmlLink ctermbg=NONE ctermfg=2 cterm=underline
hi htmlBold ctermbg=NONE ctermfg=3 cterm=BOLD
hi htmlItalic ctermbg=NONE ctermfg=5
hi htmlEndTag ctermbg=NONE ctermfg=7
hi htmlTag ctermbg=NONE ctermfg=7
hi htmlTagName ctermbg=NONE ctermfg=2 cterm=BOLD
hi htmlH1 ctermbg=NONE ctermfg=7
    hi link htmlH2 htmlH1
    hi link htmlH3 htmlH1
    hi link htmlH4 htmlH1
    hi link htmlH5 htmlH1
    hi link htmlH6 htmlH1
hi markdownH1 ctermbg=NONE ctermfg=7
    hi link markdownH2 markdownH1
    hi link markdownH3 markdownH1
    hi link markdownH4 markdownH1
    hi link markdownH5 markdownH1
    hi link markdownH6 markdownH1
hi markdownAutomaticLink ctermbg=NONE ctermfg=2 cterm=underline
    hi link markdownUrl markdownAutomaticLink
hi markdownError ctermbg=NONE ctermfg=7
hi markdownCode ctermbg=NONE ctermfg=3
hi markdownCodeBlock ctermbg=NONE ctermfg=3
hi markdownCodeDelimiter ctermbg=NONE ctermfg=5
hi markdownItalic cterm=Italic
hi markdownBold cterm=Bold
hi xdefaultsValue ctermbg=NONE ctermfg=7
hi pythonOperator ctermbg=NONE ctermfg=5
hi pythonFunction ctermbg=NONE ctermfg=4
hi pythonRepeat ctermbg=NONE ctermfg=5
hi pythonStatement ctermbg=NONE ctermfg=3 cterm=Bold
hi pythonBuiltIn ctermbg=NONE ctermfg=4
hi phpMemberSelector ctermbg=NONE ctermfg=7
hi phpComparison ctermbg=NONE ctermfg=7
hi phpParent ctermbg=NONE ctermfg=7
hi cOperator ctermbg=NONE ctermfg=6
hi cPreCondit ctermbg=NONE ctermfg=5
hi SignifySignAdd ctermbg=NONE ctermfg=2
hi SignifySignChange ctermbg=NONE ctermfg=4
hi SignifySignDelete ctermbg=NONE ctermfg=3


highlight clear CursorLine
hi CursorLine ctermbg=0 cterm=none
hi CursorLineNR ctermbg=none ctermfg=15 cterm=bold
hi LineNr ctermfg=8 cterm=none

hi Visual cterm=none ctermbg=15 ctermfg=0
hi ExtraWhitespace cterm=none ctermbg=grey ctermfg=black
hi MatchParen cterm=none ctermbg=2 ctermfg=black

highlight NonText cterm=none ctermfg=8 ctermbg=none

hi WinSeparator cterm=none ctermbg=0 ctermfg=0
hi ColorColumn cterm=none ctermfg=none ctermbg=0

hi StatusLine cterm=bold ctermbg=0 ctermfg=none
hi StatusLineNC cterm=none ctermbg=0 ctermfg=8

hi GitGutterAddLineNr ctermfg=black ctermbg=2 cterm=bold
hi GitGutterChangeLineNr ctermfg=black ctermbg=grey cterm=bold
hi GitGutterDeleteLineNr ctermfg=black ctermbg=grey cterm=standout
hi GitGutterChangeDeleteLineNr ctermfg=black ctermbg=8 cterm=standout


hi HopNextKey cterm=bold ctermfg=1
hi HopNextKey1 cterm=bold ctermfg=4
hi HopNextKey2 cterm=bold ctermfg=7

hi IncSearch ctermbg=7 ctermfg=0
hi CurSearch ctermbg=2 ctermfg=0
hi Search ctermbg=16 ctermfg=none cterm=bold

hi NormalFloat cterm=bold ctermbg=0 ctermfg=15
hi PmenuSel cterm=bold ctermbg=2 ctermfg=0

hi DevIconDefault ctermfg=1
hi DevIconPy ctermfg=4
hi DevIconPyc ctermfg=4
hi DevIconPyd ctermfg=4
hi DevIconPyi ctermfg=4
hi DevIconPyo ctermfg=4
hi DevIconPyx ctermfg=4
hi DevIconDockerfile ctermfg=3

" Diagnostic
hi DiagnosticHint ctermfg=1
hi DiagnosticWarn ctermfg=1

hi CopilotSuggestion ctermfg=17


" Code Hightlighting + Treesitter
hi Comment cterm=italic gui=italic ctermfg=8 ctermbg=none
hi Constant ctermbg=NONE ctermfg=6
hi Float ctermfg=1
hi Number ctermfg=1
hi String ctermbg=NONE ctermfg=3
hi @boolean.python ctermfg=3
hi Operator ctermfg=2
hi Special ctermfg=5
hi Keyword ctermfg=4
hi Delimiter ctermfg=2
hi Function ctermfg=2
hi @string.documentation.python cterm=italic gui=italic ctermfg=19 ctermbg=none
hi @variable.python ctermfg=15
hi @type.python ctermfg=6
hi @variable.parameter.python ctermfg=5
hi @constructor.python ctermfg=5
hi @function.method.call.python ctermfg=5
hi @function.call.python ctermfg=6
