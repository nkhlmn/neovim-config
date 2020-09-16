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
set laststatus=2                  "Always show statusline
" set showmatch
set noshowmode                    " Hides default status text for current mode
set showcmd                       " Show incomplete commands
set clipboard=unnamed             " Lets you copy text from outside vim and use the 'p' command to paste it
set autochdir
set hidden

set path+=**                      " Search down into subfolders/Enables tabbing
set wildmenu                      " Command line completion
" set wildmode=longest:list,full    " Complete files like a shell
set wildoptions=pum
set ignorecase                    " Make search case insensitive
set hlsearch                      " make search highlight all matches
set incsearch                     " start search immediately after typing
set diffopt+=vertical
" nnoremap * *N

set foldmethod=indent             " Code folding
set foldlevel=99


" Backup files
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" NETRW
let g:netrw_liststyle = 3
set splitbelow
set splitright

" Indentline

let g:indentLine_fileTypeExclude = ['json', 'markdown']   " Prevent concealing characters in certain filetypes
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 11
" let g:indentLine_char = '|'
