vim.cmd([[
" Highlight on yank
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

" Notification after file change
autocmd FileChangedShellPost * lua require("notify")("File changed on disk. Buffer reloaded.")
]])

