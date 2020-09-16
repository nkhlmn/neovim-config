let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveStatusline'
      \ },
      \ }

if colors_name == 'ayu'
  let g:lightline.colorscheme = 'ayu'
endif

if colors_name == 'gruvbox-material'
  let g:lightline.colorscheme = 'gruvbox_material'
endif

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction
