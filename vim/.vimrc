set nocompatible
filetype off

" vim options "
" search option "
:set incsearch
:set hlsearch

"by default Vim saves your last 8 commands.
set history=100 

set number

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set rnu

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

" PowerLine
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" git, fugitive
Bundle 'tpope/vim-fugitive'

" filebrowser
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

" python mode
Bundle 'klen/python-mode'
" disable rope (autocomplete)
" let g:pymode_rope = 0
let g:pymode_options_max_line_length = 100

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufCoverageFile<CR>
" nmap ,t :FufTaggedFile<CR>


Bundle 'davidhalter/jedi-vim'

Bundle 'fisadev/vim-isort'


