source ~/.vim/script/uicommon.vim

set clipboard+=unnamed

filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4 foldmethod=indent

" Tab Width
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight
syntax on

source ~/.vim/script/whitespace.vim

highlight Normal guibg=#FFFFDD

" Default Directory and Buffer Directory
cd
autocmd BufEnter * silent! lcd %:p:h

function C_G_Reset()
    let @/ = ""
    if (mode() == 'c')
        " Quit cmd mode
        return ""
    endif
    " Quit wait mode
endfunction

function CMapFull(res)
    return getcmdline()
endfunction

function CMapEmpty(res)
    return ""
endfunction

source ~/.vim/script/clip.vim

" KeyBinding
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

" File
noremap <C-X><C-S> :w<CR>
inoremap <C-X><C-S> <C-O>:w<CR>
noremap <C-X><C-W> :sav<Space>
inoremap <C-X><C-W> <C-O>:sav<Space>
noremap <C-X><C-F> :e<Space>
inoremap <C-X><C-F> <C-O>:e<Space>
noremap <C-X><Right> :e<Space>
inoremap <C-X><Right> <C-O>:e<Space>
noremap ø :
inoremap ø <C-O>:

" Window
inoremap <C-W>n <C-O><C-W>n
inoremap <C-W>s <C-O><C-W>s
inoremap <C-W>v <C-O><C-W>v
inoremap <C-W>c <C-O><C-W>c
inoremap <C-W>o <C-O><C-W>o

noremap È <C-W>H
inoremap È <C-O><C-W>H
noremap Ê <C-W>J
inoremap Ê <C-O><C-W>J
noremap Ë <C-W>K
inoremap Ë <C-O><C-W>K
noremap Ì <C-W>L
inoremap Ì <C-O><C-W>L

noremap <C-X><C-B> :buffers
noremap <C-X><Left> :buffers
inoremap <C-X><C-B> <C-O>:buffers
inoremap <C-X><Left> <C-O>:buffers
noremap <C-X>b :b<Space>
inoremap <C-X>b <C-O>:b<Space>

noremap è <C-W>h
inoremap è <C-O><C-W>h
noremap ê <C-W>j
inoremap ê <C-O><C-W>j
noremap ë <C-W>k
inoremap ë <C-O><C-W>k
noremap ì <C-W>l
inoremap ì <C-O><C-W>l
