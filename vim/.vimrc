set nocompatible
filetype off

" vim options "
" to learn other move deactivate arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
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
Bundle 'tpope/vim-sensible'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

" PowerLine
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" git, fugitive
Bundle 'tpope/vim-fugitive'
set diffopt+=vertical

" filebrowser
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

" python mode
Bundle 'klen/python-mode'
" disable rope (autocomplete)
let g:pymode_rope = 1
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 100
let g:pymode_rope_regenerate_on_write = 0
" Extended autocompletion (rope could complete objects which have not been imported) from project *'g:pymode_rope_autoimport'*
" let g:pymode_rope_autoimport = 1
" Offer to unresolved import object after completion.
" let g:pymode_rope_autoimport_import_after_complete = 1
" let g:pymode_doc = 0
let g:pymode_lint_on_fly = 0

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
"let g:pymode_paths = ['./apps']
let g:pymode_rope_goto_definition_cmd = 'e'

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufCoverageFile<CR>


" Bundle 'davidhalter/jedi-vim'
" let g:jedi#popup_on_dot = 1
" let g:jedi#use_tabs_not_buffers = 1

Bundle 'fisadev/vim-isort'
Bundle 'shime/vim-livedown'
Bundle 'tpope/vim-surround'
Bundle 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" :e %% to get current dir of the file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" sudo dnf instakk ack
Plugin 'mileszs/ack.vim'
Plugin 'jceb/vim-orgmode'
