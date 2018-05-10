call pathogen#helptags()
execute pathogen#infect()
syntax on
set number
" set autochdir
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
set guifont=FiraCode-Retina:h14
set background=dark
set laststatus=2
set t_Co=256
set termguicolors
" set hidden
set showmatch
set noshowmode " Hides default status text for current mode
set ttyfast " Faster redrawing
set lazyredraw
set laststatus=2 "Always show statusline
set clipboard+=unnamedplus

" CODE FOLDING
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" FINDING FILES
set path+=**                " Search down into subfolders/Enables tabbing
set wildmenu                " Command line completion
set wildmode=list:longest   " Complete files like a shell
set ignorecase              " Make search case insensitive
set hlsearch                " make search highlight all matches
set incsearch
set diffopt+=vertical
nnoremap * *N

" TABLINE
set showtabline=2

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" APPEARANCE
" set cursorline
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_warnings = 1
" let g:gruvbox_improved_strings = 1
colorscheme gruvbox

let g:one_allow_italics = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:jellybeans_use_term_italics = 1
let g:spacegray_use_italics = 1

map <Leader>e :Explore<CR>
map <Leader>v :Vexplore<CR>
map <Leader>s :Sexplore<CR>
map <Leader>t :Texplore<CR>
set splitbelow
set splitright

" DIRVISH
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish
command! -nargs=? -complete=dir Texplore tabnew | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore vsplit | silent Dirvish <args>

" RANGER
" let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
" map <leader>t :tabnew <bar> :Ranger<CR>
" map <leader>v :vsplit <bar> :Ranger<CR>
" map <leader>s :split <bar> :Ranger<CR>

" TABS
map <C-t> :tabnew<CR>
imap <C-t> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Terminal
map <silent> <leader>c :split <bar> :terminal<CR> :set nonumber<CR> i
map <silent> <leader>C :vsplit <bar> :terminal<CR> :set nonumber<CR> i
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <C-w><C-l> <C-\><C-n><C-w>l
tnoremap <C-h> <C-\><C-n> <bar> :tabnext<CR>
tnoremap <C-l> <C-\><C-n> <bar> :tabprevious<CR>

" Clear highlighted search items
nnoremap <leader>h :nohlsearch<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 200
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'c': ['clang-format', 'trim_whitespace'],
\  'markdown': ['prettier'],
\  'python': ['autopep8', 'black', 'yapf', 'isort','add_blank_lines_for_python_control_statements']
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
