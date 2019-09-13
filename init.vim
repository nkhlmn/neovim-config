"------------------------------------------------------
"                MINPAC PLUGIN MANAGER
"------------------------------------------------------
" Setup minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

" Misc
call minpac#add('airblade/vim-gitgutter')
call minpac#add('ervandew/supertab')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('mkitt/tabline.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('suy/vim-context-commentstring')
call minpac#add('w0rp/ale')
call minpac#add('Yggdroot/indentLine')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

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
call minpac#add('nikhilkamineni/vim-gruvbox8', {'type':'opt'})
call minpac#add('nikhilkamineni/Spacegray.vim', {'type':'opt'})
call minpac#add('arcticicestudio/nord-vim', {'type':'opt'})
call minpac#add('kaicataldo/material.vim', {'type':'opt'})
call minpac#add('ntk148v/vim-horizon', {'type':'opt'})

" Minpac shortcuts
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


"-----------------------------------
"             FZF CONFIG
"-----------------------------------
if has('unix')
  set rtp+=~/.fzf
endif

if has('macunix')
  set rtp+=/usr/local/opt/fzf
endif

noremap <silent> <C-p> :GFiles<CR>
noremap <silent> <C-P> :Files<CR>
noremap <silent> <C-f> :Ag<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <silent> <C-s> :Lines<CR>


"-----------------------------------
"              PYTHON
"-----------------------------------
" Initial setup for creating a dedicated virtual env for neovim:
"   - Create a virtualenv inside neovim's config folder:
"         `$ PIPENV_VENV_IN_PROJECT=true pipenv --python 3.7.2`
"   - Install packages listed in the Pipfile
"         `$ pipenv install

" Set the path of the python host to the local virtualenv
let g:python3_host_prog = expand('$HOME/.config/nvim/.venv/bin/python3')


"-----------------------------------
"              MISC
"-----------------------------------
syntax on
filetype plugin on
set number
set conceallevel=0
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
set laststatus=2        "Always show statusline
set termguicolors
set showmatch
set noshowmode          " Hides default status text for current mode
set ttyfast             " Faster redrawing
" set lazyredraw
set showcmd             " Show incomplete commands
set clipboard=unnamed   " Lets you copy text from outside vim and use the 'p' command to paste it
set autochdir
" set hidden

" Toggle line numbers
map <leader>n :set invnumber<CR>

" Prevent concealing characters in certain filetypes
let g:indentLine_fileTypeExclude = ['json', 'markdown']


"-------------------------------------------------------------
"                       CODE FOLDING
"-------------------------------------------------------------
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


"---------------------------------------------------------------
"                       FINDING FILES
"---------------------------------------------------------------
set path+=**                      " Search down into subfolders/Enables tabbing
set wildmenu                      " Command line completion
set wildmode=longest:list,full    " Complete files like a shell
set ignorecase                    " Make search case insensitive
set hlsearch                      " make search highlight all matches
set incsearch                     " start search immediately after typing
set diffopt+=vertical
nnoremap * *N

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Clear highlighted search items by double pressing ESC
nnoremap <silent> <ESC><ESC> :let @/ = ""<cr>


"--------------------------------------------------------------
"                         TABLINE
"--------------------------------------------------------------
set showtabline=2


"----------------------------------------------------
"               THEME RELATED
"----------------------------------------------------
set background=dark
" set cursorline
let &t_ut=''

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
" let g:spacegray_low_contrast = 1

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
colorscheme spacegray

"Set options for each theme
if g:colors_name == "gruvbox8"
  let g:airline_theme="hybrid"
endif

if g:colors_name == "spacegray"
  let g:airline_theme="zenburn"
endif


"---------------------------------------------------------------
"              SET SWAP/UNDO/BACKUP FILES LOCATION
"---------------------------------------------------------------
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//


"----------------------------------------------------------------
"                     EXPLORER SHORTCUTS
"----------------------------------------------------------------
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :Vexplore<CR>
" map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
" map <silent> <Leader>t :Texplore<CR>
set splitbelow
set splitright


"------------------------------------------------------------------
"                             TABS
"------------------------------------------------------------------
map  <silent> <Leader>t :tabnew <bar> GFiles<CR>
imap <silent> <Leader>t :tabnew <bar> GFiles<CR>
map  <silent> <Leader>T :tabnew <bar> Explore<CR>
imap <silent> <Leader>T :tabnew <bar> Explore<CR>

map  <silent> <Leader>s :split <bar> GFiles<CR>
imap <silent> <Leader>s :split <bar> GFiles<CR>
map  <silent> <Leader>S :split <bar> Files<CR>
imap <silent> <Leader>S :split <bar> Files<CR>

map  <silent> <Leader>v :vsplit <bar> GFiles<CR>
imap <silent> <Leader>v :vsplit <bar> GFiles<CR>
map  <silent> <Leader>V :vsplit <bar> Files<CR>
imap <silent> <Leader>V :vsplit <bar> Files<CR>

nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


"------------------------------------------------------------------
"                    INTEGRATED TERMINAL
"------------------------------------------------------------------
" Enter insert mode when switching to terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" Shortcuts for opening a new terminal window and setting the size
map <silent> <leader>c :split <bar> :res 15 <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>
map <silent> <leader>C :vsplit <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>

" Map some normal mode shortcuts so the they work the same in the intergrated terminal
tnoremap <C-h> <C-\><C-n> <bar> :tabnext<CR>
tnoremap <C-l> <C-\><C-n> <bar> :tabprevious<CR>
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-w><C-l> <C-\><C-n><C-w>l


"------------------------------------------------------------------
"                           ALE
"------------------------------------------------------------------
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'c': ['clang-format', 'trim_whitespace'],
\  'css': ['prettier'],
\  'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
\  'html': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'],
\  'json': ['prettier', 'fixjson', 'trim_whitespace'],
\  'less': ['prettier', 'trim_whitespace'],
\  'markdown': ['prettier'],
\  'python': ['autopep8', 'isort','remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint']
\}

map <Leader>f :ALEFix<CR>
map <Leader>a :ALEToggle<CR>
map <Leader>A :ALEDetail<CR>


"------------------------------------------------------------------
"                       EMMETT
"------------------------------------------------------------------
let g:user_emmet_leader_key='<C-e>'


"------------------------------------------------------------------
"                       SUPERTAB
"------------------------------------------------------------------
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"


"-------------------------------------------------------------------
"             AUTO COMPILE LESS FILES ON SAVE
"-------------------------------------------------------------------
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

