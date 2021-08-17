" Source config on save:
augroup vimrc     " Source vim configuration upon save
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END


" Set filetype correctly for .conf files
autocmd BufNewFile,BufRead *.conf set filetype=conf


" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" autocmd Filetype vim setlocal foldmethod=marker
" autocmd Filetype conf setlocal foldmethod=marker

" Enter insert mode when switching to terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert
