""""""" Plugin management stuff """""""
set nocompatible
filetype off

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" persistent undo
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

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
set rnu

" :e %% to get current dir of the file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

call plug#begin('~/.local/share/nvim/plugged')

" decent defaults
Plug 'tpope/vim-sensible'

" comment code
Plug 'tpope/vim-commentary'

" nvim autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" jedi with deoplete
Plug 'zchee/deoplete-jedi'

" python-mode, we only want goto function, disable the rest
Plug 'python-mode/python-mode'
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 99
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
let g:pymode_lint = 0
let g:pymode_rope_completion = 0
" goto def use same window
let g:pymode_rope_goto_definition_cmd = 'e'

" Autocomplete for python
" Plug 'davidhalter/jedi-vim'
" Let deoplete do the autocomplete
" let g:jedi#completions_enabled = 0

" Flake8
Plug 'nvie/vim-flake8'
let g:flake8_cmd='/usr/local/bin/flake8'
" show error in left margin
let g:flake8_show_in_gutter=1
" run on save
autocmd BufWritePost *.py call Flake8()

" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'

" Status bar mods
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

" git, fugitive
Plug 'tpope/vim-fugitive'
set diffopt+=vertical

" Isort
Plug 'fisadev/vim-isort'

" md preview
Plug 'shime/vim-livedown'

" surround with
Plug 'tpope/vim-surround'

" snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Neomake
Plug 'neomake/neomake'
" Neomake on every write
autocmd! BufWritePost * Neomake
" open window automatically on run
let g:neomake_open_list = 2


" Initialize plugin system
call plug#end()

filetype plugin indent on

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"


""""""" General coding stuff """""""
" Highlight 80th column
set colorcolumn=100
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert


""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1


""""""" Keybindings """""""
" Set up leaders
let mapleader=","
let maplocalleader="\\"

" Mac OS X option-left / right
noremap â b
noremap æ e
inoremap â <C-o>b
inoremap æ <C-o>e<right>
" Note - this required binding in preferences (Cmd-,) option+backspace to
" escape+z.
" Why this one is complicated - <C-o> at end of line moves cursor by one
" character, which means a trailing character could be left.
inoremap <expr> ú col('.')>1 ? 'T<Left><C-o>db<Delete>' : '<Backspace>T<Left><c-o>db<Delete>'
" Requires binding option+forward delete to escape
inoremap ø <C-o>dw

" Linux / windows ctrl+backspace ctrl+delete
" Note that ctrl+backspace doesn't work in Linux, so ctrl+\ is also available
imap <C-backspace> ú
imap <C-\> ú
imap <C-delete> ø

" Arrow keys up/down move visually up and down rather than by whole lines.  In
" other words, wrapped lines will take longer to scroll through, but better
" control in long bodies of text.
" NOTE - Disabled since <leader><leader>w|e|b works well with easymotion
"noremap <up> gk
"noremap <down> gj

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>

