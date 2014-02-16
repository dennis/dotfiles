version 6.0

syntax on
set nocompatible
set autoindent
set copyindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set smarttab
set modeline
set modelines=4
set number
set hidden 
set hlsearch
set incsearch

set nobackup
set noswapfile 

set list
set listchars=tab:▸\ ,eol:¬,trail:.

nmap :W :w
map  <f1>   <nop>
map! <f1>   <nop>
map  <help> <nop>
map! <help> <nop>
map <f2> :FufFile<CR>
map! <f2> :FufFile<CR>
map <f3> :FufBuffer<CR>
map! <f3> :FufBuffer<CR>

set title   " Show filename in title

nnoremap ; :
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" always show statusline
set laststatus=2

"
" vundle
"
filetype off " required by vundle

" from http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle 'L9'
    Bundle 'FuzzyFinder'
    Bundle "pangloss/vim-javascript"
    Bundle "tpope/vim-rails"
    Bundle "tpope/vim-bundler"
    Bundle "tpope/vim-fugitive"
    Bundle "kien/ctrlp.vim"
    " ctrl-r <tab>
    Bundle "msanders/snipmate.vim" 
    Bundle 'bling/vim-airline'
    Bundle "tpope/vim-endwise"
    Bundle 'ngmy/vim-rubocop'
    Bundle 'tpope/vim-haml'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required by vundle
autocmd FileType html setlocal ts=2 sts=2 sw=2 tw=0 et
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 tw=0 et
autocmd FileType make setlocal ts=8 sts=8 sw=8 tw=8 noet

let g:airline_powerline_fonts = 1
