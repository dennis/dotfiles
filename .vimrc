version 6.0

set number
set nobackup
set noswapfile
set list
set listchars=tab:▸\ ,trail:·,
set ttyfast
set hidden
set nowrap
set autoindent
set copyindent
set title
set relativenumber
set expandtab
set ts=2 sts=2 sw=2 tw=0
set showcmd

set complete=.,w,b,u,t,i,kspell

set spelllang=en_us " ]S + z=

filetype plugin indent on

" Key mappings {{{1

" hopefully I'll learn use VIM properly
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
nnoremap <Home> <nop>
nnoremap <End> <nop>
vnoremap <PageUp> <nop>
vnoremap <PageDown> <nop>
vnoremap <Home> <nop>
vnoremap <End> <nop>

nnoremap ; :

" easier window navigation
map <C-h> <C-w> h
map <C-j> <C-w> j
map <C-k> <C-w> k
map <C-l> <C-w> l

" easier buffer navigation
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

cmap w!! w !sudo tee % >/dev/null

" Highlight lines longer than 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%82v', 100)

" Autocommands {{{1
if has("autocmd")
  autocmd FileType vim setlocal foldmethod=marker
  autocmd BufNewFile,BufRead *.slim set ft=slim
  autocmd BufNewFile,BufRead *.slimbars set ft=slim
end

" Fix colors for gnome-terminal {{{1
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Vundle {{{1
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'msanders/snipmate.vim'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'

" Add ctrlp?

" Syntax:
Plugin 'slim-template/vim-slim'
Plugin 'gaogao1030/vim-slimbars'
call vundle#end()            " required
filetype plugin indent on    " required
