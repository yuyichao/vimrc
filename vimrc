" Basic
set nocompatible
set encoding=utf-8

set ruler
set hid

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
map <C-D> <Del>
map! <C-D> <Del>
map <C-X><C-S> :w<CR>
imap <C-X><C-S> <C-O>:w<CR>
map <C-X><C-W> :sav<Space>
imap <C-X><C-W> <C-O>:sav<Space>

map <C-F> <Right>
map <C-B> <Left>
map <C-N> <Down>
map <C-P> <Up>
map <C-E> <End>
map <C-Q> <Home>
map! <C-F> <Right>
map! <C-B> <Left>
map! <C-N> <Down>
map! <C-P> <Up>
map! <C-E> <End>
map! <C-Q> <Home>

map <C-X><C-F> :e<Space>
imap <C-X><C-F> <C-O>:e<Space>
map <C-X><Right> :e<Space>
imap <C-X><Right> <C-O>:e<Space>
map ø :
imap ø <C-O>:
map ¼ gg
imap ¼ <C-O>gg
map ¾ G$
imap ¾ <C-O>G<C-O>$

" Probably Need Improvement
map <C-S> /
imap <C-S> <C-O>/
