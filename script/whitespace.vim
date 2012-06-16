" My "White Space Mode"

function SetWhiteSpaceHighLight()
    highlight _begin_tabs guibg=#FFFF48
    highlight _tab_error guibg=#FF212A
    highlight _spaces guibg=#D9F2E1
    highlight _blankend guibg=#FF212A
    highlight _newline guibg=#E7FEFF guifg=#CACACA
endfunction

function SetWhiteSpaceMatch()
    call matchadd("_begin_tabs", '^\t\+', 100)
    call matchadd("_tab_error", ' \+\t', 100)
    call matchadd("_spaces", ' \+\(\S\)\@=', 100)
    call matchadd("_blankend", '\s\+$', 100)
    call matchadd("_newline", '\n', 100)
    call matchadd("Underlined", '\%>' . 79 . 'v.\+')
endfunction

autocmd ColorScheme * call SetWhiteSpaceHighLight()
autocmd BufEnter,WinEnter,TabEnter * call SetWhiteSpaceMatch()

call SetWhiteSpaceHighLight()
set list
set lcs=tab:\ \ ,eol:$
