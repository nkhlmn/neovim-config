"------------------------------------------------------
"                MINPAC PLUGIN MANAGER
"------------------------------------------------------
" Setup minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

" Misc
call minpac#add('mattn/emmet-vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('suy/vim-context-commentstring')
call minpac#add('Yggdroot/indentLine')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
" call minpac#add('mkitt/tabline.vim')

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
call minpac#add('nanotech/jellybeans.vim')

" Minpac shortcuts
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


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
set showcmd             " Show incomplete commands
set clipboard=unnamed   " Lets you copy text from outside vim and use the 'p' command to paste it
set autochdir
set hidden

" Toggle line numbers
map <leader>n :set invnumber<CR>

" Prevent concealing characters in certain filetypes
let g:indentLine_fileTypeExclude = ['json', 'markdown']

" Yank entire buffer
nmap <leader>y :%y<CR>

"-------------------------------------------------------------
"                    CoC
"-------------------------------------------------------------
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)et cmdheight=2

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Search/open files
function! OpenFileSearch()
  if exists("b:git_dir")
    execute "CocList gfiles"
  else
    execute "CocList files"
  endif
endfunction

nmap <silent> <C-p> :call OpenFileSearch()<CR>
vmap <silent> <C-p> :call OpenFileSearch()<CR>
nmap <silent> <C-f> :CocList grep<CR>
vmap <silent> <C-f> :CocList grep<CR>
" noremap <silent> <C-b> :Buffers<CR>
" noremap <silent> <C-s> :Lines<CR>


"-------------------------------------------------------------
"                          NETRW
"-------------------------------------------------------------
let g:netrw_liststyle = 3


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
" set wildmode=longest:list,full    " Complete files like a shell
set wildoptions=pum
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
let g:gruvbox_transp_bg = 1
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

" Set options for each theme
 if g:colors_name == "gruvbox8_hard" || g:colors_name == "gruvbox8"
   let g:airline_theme="hybrid"
 endif

if g:colors_name == "spacegray"
  let g:airline_theme="zenburn"
endif

if g:colors_name == "jellybeans"
  hi SignColumn guifg=#777777 guibg=NONE ctermfg=14 ctermbg=242
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
map  <silent> <Leader>t :tabnew <bar> call OpenFileSearch()<CR>
imap <silent> <Leader>t :tabnew <bar> call OpenFileSearch()<CR>
map  <silent> <Leader>T :tabnew <bar> Explore<CR>
imap <silent> <Leader>T :tabnew <bar> Explore<CR>

map  <silent> <Leader>s :split <bar> call OpenFileSearch()<CR>
imap <silent> <Leader>s :split <bar> call OpenFileSearch()<CR>
map  <silent> <Leader>S :split <bar> Explore<CR>
imap <silent> <Leader>S :split <bar> Explore<CR>

map  <silent> <Leader>v :vsplit <bar> call OpenExploreearch()<CR>
imap <silent> <Leader>v :vsplit <bar> call OpenExploreearch()<CR>
map  <silent> <Leader>V :vsplit <bar> Explore<CR>
imap <silent> <Leader>V :vsplit <bar> Explore<CR>

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

"-------------------------------------------------------------------
"                         TOGGLE DIFF
"-------------------------------------------------------------------
function! ToggleDiff()
  if (&diff == 0)
    execute "windo diffthis"
  else
    execute "windo diffoff"
  endif
endfunction

nmap <silent> <leader>d :call ToggleDiff()<CR>
nmap <leader>D :diffs
