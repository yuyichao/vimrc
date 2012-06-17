let s:kill_ring = [@+]
let s:presist = 0

function s:c_g_reset()
    let @/ = ""
    if (mode() == 'c')
        " Quit cmd mode
        return ""
    endif
    " Quit wait mode
endfunction

call g:hold_register('clip-c-g', function('s:c_g_reset'), 'g')

function s:clip_board_clear()
    call s:set_presist(0)
endfunction

function s:set_presist(tryadd)
    if (a:tryadd > 0)
        let s:presist = 1
    elseif (a:tryadd < 0)
        let s:presist = -1
    else
        let s:presist = 0
    endif
endfunction

function s:update_clipboard()
    if (len(s:kill_ring))
        let @+ = s:kill_ring[0]
    else
        let @+ = ""
    endif
endfunction

function s:get_ring_first()
    if (len(s:kill_ring) > 0)
        return s:kill_ring[0]
    else
        return ""
    endif
endfunction

call g:hold_register('clip_board', function('s:clip_board_clear'), 'cwmg')

function s:push_kill_ring(content, tryadd)
    if (s:presist || s:presist != a:tryadd)
        let l:presist = 0
        s:set_presist(a:tryadd)
    else
        let l:presist = s:presist
    endif
    if (l:presist)
        if (len(s:kill_ring) > 0)
            let l:old_buff = s:kill_ring[0]
        else
            let l:old_buff = ""
            let s:kill_ring = [""]
        endif
    endif
    if (l:presist > 0)
        let s:kill_ring[0] .= content
    elseif (l:presist < 0)
        let s:kill_ring[0] = content . s:kill_ring[0]
    else
        let s:kill_ring = [content] + s:kill_ring
    endif
    call s:update_clipboard()
endfunction

function CmdLineKill(toend)
    let l:cur_cmd_line = getcmdline()
    let l:cur_cmd_pos = getcmdpos()
    let l:cut_buff = ""
    if (a:toend)
        let l:cut_buff = strpart(l:cur_cmd_line, l:cur_cmd_pos - 1)
        let l:cur_cmd_line = strpart(l:cur_cmd_line, 0, l:cur_cmd_pos - 1)
    else
        let l:cur_buff = strpart(l:cur_cmd_line, 0, l:cur_cmd_pos - 1)
        let l:cur_cmd_line = strpart(l:cur_cmd_line, l:cur_cmd_pos - 1)
        call setcmdpos(1)
    endif
    call s:push_kill_ring(l:cur_buff, 0)
    return l:cur_cmd_line
endfunction

" Select
noremap <C-A> ggvG$<C-G>
inoremap <C-A> <ESC>ggvG$<C-G>
noremap <C-Space> <ESC>v<C-G>
inoremap <C-Space> <C-O>v<C-G>
xnoremap <C-W> "+x
xnoremap ÷ "+y
snoremap <C-W> <C-O>"+x
snoremap ÷ <C-O>"+y
noremap <C-Y> "+gP
inoremap <C-Y> <C-R><C-R>+
cnoremap <C-K> <C-\>eCmdLineKill(1)<CR>
cnoremap <C-J> <C-\>eCmdLineKill(0)<CR>
