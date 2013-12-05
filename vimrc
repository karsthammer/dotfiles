runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Show the cursor position all the time
set ruler

" Enable filetype plugins
filetype plugin indent on

" Set colors
colorscheme solarized
set background=dark

" Set tab setting
"

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show current cursor position
set cursorline
set cursorcolumn

" Numbers
set number
set numberwidth=5

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Display extra whitespace
" set list listchars=tab:»·,trail:·
set list listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮

" Use %% as shortcut for %:h (gets the current files' dir)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Switch between two last files
nnoremap <leader><leader> <c-^>

" NERDTree toggle via Command-D
map <M-d> :NERDTreeToggle<CR>

" Don't let CtrlP determine the working path
let g:ctrlp_working_path_mode = ''

set nowrap
set showbreak=↪\
set tabstop=2 shiftwidth=2 noexpandtab

if has("autocmd")
  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

  autocmd FileType ruby set sw=2 sts=2 noet
  autocmd FileType erb  set sw=2 sts=2 noet
  autocmd FileType yaml set sw=2 sts=2 et
endif

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

" Add ERB support to surround.vim
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

set hidden
