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
inoremap <C-Y> <C-O>]p
noremap <C-G> <ESC>:call C_G_Reset()<CR>
inoremap <C-G> <C-O>:call C_G_Reset()<CR>
cnoremap <C-G> <C-\>eC_G_Reset()<CR>
cnoremap <C-K> <C-\>eCmdLineKill(1)<CR>
cnoremap <C-J> <C-\>eCmdLineKill(0)<CR>
