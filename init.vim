" MINPAC PLUGIN MANAGER "
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

call minpac#add('w0rp/ale')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('mattn/emmet-vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('mkitt/tabline.vim')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('ervandew/supertab')
call minpac#add('lifepillar/vim-cheat40')
call minpac#add('JamshedVesuna/vim-markdown-preview')
call minpac#add('suy/vim-context-commentstring')

" Tpope
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')

" Colorschemes
call minpac#add('nikhilkamineni/vim-gruvbox8')
call minpac#add('nikhilkamineni/Spacegray.vim')
call minpac#add('srcery-colors/srcery-vim')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('nightsense/snow')
call minpac#add('nightsense/stellarized')
call minpac#add('kaicataldo/material.vim')

" Deoplete
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('carlitux/deoplete-ternjs')
call minpac#add('zchee/deoplete-jedi')

" fzf
call minpac#add('junegunn/fzf.vim')

if has('unix')
  set rtp+=~/.fzf
endif

if has('macunix')
  set rtp+=/usr/local/opt/fzf
endif

noremap <silent> <C-p> :GFiles<CR>
noremap <silent> <C-f> :Files<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <silent> <C-m> :Marks<CR>
noremap <silent> <C-s> :Lines<CR>


" Minpac shortcuts
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


syntax on
set number
" set autochdir
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
" set guifont=Hack:h14
set laststatus=2 "Always show statusline
set t_Co=256
set termguicolors
" set hidden
set showmatch
set noshowmode " Hides default status text for current mode
set ttyfast " Faster redrawing
set lazyredraw
set clipboard=unnamed
set showcmd " Show incomplete commands
filetype plugin on

" CODE FOLDING
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" TABLINE
set showtabline=2
" hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" FINDING FILES
set path+=**                " Search down into subfolders/Enables tabbing
set wildmenu                " Command line completion
set wildmode=list:longest   " Complete files like a shell
set ignorecase              " Make search case insensitive
set hlsearch                " make search highlight all matches
set incsearch
set diffopt+=vertical
nnoremap * *N

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


"""""""""""""""""
" THEME RELATED "
"""""""""""""""""
set background=dark
set cursorline
let &t_ut=''

" Srcery
let g:srcery_inverse = 0
let g:srcery_inverse_matches = 1
let g:srcery_italic = 1

" Gruvbox
" let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
" let g:gruvbox_filetype_hi_groups = 1
" let g:gruvbox_plugin_hi_groups = 1
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_strings = 1
" let g:gruvbox_improved_warnings = 1

"Spacegray
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 1
" let g:spacegray_underline_search = 1

"Nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 10
let g:nord_cursor_line_number_background = 1

"Material
let g:material_terminal_italics = 1
let g:material_theme_style = 'dark'

" Set default colorscheme here
colorscheme nord

"Set options for each theme
if g:colors_name == "snow"
  let g:airline_theme="snow_dark"
endif

if g:colors_name == "stellarized"
  let g:airline_theme="stellarized_dark"
endif

if g:colors_name == "gruvbox8"
  let g:airline_theme="hybrid"
endif

if g:colors_name == "spacegray"
  let g:airline_theme="raven"
endif

if g:colors_name == "srcery"
  " Hide '~' end of buffer characters
  highlight EndOfBuffer ctermbg=242 ctermfg=242 guibg=#1C1B19 guifg=#1C1B19 cterm=NONE gui=NONE
endif


" EXPLORER SHORTCUTS
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :Vexplore<CR>
" map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
" map <silent> <Leader>t :Texplore<CR>
set splitbelow
set splitright

" DIRVISH
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish
command! -nargs=? -complete=dir Texplore tabnew | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore vsplit | silent Dirvish <args>
map <silent> <Leader>E :Dirvish %<CR>
map <silent> <Leader>T :tabnew <bar> Dirvish %<CR>
map <silent> <Leader>S :split <bar> Dirvish %<CR>
map <silent> <Leader>V :vsplit <bar> Dirvish %<CR>
" Map gh to toggle show hidden files
nnoremap <buffer> gh :call ToggleDotfiles()<CR>

" TABS
map  <silent> <Leader>t :tabnew <bar> GFiles<CR>
imap <silent> <Leader>t :tabnew <bar> GFiles<CR>
map  <silent> <Leader>s :split <bar> GFiles<CR>
imap <silent> <Leader>s :split <bar> GFiles<CR>
map  <silent> <Leader>v :vsplit <bar> GFiles<CR>
imap <silent> <Leader>v :vsplit <bar> GFiles<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Terminal
map <silent> <leader>c :split <bar> :res 15 <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>
map <silent> <leader>C :vsplit <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-w><C-l> <C-\><C-n><C-w>l
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <C-h> <C-\><C-n> <bar> :tabnext<CR>
tnoremap <C-l> <C-\><C-n> <bar> :tabprevious<CR>

" Clear highlighted search items
nnoremap <silent> <ESC><ESC> :let @/ = ""<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

"""""""
" ALE "
"""""""
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\  'html': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint'],
\  'less': ['prettier', 'trim_whitespace'],
\  'c': ['clang-format', 'trim_whitespace'],
\  'markdown': ['prettier'],
\  'python': ['autopep8', 'black', 'yapf', 'isort','remove_trailing_lines', 'trim_whitespace'],
\  'json': ['prettier', 'fixjson', 'trim_whitespace'],
\  'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_linters = {
\   'python': ['autopep8', 'flake8'],
\   'javascript': ['eslint']
\}
let g:ale_javascript_prettier_options = '--single-quote'
map <Leader>f :ALEFix<CR>
map <Leader>a :ALEToggle<CR>
map <Leader>A :ALEDetail<CR>


" Avoid creating swap files in cwd
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" Fix for auto-pairs when typing '<'
autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">

" EMMETT
let g:user_emmet_leader_key='<C-e>'

" Supertab
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vim Markdown Preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" Deoplete
let g:deoplete#enable_at_startup = 1
if has('unix')
  let g:python3_host_prog = '/usr/bin/python3'
endif
if has('macunix')
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

"""""""""""""""""""""""""""
" LESS Files auto-compile "
"""""""""""""""""""""""""""
" Set up function to Compile less to a css file in the same folder
function! CompileLessFile()
  let current = expand('%') " Path to current .less file's name
  let target = expand('%:r').".css" " Path to target .css file
  let shell_command = "!lessc ".current." ".target
  echo "Compiling less file..."
  if (executable('lessc'))
    execute shell_command
  endif
endfunction

" Call CompileLessFile() after writing a file or buffer with .less extension
autocmd FileWritePost,BufWritePost *.less :call CompileLessFile()
