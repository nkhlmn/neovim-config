" VIMPLUG:                                                                   {{{

" Install vimplug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged') " Start loading plugins

"---------- Misc ----------"
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'suy/vim-context-commentstring'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---------- tpope ----------"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

"------ Colorschemes ------"
Plug 'ajh17/Spacegray.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'sainnhe/gruvbox-material'

call plug#end() " End loading plugins

"                                                                            }}}

" MISC: {{{
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

"}}}

" CoC: {{{
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

" }}}

" NETRW: {{{

let g:netrw_liststyle = 3

" EXPLORER SHORTCUTS
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :Vexplore<CR>
" map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
" map <silent> <Leader>t :Texplore<CR>
set splitbelow
set splitright

" }}}

" CODE FOLDING: {{{

set foldmethod=indent
set foldlevel=99

autocmd Filetype vim setlocal foldmethod=marker

nnoremap <space> za

" }}}

" FINDING FILES: {{{

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

" }}}

" COLORSCHEME: {{{

"spacegray
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 1

"srcery
let g:srcery_italic = 1
let g:srcery_inverse = 0
let g:srcery_inverse_matches = 1
let g:srcery_inverse_match_paren = 1

"gruvbox-material
let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_disable_italic_comment = 1

" colorscheme here
colorscheme gruvbox-material


if g:colors_name == "spacegray"
  let g:airline_theme="zenburn"
  hi SignColumn guibg=NONE
  hi LineNr guibg=NONE
endif

if g:colors_name == "material-dark"
  let g:airline_theme="gruvbox_material"
endif

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" }}}

" SWAP/UNDO/BACKUP: {{{

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" }}}

" TABS: {{{

map  <silent> <Leader>t :tabnew <bar> call OpenFileSearch()<CR>
map  <silent> <Leader>T :tabnew <bar> Explore<CR>

map  <silent> <Leader>s :split <bar> call OpenFileSearch()<CR>
map  <silent> <Leader>S :split <bar> Explore<CR>

map  <silent> <Leader>v :vsplit <bar> call OpenExploreearch()<CR>
map  <silent> <Leader>V :vsplit <bar> Explore<CR>

nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" }}}

" INTEGRATED TERMINAL: {{{

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

" }}}

" CUSTOM FUNCTIONS: {{{1

" Compile .less files on save: {{{2

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

" }}}2

" Toggle diff: {{{2

function! ToggleDiff()
  if (&diff == 0)
    execute "windo diffthis"
  else
    execute "windo diffoff"
  endif
endfunction

nmap <silent> <leader>d :call ToggleDiff()<CR>
nmap <leader>D :diffs

" }}}2

" Source config on save: {{{2

augroup vimrc     " Source vim configuration upon save
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END

if !exists(':Nvrc')
  command Nvrc tabnew $MYVIMRC
endif

" }}}2

"                   }}}1
