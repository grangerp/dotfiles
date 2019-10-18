" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 9.5 beta

" TODO current problems:
" * end key not working undef tmux+fish

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:

" lightline
Plug 'itchyny/lightline.vim'


" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Ballerina
Plug 'ballerina-attic/plugin-vim'

" A Vim plugin which provides ways of navigating JSON document buffers.
Plug 'mogelbrod/vim-jsonpath'

" yapf
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" decent defaults
Plug 'tpope/vim-sensible'

" comment code
Plug 'tpope/vim-commentary'

" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'

" git, fugitive
Plug 'tpope/vim-fugitive'
set diffopt+=vertical

" enable Gbrowse
Plug 'tpope/vim-rhubarb'

" md preview
Plug 'shime/vim-livedown'

" eunuch, unix file oprations
Plug 'tpope/vim-eunuch'

" surround with
Plug 'tpope/vim-surround'

" snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Pluse search match
Plug 'inside/vim-search-pulse'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Theme
Plug 'trevordmiller/nova-vim'

" highlight on yank
Plug 'machakann/vim-highlightedyank'

" rust
Plug 'rust-lang/rust.vim'

" golang
Plug 'fatih/vim-go'

Plug 'w0rp/ale'
let g:ale_fixers = {'python': ['black', 'isort'], 'typescript': ['prettier']}
let g:ale_linters = {'python':['pylint', 'mypy']}
" let g:ale_linters = {'python':[]}
let g:ale_echo_msg_format = '[%linter%](%code%) %s [%severity%]'
let g:ale_fix_on_save = 1
" only run linter on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
" used nvim current dir so it use .config files
let g:ale_python_pylint_change_directory = 0

" let g:ale_linters = {'markdown':['vale']}
" let g:ale_fixers={'markdown':['prettier']}

" grepper
Plug 'mhinz/vim-grepper'
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" testing
Plug 'janko-m/vim-test'
let test#python#runner = 'pytest'
let test#strategy = 'dispatch'

Plug 'tpope/vim-dispatch'

" class outline viewer
Plug 'majutsushi/tagbar'

" Dockerfile highlight + snippets for snipmate
Plug 'ekalinin/Dockerfile.vim'

" files tree
Plug 'scrooloose/nerdtree'

" nerdtree git
Plug 'Xuyuanp/nerdtree-git-plugin'

" per project config
Plug 'embear/vim-localvimrc'

" JSON
Plug 'elzr/vim-json'

" Automatic save session
Plug 'tpope/vim-obsession'

" need to install shfmt
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" elixir
Plug 'elixir-editors/vim-elixir'

" Swap window
" Navigate to the window you'd like to move
" Press <leader>ww
" Navigate to the window you'd like to swap with
" Press <leader>ww again
Plug 'wesQ3/vim-windowswap'


" Initialize plugin system
call plug#end()

" tagbar
nmap <F8> :TagbarToggle<CR>

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
	echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

let g:vim_isort_python_version = 'python3'

" disable mouse navigation
set mouse =""

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

" Highlight 80th column
set colorcolumn=100

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme fisa
    " colorscheme nova
else
    colorscheme delek
endif

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" incremental search/replace
set inccommand=nosplit

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>


" Fzf ------------------------------
" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" lightline ------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'obsession' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'obsession': 'ObsessionStatus'
      \ },
      \ }

" Deoplete -----------------------------

" Use deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

let g:python3_host_prog = '/home/pgranger/.pyenv/versions/3.7.4/bin/python'
