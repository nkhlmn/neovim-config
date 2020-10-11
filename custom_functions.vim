" Compile .less files on save:
function! CompileLessFile()
  let current = expand('%')                 " Path to current .less file's name
  let target = expand('%:r').".css"         " Path to target .css file
  let shell_command = "!lessc ".current." ".target
  echo "Compiling less file..."
  if (executable('lessc'))                  " Check if less compiler is install
    execute shell_command
  endif
endfunction

" Call CompileLessFile() after writing a file or buffer with .less extension
autocmd FileWritePost,BufWritePost *.less :call CompileLessFile()


" Toggle diff:
function! ToggleDiff()
  if (&diff == 0)
    execute "windo diffthis"
  else
    execute "windo diffoff"
  endif
endfunction

nmap <silent> <leader>d :call ToggleDiff()<CR>
nmap <leader>D :diffs

function! FormatJSON()
  execute "%!python -m json.tool"
endfunction

command FormatJSON call FormatJSON()
