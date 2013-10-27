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

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Numbers
set number
set numberwidth=5

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l