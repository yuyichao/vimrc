let s:holds = {}

function g:get_cmd_to_nor_str()
    if (&im)
        return "\<ESC>\<ESC>\<C-O>"
    else
        return "\<ESC>\<ESC>"
    endif
endfunction

function g:hold_register(name, cb, cond)
    if (type(a:cb) == 1)
        let l:Cb = function(a:cb)
    elseif (type(a:cb) == 2)
        let l:Cb = a:cb
    else
        return
    endif
    let s:holds[a:name] = {'cb_func': l:Cb, 'cond': a:cond}
endfunction

function g:hold_unregister(name)
    try
        call remove(s:holds, a:name)
    catch /.*/
    endtry
endfunction

function g:Get_Holds()
    return s:holds
endfunction

function <SID>hold_cb(cond)
    for l:key in keys(s:holds)
        try
            if (match(s:holds[l:key].cond, a:cond) >= 0)
                let l:Func = s:holds[l:key].cb_func
                call l:Func()
            endif
        catch /.*/
        endtry
        unlet l:key
    endfor
endfunction

function g:call_and_return(func, ret, ...)
    if (type(a:func) == 1)
        let l:Func = function(a:func)
    elseif (type(a:func) == 2)
        let l:Func = a:func
    else
        return a:ret
    endif
    call call(l:Func, a:000)
    return a:ret
endfunction

autocmd CursorMoved * silent! call <SID>hold_cb('c')
autocmd CursorMovedI * silent! call <SID>hold_cb('c')
autocmd BufEnter * silent! call <SID>hold_cb('w')
autocmd BufWinEnter * silent! call <SID>hold_cb('w')
autocmd WinEnter * silent! call <SID>hold_cb('w')
autocmd CmdwinEnter * silent! call <SID>hold_cb('m')
autocmd TabEnter * silent! call <SID>hold_cb('w')
noremap <expr> <C-G> g:call_and_return("<SID>hold_cb", "", 'g')
inoremap <expr> <C-G> g:call_and_return("<SID>hold_cb", "", 'g')
cnoremap <expr> <C-G> g:call_and_return("<SID>hold_cb", "<ESC>", 'g')
