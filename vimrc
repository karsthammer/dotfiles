set runtimepath=$HOME/.dotfiles
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

" Set undofiles
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show current cursor position
" set cursorline
" set cursorcolumn

" Numbers
set number
set numberwidth=5
set relativenumber

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quick buffer navigation
nnoremap gb :buffers<CR>:b<Space>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" nmap <C-k> [e
" nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" vmap <C-k> [egv
" vmap <C-j> ]egv

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

  autocmd FileType ruby set sw=2 sts=2 et
  " Make ruby see ? and ! inclusive in the keyword
  autocmd FileType ruby set iskeyword=@,!,?,48-57,_,192-255
  autocmd FileType erb  set sw=2 sts=2 noet
  autocmd FileType yaml set sw=2 sts=2 et
endif

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

" Add ERB support to surround.vim
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

set hidden

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag for Ack
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache, but we still do it
  let g:ctrlp_use_caching = 1
endif

" Syntastic
let g:syntastic_auto_loc_list = 1 " Open the error window automatically when there are errors. And automatically close when there are no errors.

" EditorConfig exclude fugitive files
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
