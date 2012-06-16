function Search_Map(forward)
    let l:key = forward ? '/' : '?'
    let l:mode = mode()
    if (l:mode == 'n' || l:mode == 'v' || l:mode == 'V' || l:mode == "\<C-V>")
        return l:key
    elseif (l:mode == 'i' || l:mode == 's' ||
            l:mode == 'S' || l:mode == "\<C-S>")
        return "\<C-O>" . l:key
    elseif (l:mode == 'c')
        " TODO
        return ""
    else
        return ""
    endif
endfunction

noremap <expr> <C-S> Search_Map(1)
noremap! <expr> <C-S> Search_Map(1)
noremap <expr> <C-R> Search_Map(0)
noremap! <expr> <C-R> Search_Map(0)
