version 6.0

syntax on
set nocompatible
set autoindent
set sw=4
set ts=4
set shiftround
set modeline
set modelines=4
set number

nmap :W :w
map  <f1>   <nop>
map! <f1>   <nop>
map  <help> <nop>
map! <help> <nop>
map <f2> :FufFile<CR>
map! <f2> :FufFile<CR>
map <f3> :FufBuffer<CR>
map! <f3> :FufBuffer<CR>

set title	" Show filename in title

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
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required by vundle
