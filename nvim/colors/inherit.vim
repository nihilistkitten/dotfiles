" setup
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "inherit"

let s:color_map = {
    \'Black'       : 0,
    \'DarkRed'     : 1,
    \'DarkGreen'   : 2,
    \'DarkYellow'  : 3,
    \'DarkBlue'    : 4,
    \'DarkMagenta' : 5,
    \'DarkCyan'    : 6,
    \'LightGray'   : 7,
    \'DarkGray'    : 8,
    \'Red'         : 9,
    \'Green'       : 10,
    \'Yellow'      : 11,
    \'Blue'        : 12,
    \'Magenta'     : 13,
    \'Cyan'        : 14,
    \'White'       : 15,
    \'NONE'        : 'NONE',
\}

" setup stuff from https://github.com/jsit/disco.vim/blob/master/colors/disco.vim
fun! s:set_colors(group, fg, bg, attr)
    if !empty(a:fg)
        exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . get(s:color_map, a:fg)
    endif

    if !empty(a:bg)
        exec "hi " . a:group . " guibg=" .  a:bg . " ctermbg=" . get(s:color_map, a:bg)
    endif

    if !empty(a:attr)
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr . " term=" . a:attr
    endif
endfun

" check if we can do colors 8-15
if has('gui_running') || (&t_Co > 8 && (!exists('g:disco_nobright') || g:disco_nobright != 1))
    let s:gt_eight = 1
else
    let s:gt_eight = 0
endif

" check if we can do italic
if (&t_ZH != '' && &t_ZH != '[7m')
    let s:italic = 1
else
    let s:italic = 0
endif

" we always want to inherit the terminal bg
let s:bg               = 'NONE'
let s:none             = 'NONE'

" set greyscale colors
if &background == "dark"
    let s:black        = 'Black'
    let s:white        = 'White'
    let s:fg           = 'LightGray'
    let s:dimtwo       = 'LightGray'
  if s:gt_eight
    let s:dim          = 'DarkGray'
  else
    let s:dim          = 'LightGray'
  end
else
    let s:black        = 'White'
    let s:white        = 'Black'
    let s:dim          = 'LightGray'
  if s:gt_eight
    let s:dimtwo       = 'DarkGray'
    let s:fg           = 'DarkGray'
  else
    let s:dimtwo       = 'LightGray'
    let s:fg           = 'Black'
  end
end

if &background == "dark" && s:gt_eight
    let s:red          = 'Red'
    let s:green        = 'Green'
    let s:yellow       = 'Yellow'
    let s:blue         = 'Blue'
    let s:magenta      = 'Magenta'
    let s:cyan         = 'Cyan'

    let s:dimred       = 'DarkRed'
    let s:dimgreen     = 'DarkGreen'
    let s:dimyellow    = 'DarkYellow'
    let s:dimblue      = 'DarkBlue'
    let s:dimmagenta   = 'DarkMagenta'
    let s:dimcyan      = 'DarkCyan'

    let s:brightyellow = 'Yellow'

else
    let s:red          = 'DarkRed'
    let s:green        = 'DarkGreen'
    let s:yellow       = 'DarkYellow'
    let s:blue         = 'DarkBlue'
    let s:magenta      = 'DarkMagenta'
    let s:cyan         = 'DarkCyan'

    if s:gt_eight
         let s:dimred       = 'Red'
         let s:dimgreen     = 'Green'
         let s:dimyellow    = 'Yellow'
         let s:dimblue      = 'Blue'
         let s:dimmagenta   = 'Magenta'
         let s:dimcyan      = 'Cyan'

         let s:brightyellow = 'DarkYellow'

    else
        let s:dimred       = s:red
        let s:dimgreen     = s:green
        let s:dimyellow    = s:yellow
        let s:dimblue      = s:blue
        let s:dimmagenta   = s:magenta
        let s:dimcyan      = s:cyan

        let s:brightyellow = s:yellow

    endif
endif

"vim ui
call s:set_colors("ColorColumn", s:fg, s:dim, "")
call s:set_colors("Conceal", s:dim, s:none, "")
call s:set_colors("Cursor", s:dimtwo, s:none, "reverse")
call s:set_colors("CursorLine", s:none, s:dim, "")
call s:set_colors("Directory", s:dimgreen, s:none, "underline")
call s:set_colors("ErrorMsg", s:red, s:none, "underline")
call s:set_colors("VertSplit", s:black, s:none, "")
call s:set_colors("Folded", s:dimtwo, s:bg, "")
call s:set_colors("FoldColumn", s:dimtwo, s:bg, "")
call s:set_colors("SighColumn", s:fg, s:bg, "")
call s:set_colors("IncSearch", s:black, s:red, "") " todo
call s:set_colors("Substitute", s:bg, s:red, "") " todo
call s:set_colors("LineNr", s:dim, s:bg, "")
call s:set_colors("CursorLineNr", s:fg, s:dim, "")
call s:set_colors("MatchParen", s:fg, s:dimblue, "") " todo
call s:set_colors("ModeMsg", s:fg, s:bg, "bold")
call s:set_colors("MoreMsg", s:blue, s:bg, "bold")
call s:set_colors("NonText", s:dim, s:none, "")
call s:set_colors("Normal", s:fg, s:bg, "")
call s:set_colors("NormalNC", s:fg, s:black, "")
call s:set_colors("NormalNC", s:fg, s:dim, "")
call s:set_colors("Pmenu", s:fg, s:dim, "")
call s:set_colors("PmenuSel", s:bg, s:blue, "") " todo
call s:set_colors("PmenuSbar", s:fg, s:dim, "")
call s:set_colors("PmenuThumb", s:fg, s:dimtwo, "")
call s:set_colors("Question", s:yellow, s:bg, "")
call s:set_colors("QuickFixLine", s:bg, s:blue, "") " todo
call s:set_colors("Search", s:bg, s:green, "") " todo
call s:set_colors("SignColumn", s:dim, s:dim, "") " todo
call s:set_colors("SpecialKey", s:dimtwo, s:bg, "")
call s:set_colors("SpellBad", s:red, s:bg, "underline")
call s:set_colors("SpellCap", s:yellow, s:bg, "underline")
call s:set_colors("SpellLocal", s:blue, s:bg, "underline")
call s:set_colors("SpellRare", s:dimmagenta, s:bg, "underline")
call s:set_colors("TabLine", s:dimtwo, s:fg, "")
call s:set_colors("TabLineFill", s:dim, s:fg, "")
call s:set_colors("TabLineSel", s:black, s:red, "NONE") " todo
call s:set_colors("Title", s:red, s:bg, "bold")
call s:set_colors("Visual", s:bg, s:dimtwo, "")
call s:set_colors("VisualNOS", s:bg, s:dimtwo, "underline")
call s:set_colors("WarningMsg", s:yellow, s:bg, "")
call s:set_colors("Whitespace", s:dimtwo, s:bg, "")
call s:set_colors("WildMenu", s:bg, s:blue, "") " todo

" statusline
" todo: there were better colors here, check old commits
call s:set_colors("StatusLine", s:dimtwo, s:dim, "NONE")
call s:set_colors("StatusNormal", s:dim, s:dimblue, "")
call s:set_colors("StatusNop", s:dim, s:dimyellow, "")
call s:set_colors("StatusInsert", s:dim, s:green, "")
call s:set_colors("StatusVisual", s:dim, s:dimmagenta, "")
call s:set_colors("StatusSelect", s:dim, s:dimyellow, "")
call s:set_colors("StatusReplace", s:dim, s:dimyellow, "")
call s:set_colors("StatusCommand", s:dim, s:magenta, "")
call s:set_colors("StatusPrompt", s:dim, s:dimyellow, "")
call s:set_colors("StatusShell", s:dim, s:yellow, "")
call s:set_colors("StatusNone", s:dim, s:dimtwo, "")
call s:set_colors("StatusLineDark", s:fg, s:bg, "")

" syntax
call s:set_colors("Comment", s:dimmagenta, s:bg, "italic")
call s:set_colors("Constant", s:dimyellow, s:bg, "")
call s:set_colors("String", s:green, s:bg, "")
call s:set_colors("Character", s:green, s:bg, "")
call s:set_colors("Identifier", s:yellow, s:bg, "NONE")
call s:set_colors("Function", s:magenta, s:bg, "")
call s:set_colors("Statement", s:red, s:bg, "")
call s:set_colors("PreProc", s:red, s:bg, "")
call s:set_colors("Type", s:blue, s:bg, "")
call s:set_colors("Special", s:cyan, s:bg, "")
call s:set_colors("Delimiter", s:dimtwo, s:bg, "")
call s:set_colors("Underlined", s:dimblue, s:bg, "underline")
call s:set_colors("Ignore", s:dim, s:bg, "")
call s:set_colors("Todo", s:black, s:yellow, "")
hi! link Error     ErrorMsg

" vim: fdm=marker:sw=2:sts=2:et