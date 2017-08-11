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

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set rnu

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
" required! 
Plug 'gmarik/vundle'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'


" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

" PowerLine
" Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" git, fugitive
Plug 'tpope/vim-fugitive'
set diffopt+=vertical

" python mode
Plug 'python-mode/python-mode'

let g:pymode = 1

" disable rope (autocomplete)
let g:pymode_rope = 1
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 100
let g:pymode_rope_regenerate_on_write = 0
" Extended autocompletion (rope could complete objects which have not been imported) from project *'g:pymode_rope_autoimport'*
let g:pymode_rope_autoimport = 0 
" Offer to unresolved import object after completion.
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_doc = 0
let g:pymode_python = 'python3'
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_on_fly = 0

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

let g:pymode_trim_whitespaces = 1

" FuzzyFinder
" Plug 'L9'
" Plug 'FuzzyFinder'

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufCoverageFile<CR>


Plug 'fisadev/vim-isort'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-surround'

" :e %% to get current dir of the file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" https://github.com/cohama/lexima.vim
Plug 'cohama/lexima.vim'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'


" Initialize plugin system
call plug#end()

autocmd FileType python UltiSnipsAddFiletypes django

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


set statusline=
set statusline+=%(%{'help'!=&filetype?bufnr('%'):''}\ \ %)
set statusline+=%< " Where to truncate line
set statusline+=%f " Path to the file in the buffer, as typed or relative to current directory
set statusline+=%{&modified?'\ +':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{''!=#&filetype?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.('unix'!=#&fileformat?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ 
set statusline+=\ %2v " Virtual column number
set statusline+=\ %3p%% " Percentage through file in lines as in |CTRL-G|
