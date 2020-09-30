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
" set backupdir=~/.config/nvim/backup//
set nobackup
" set directory=~/.config/nvim/swap//
set noswapfile
" set undodir=~/.config/nvim/undo//
set noundofile

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


" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.tsserver.setup({ on_attach=on_attach })
nvim_lsp.html.setup({ on_attach=on_attach })
nvim_lsp.vimls.setup({ on_attach=on_attach })

EOF

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
