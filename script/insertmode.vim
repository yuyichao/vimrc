set im
set whichwrap=b,s,<,>,h,l,[,],~
set backspace=indent,eol,start

function <SID>i_redirect(key)
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
    elseif (a:key == '/')
        let l:ret = "\<C-O>/"
    elseif (a:key == '?')
        let l:ret = "\<C-O>?"
    endif
    return l:ret
endfunction

function <SID>toggle_readonly()
    let &modifiable = !&modifiable
    return ""
endfunction

function <SID>insert_tab_indent()
    let l:pos = col('.')
    let l:line = getline('.')
    let l:after_l = g:utf8_strlen(strpart(l:line, l:pos - 1))
    let l:before_text = strpart(l:line, 0, l:pos - 1)
    let l:before_non_blk = substitute(l:before_text, '\s', '', 'g')
    let l:suffix = ""
    if (strlen(l:before_non_blk) > 0)
        let l:suffix = "\<End>" . repeat("\<Left>", l:after_l)
    endif
    return "\<C-O>==" . l:suffix
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
noremap <C-L> zz<C-L>
inoremap <C-L> <C-O>zz<C-O><C-L>
noremap ö <C-U>
inoremap ö <C-O><C-U>
noremap <C-V> <C-D>
inoremap <C-V> <C-O><C-D>
inoremap <expr> h <SID>i_redirect("h")
inoremap <expr> j <SID>i_redirect("j")
inoremap <expr> k <SID>i_redirect("k")
inoremap <expr> l <SID>i_redirect("l")
inoremap <expr> / <SID>i_redirect('/')
inoremap <expr> ? <SID>i_redirect('?')
noremap <expr> <C-X><C-Q> <SID>toggle_readonly()
noremap! <expr> <C-X><C-Q> <SID>toggle_readonly()
noremap <expr> <C-X><Home> <SID>toggle_readonly()
noremap! <expr> <C-X><Home> <SID>toggle_readonly()
inoremap <expr> <TAB> <SID>insert_tab_indent()
