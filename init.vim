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
set background=dark
set laststatus=2
set t_Co=256
set termguicolors
" set hidden
set showmatch
set noshowmode " Hides default status text for current mode
set ttyfast " Faster redrawing
set laststatus=2 "Always show statusline
set clipboard+=unnamedplus

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
set cursorline
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

let g:one_allow_italics = 1

" let g:netrw_liststyle=3
" let g:netrw_alto = 1
" let g:netrw_altv = 1
" let g:netrw_altfile=0
" let g:netrw_hide=1
map <Leader>e :Explore<CR>
map <Leader>v :Vexplore<CR>
map <Leader>s :Sexplore<CR>
" map <Leader>l :Lexplore<CR>
" map <Leader>r :Rexplore<CR>
map <Leader>t :Texplore<CR>
set splitbelow
set splitright

" DIRVISH
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Texplore tabnew | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore vsplit | silent Dirvish <args>

" TABS
map <C-w><C-t> :tabnew<CR>
imap <C-w><C-t> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Clear highlighted search items
nnoremap <leader>h :nohlsearch<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote'
map <Leader>f :ALEFix<CR>
map <Leader>a :ALEToggle<CR>
map <Leader>A :ALEDetail<CR>

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Avoid creating swap files in cwd
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
