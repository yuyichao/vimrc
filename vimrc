" Basic
set nocompatible
set encoding=utf-8

set ruler
set hid
" set vb
" set t_vb=
set mouse=a
set lz
set winaltkeys=no

set hlsearch
set incsearch
set history=10000
set cursorline

set ai
set ci
set modeline
set wildmode=longest,list

set clipboard+=unnamed

filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4 foldmethod=indent

" Show Line Number
set nu

" Tab Width
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight
syntax on

" My "White Space Mode"

function SetWhiteSpaceHighLight()
    highlight _begin_tabs guibg=#FFFF48
    highlight _tab_error guibg=#FF212A
    highlight _spaces guibg=#D9F2E1
    highlight _blankend guibg=#FF212A
    highlight _newline guibg=#E7FEFF guifg=#CACACA
endfunction

function SetWhiteSpaceMatch()
    call matchadd("_begin_tabs", '^\t\+', 100)
    call matchadd("_tab_error", ' \+\t', 100)
    call matchadd("_spaces", ' \+\(\S\)\@=', 100)
    call matchadd("_blankend", '\s\+$', 100)
    call matchadd("_newline", '\n', 100)
    call matchadd("Underlined", '\%>' . 79 . 'v.\+')
endfunction

autocmd ColorScheme * call SetWhiteSpaceHighLight()
autocmd BufEnter * call SetWhiteSpaceMatch()

set list
colo default

" Font Setting
set guifont=文泉驿等宽正黑\ Bold\ 13

" Default Directory and Buffer Directory
cd
autocmd BufEnter * silent! lcd %:p:h

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

" File
noremap <C-X><C-S> :w<CR>
inoremap <C-X><C-S> <C-O>:w<CR>
noremap <C-X><C-W> :sav<Space>
inoremap <C-X><C-W> <C-O>:sav<Space>
noremap <C-X><C-F> :e<Space>
inoremap <C-X><C-F> <C-O>:e<Space>
noremap <C-X><Right> :e<Space>
inoremap <C-X><Right> <C-O>:e<Space>q
noremap ø :
inoremap ø <C-O>:

" Search, Probably Need Improvement
noremap <C-S> /
inoremap <C-S> <C-O>/
noremap <C-R> ?
inoremap <C-R> <C-O>?

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
