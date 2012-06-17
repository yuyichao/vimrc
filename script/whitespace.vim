" My "White Space Mode"

set list
set lcs=tab:\ \ ,eol:$

function s:set_white_space_highlight()
    highlight _begin_tabs guibg=#FFFF48
    highlight _tab_error guibg=#FF212A
    highlight _spaces guibg=#D9F2E1
    highlight _blankend guibg=#FF212A
    highlight _newline guibg=#E7FEFF guifg=#CACACA
endfunction

function s:set_white_space_match()
    if (!exists('w:begin_tabs'))
        let w:begin_tabs = matchadd("_begin_tabs", '^\t\+', 100)
    endif
    if (!exists('w:tab_error'))
        let w:tab_error = matchadd("_tab_error", ' \+\t', 100)
    endif
    if (!exists('w:spaces'))
        let w:spaces = matchadd("_spaces", ' \+\(\S\)\@=', 100)
    endif
    if (!exists('w:blankend'))
        let w:blankend = matchadd("_blankend", '\s\+$', 100)
    endif
    if (!exists('w:newline'))
        let w:newline = matchadd("_newline", '\n', 100)
    endif
    if (!exists('w:long_line'))
        let w:long_line = matchadd("Underlined", '\%>' . 79 . 'v.\+')
    endif
endfunction

autocmd ColorScheme * call s:set_white_space_highlight()
autocmd BufEnter * call s:set_white_space_match()
autocmd WinEnter * call s:set_white_space_match()
autocmd TabEnter * call s:set_white_space_match()
autocmd BufWinEnter * call s:set_white_space_match()
autocmd Syntax * call s:set_white_space_match()

call s:set_white_space_highlight()
