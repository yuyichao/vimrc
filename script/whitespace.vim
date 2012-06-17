" My "White Space Mode"

set list
set lcs=tab:\ \ ,eol:$

function SetWhiteSpaceHighLight()
    highlight _begin_tabs guibg=#FFFF48
    highlight _tab_error guibg=#FF212A
    highlight _spaces guibg=#D9F2E1
    highlight _blankend guibg=#FF212A
    highlight _newline guibg=#E7FEFF guifg=#CACACA
endfunction

function SetWhiteSpaceMatch()
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

autocmd ColorScheme * call SetWhiteSpaceHighLight()
"autocmd BufEnter,WinEnter,TabEnter,Syntax * call SetWhiteSpaceMatch()
autocmd BufEnter * call SetWhiteSpaceMatch()
autocmd WinEnter * call SetWhiteSpaceMatch()
autocmd TabEnter * call SetWhiteSpaceMatch()
autocmd BufWinEnter * call SetWhiteSpaceMatch()
autocmd Syntax * call SetWhiteSpaceMatch()
" autocmd BufEnter * call SetWhiteSpaceMatch()

call SetWhiteSpaceHighLight()
