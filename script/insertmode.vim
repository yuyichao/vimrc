set im

function I_hjkl(key)
    if (&modifiable && !&readonly)
        return a:key
    endif
    let l:ret = a:key
    if (a:key == 'h')
        let l:ret = "\<Left>"
    elseif (a:key == 'j')
        let l:ret = "\<Down>"
    elseif (a:key == 'k')
        let l:ret = "\<Up>"
    elseif (a:key == 'l')
        let l:ret = "\<Right>"
    endif
    return l:ret
endfunction

" Edit
noremap <C-D> <Del>
noremap! <C-D> <Del>
noremap <C-F> <Right>
noremap <C-B> <Left>
noremap <C-N> <Down>
noremap <C-P> <Up>
noremap <C-E> <End>
noremap <C-Q> <Home>
noremap! <C-F> <Right>
noremap! <C-B> <Left>
noremap! <C-N> <Down>
noremap! <C-P> <Up>
noremap! <C-E> <End>
noremap! <C-Q> <Home>
noremap ¼ gg
inoremap ¼ <C-O>gg
noremap ¾ G$
inoremap ¾ <C-O>G<C-O>$
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap ú <C-R>
inoremap ú <C-O><C-R>
noremap <C-L> zz
inoremap <C-L> <C-O>zz
noremap ö <C-U>
inoremap ö <C-O><C-U>
noremap <C-V> <C-D>
inoremap <C-V> <C-O><C-D>
inoremap <expr> h I_hjkl("h")
inoremap <expr> j I_hjkl("j")
inoremap <expr> k I_hjkl("k")
inoremap <expr> l I_hjkl("l")