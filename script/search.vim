let s:continue_search = 0
let s:moving_cursor = 0

function s:SID()
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfun
let s:prefix = "\<SNR>" . s:SID() . '_'

function <SID>set_search_continue(conti)
    if (a:conti)
        let s:continue_search = 1
    else
        let s:continue_search = 0
    endif
endfunction

function <SID>c_g_reset()
    let @/ = ""
endfunction

call g:hold_register('clear-search', s:prefix . 'c_g_reset', 'g')

function <SID>break_search()
    if (s:moving_cursor)
        let s:moving_cursor = 0
    else
        call <SID>set_search_continue(0)
    endif
endfunction

call g:hold_register('search', s:prefix . 'break_search', 'cwmg')


function <SID>search_map(forward)
    let l:key = a:forward ? '/' : '?'
    let l:mode = mode()
    if (l:mode == 'n' || l:mode == 'v' ||
                \ l:mode == 'V' || l:mode == "\<C-V>")
        if (s:continue_search)
            let s:moving_cursor = 1
            return l:key . l:key . "\<CR>"
        endif
        call <SID>set_search_continue(1)
        return l:key
    elseif (l:mode == 'i' || l:mode == 's' ||
                \ l:mode == 'S' || l:mode == "\<C-S>")
        if (s:continue_search)
            let s:moving_cursor = 1
            return "\<C-O>" . l:key . l:key . "\<CR>"
        endif
        call <SID>set_search_continue(1)
        return "\<C-O>" . l:key
    elseif (l:mode == 'c')
        let l:cmd_type = getcmdtype()
        if (l:cmd_type == l:key)
            return <SID>search_enter()
        else
            return g:get_cmd_to_nor_str() . l:key
        endif
    else
        return ""
    endif
endfunction

function <SID>search_enter()
    let l:cmd_type = getcmdtype()
    if (l:cmd_type == '/' || l:cmd_type == '?')
        let s:moving_cursor = 1
        call <SID>set_search_continue(1)
        if (getcmdline() == '')
            return l:cmd_type . "\<CR>"
        endif
    endif
    return "\<CR>"
endfunction

noremap <expr> <C-S> <SID>search_map(1)
noremap! <expr> <C-S> <SID>search_map(1)
noremap <expr> <C-R> <SID>search_map(0)
noremap! <expr> <C-R> <SID>search_map(0)
cnoremap <expr> <CR> <SID>search_enter()
nnoremap <expr> / g:call_and_return("<SID>set_search_continue", '/', 1)
vnoremap <expr> / g:call_and_return("<SID>set_search_continue", '/', 1)
nnoremap <expr> ? g:call_and_return("<SID>set_search_continue", '?', 1)
vnoremap <expr> ? g:call_and_return("<SID>set_search_continue", '?', 1)
