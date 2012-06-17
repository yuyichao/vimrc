let s:continue_search = 0
let s:moving_cursor = 0

function g:set_search_continue(conti)
    if (a:conti)
        let s:continue_search = 1
    else
        let s:continue_search = 0
    endif
endfunction

function g:C_g_reset()
    let @/ = ""
endfunction

call g:hold_register('clear-search', function("g:C_g_reset"), 'g')

function g:break_search()
    if (s:moving_cursor)
        let s:moving_cursor = 0
    else
        call g:set_search_continue(0)
    endif
endfunction

call g:hold_register('search', function('g:break_search'), 'cwmg')

function s:search_enter()
    let s:moving_cursor = 1
    call g:set_search_continue(1)
    if (getcmdline() == '')
        return getcmdtype() . "\<CR>"
    else
        return "\<CR>"
    endif
endfunction

function Search_Map(forward)
    let l:key = a:forward ? '/' : '?'
    let l:mode = mode()
    if (l:mode == 'n' || l:mode == 'v' ||
                \ l:mode == 'V' || l:mode == "\<C-V>")
        if (s:continue_search)
            let s:moving_cursor = 1
            return l:key . l:key . "\<CR>"
        endif
        call g:set_search_continue(1)
        return l:key
    elseif (l:mode == 'i' || l:mode == 's' ||
                \ l:mode == 'S' || l:mode == "\<C-S>")
        if (s:continue_search)
            let s:moving_cursor = 1
            return "\<C-O>" . l:key . l:key . "\<CR>"
        endif
        call g:set_search_continue(1)
        return "\<C-O>" . l:key
    elseif (l:mode == 'c')
        let l:cmd_type = getcmdtype()
        if (l:cmd_type == l:key)
            return s:search_enter()
        else
            return g:get_cmd_to_nor_str() . l:key
        endif
    else
        return ""
    endif
endfunction

function Search_Enter()
    let l:cmd_type = getcmdtype()
    if (l:cmd_type == '/' || l:cmd_type == '?')
        return s:search_enter()
    else
        return "\<CR>"
    endif
endfunction

noremap <expr> <C-S> Search_Map(1)
noremap! <expr> <C-S> Search_Map(1)
noremap <expr> <C-R> Search_Map(0)
noremap! <expr> <C-R> Search_Map(0)
cnoremap <expr> <CR> Search_Enter()
nnoremap <expr> / g:call_and_return(function('g:set_search_continue'),
            \                       '/', 1)
vnoremap <expr> / g:call_and_return(function('g:set_search_continue'),
            \                       '/', 1)
nnoremap <expr> ? g:call_and_return(function('g:set_search_continue'),
            \                       '?', 1)
vnoremap <expr> ? g:call_and_return(function('g:set_search_continue'),
            \                       '?', 1)
