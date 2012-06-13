" Basic
set encoding=utf-8
set ruler
set ru
set hlsearch
set incsearch
set history=10000
"set cursorline
"set ai
"set ci
"set modeline

"filetype plugin indent on
"autocmd FileType python setlocal et sta sw=4 sts=4 foldmethod=indent

" Show Line Number
set nu

" Tab Width
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight
syntax on

" My "White Space Mode"
autocmd ColorScheme * highlight _begin_tabs guibg=#FFFF48
autocmd Syntax * syn match _begin_tabs /^\t\+/

autocmd ColorScheme * highlight _tab_error guibg=#FF212A
autocmd Syntax * syn match _tab_error / \+\t/

autocmd ColorScheme * highlight _spaces guibg=#D9F2E1
autocmd Syntax * match _spaces / \+\(\S\)\@=/

autocmd ColorScheme * highlight _newline guibg=#E7FEFF guifg=#CACACA
autocmd Syntax * match _newline /\n/

autocmd ColorScheme * highlight _blankend guibg=#FF212A
autocmd Syntax * syn match _blankend /\s\+$/

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

