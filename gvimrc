" If we have MacVim running, set some stuff
if has("gui_macvim")
  " Map CtrlP to Command-T
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
  vmap <D-t> <ESC>:CtrlP<CR>

  " Map Cmd-Shift-F to Ack.vim
  map <D-F> <ESC>:Ack<space>

  " Indent lines with cmd+[ and cmd+]
  nmap <D-]> >>
  nmap <D-[> <<
  vmap <D-[> <gv
  vmap <D-]> >gv

  " Open Go to symbol (via tags)
  nmap <D-r> :CtrlPBufTag<cr>
  nmap <D-R> :CtrlPBufTagAll<cr>

  "switch between tabs with cmd+1, cmd+2,..."
  map <D-1> :tabfirst<Cr>
  map <D-2> :tabfirst<Cr>gt
  map <D-3> :tabfirst<Cr>3gt
  map <D-4> :tabfirst<Cr>4gt
  map <D-5> :tabfirst<Cr>5gt
  map <D-6> :tabfirst<Cr>6gt
  map <D-7> :tabfirst<Cr>7gt
  map <D-8> :tabfirst<Cr>8gt
  map <D-9> :tabfirst<Cr>9gt

  imap <D-1> <esc>:tabfirst<Cr>
  imap <D-2> <esc>:tabfirst<Cr>gt
  imap <D-3> <esc>:tabfirst<Cr>3gt
  imap <D-4> <esc>:tabfirst<Cr>4gt
  imap <D-5> <esc>:tabfirst<Cr>5gt
  imap <D-6> <esc>:tabfirst<Cr>6gt
  imap <D-7> <esc>:tabfirst<Cr>7gt
  imap <D-8> <esc>:tabfirst<Cr>8gt
  imap <D-9> <esc>:tabfirst<Cr>9gt

  " Remap Command-T to Command-Shift-T
  macmenu &File.New\ Tab key=<D-S-t>

  " Delete keyboard shortcut for print
  macmenu &File.Print key=<nop>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " NERDTree toggle via Command-D
  map <D-d> :NERDTreeToggle<CR>
endif
