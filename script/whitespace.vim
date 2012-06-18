" My "White Space Mode"

set lcs=tab:\ \ ,eol:$

let s:blacklist = ['conque_term']
let s:whitespace_match = {'begin_tabs': ['_begin_tabs', '^\t\+', 100],
            \ 'tab_error': ['_tab_error', ' \+\t', 100],
            \ 'spaces': ['_spaces', ' \+\(\S\)\@=', 100],
            \ 'blankend': ['_blankend', '\s\+$', 100],
            \ 'newline': ['_newline', '\n', 100],
            \ 'long_line': ['Underlined', '\%>79v.\+']
            \ }

function s:set_white_space_highlight()
    highlight _begin_tabs guibg=#FFFF48
    highlight _tab_error guibg=#FF212A
    highlight _spaces guibg=#D9F2E1
    highlight _blankend guibg=#FF212A
    highlight _newline guibg=#E7FEFF guifg=#CACACA
endfunction

function s:set_white_space_match()
    if (index(s:blacklist, &filetype) >= 0)
        return
    endif
    if (!exists('w:white_space_matches'))
        setlocal list
        let w:white_space_matches = {}
        for l:key in keys(s:whitespace_match)
            let w:white_space_matches[l:key] = call('matchadd',
                        \ s:whitespace_match[l:key])
        endfor
    endif
endfunction

function s:remove_white_space_match()
    if (index(s:blacklist, &filetype) >= 0 && exists('w:white_space_matches'))
        setlocal nolist
        for l:key in keys(w:white_space_matches)
            call matchdelete(w:white_space_matches[l:key])
        endfor
        unlet w:white_space_matches
    endif
endfunction

autocmd ColorScheme * call s:set_white_space_highlight()
autocmd BufEnter * call s:set_white_space_match()
autocmd WinEnter * call s:set_white_space_match()
autocmd TabEnter * call s:set_white_space_match()
autocmd BufWinEnter * call s:set_white_space_match()
autocmd Syntax * call s:set_white_space_match()
autocmd FileType * call s:remove_white_space_match()

call s:set_white_space_highlight()
