"
map <C-s> :w<CR>

" prevent ex mode
map Q <Nop>

" Toggle line numbers
map <leader>n :set number!<CR>

" Yank entire buffer
nmap <leader>y :%y<CR>

" Clear highlighted search items by double pressing ESC
nnoremap <silent> <ESC><ESC> :let @/ = ""<cr>

" TABS
map  <silent> <Leader>t :tabnew <CR>
map  <silent> <Leader>s :snew <CR>
map  <silent> <Leader>v :vnew <CR>
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>

nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Integrated Terminal
" Shortcuts for opening a new terminal window and setting the size
map <silent> <leader>c :split <bar> :res 15 <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>
map <silent> <leader>C :vsplit <bar> :set nonumber <bar> :startinsert <bar> :terminal<CR>

" Map some normal mode shortcuts so the they work the same in the intergrated terminal
" tnoremap <C-h> <C-\><C-n> <bar> :tabnext<CR>
" tnoremap <C-l> <C-\><C-n> <bar> :tabprevious<CR>
" tnoremap <silent> <Esc> <C-\><C-n>
" tnoremap <silent> <C-w><C-j> <C-\><C-n><C-w>j
" tnoremap <silent> <C-w><C-k> <C-\><C-n><C-w>k
" tnoremap <silent> <C-w><C-h> <C-\><C-n><C-w>h
" tnoremap <silent> <C-w><C-l> <C-\><C-n><C-w>l

" Code folding
nnoremap <space> za

map <Leader>` :tabnew $MYVIMRC<CR>

" Explorer shortcuts
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :Vexplore<CR>
" map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
" map <silent> <Leader>t :Texplore<CR>

" FZF

let g:user_emmet_leader_key='<C-E>'
