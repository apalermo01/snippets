"other vimrcs that this was inspired by:
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

"plugins
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'preservim/nerdtree'
Plug 'victor-iyi/commentary.vim'
Plug 'nvie/vim-flake8'
Plug 'nocksock/python-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let mapleader = ","

"always show current position
set ruler

set encoding=utf8

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set smarttab
set shiftwidth=4
set tabstop=4
set scrolloff=10
set incsearch
set showcmd
set showmode
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
colorscheme gruvbox
"colorscheme wal
set bg=dark
noremap oo o<Esc>k
noremap OO O<ESC>j
autocmd VimEnter * NERDTree | wincmd p

"nerdtree
" exit vim in NERDTree is the only window remaining
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:python_highlight_all = 1 


"tabs
"https://webdevetc.com/blog/tabs-in-vim/
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>t<leader> :tabnext
nnoremap <leader>tm :tabmove
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>

"better way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" fast quit / save
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

