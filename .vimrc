version 6.0

syntax on
" Preferences {{{1

set background=dark

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
set backspace=indent,eol,start

set noerrorbells
set visualbell
set t_vb=

set nobackup
set noswapfile 

set showmatch

set foldenable
set foldlevelstart=0
set foldnestmax=2
set foldmethod=indent

set list
"set listchars=tab:▸\ ,trail:.
set listchars=tab:▸\ ,trail:·

set title   " Show filename in title

if exists('+colorcolumn')
    let &colorcolumn="80,".join(range(120,256),",")
    hi ColorColumn ctermbg=darkgrey guibg=lightgrey
else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" always show statusline
set laststatus=2

set pastetoggle=<F12>

" Mappings {{{1
let mapleader="," 
nnoremap ; :
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> za
nmap :W :w
map  <f1>   <nop>
map! <f1>   <nop>
map  <help> <nop>
map! <help> <nop>
map <f2> :FufFile<CR>
map! <f2> :FufFile<CR>
map <f3> :FufBuffer<CR>
map! <f3> :FufBuffer<CR>
nnoremap <silent> <F3> :set list!<CR>
nnoremap <silent> <F4> :nohlsearch<CR>

" Plugins {{{1
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
    Bundle 'elzr/vim-json'
    Bundle 'kshenoy/vim-signature'
    Bundle 'godlygeek/tabular'
    Bundle 'slim-template/vim-slim'
    Bundle 'rust-lang/rust.vim'

    " Gist
    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/gist-vim'

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" Autocommands {{{1
if has("autocmd")
    filetype plugin indent on     " required by vundle

    autocmd FileType vim setlocal foldmethod=marker et
    autocmd FileType html setlocal ts=2 sts=2 sw=2 tw=0 et
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 tw=0 et
    autocmd FileType eruby setlocal ts=2 sts=2 sw=2 tw=0 et
    autocmd FileType make setlocal ts=8 sts=8 sw=8 tw=8 noet
    autocmd BufNewFile,BufRead *.slimbars set filetype=slim
    autocmd FileType vim setlocal foldmethod=marker
end

let g:airline_powerline_fonts = 1

if has('gui_running')
  set guioptions-=TmrL  " no (toolbar, menu, right and left scrollbar)
  colorscheme elflord
endif

" Setup gist {{{1
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1

" ctrl-p {{{1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|gems)$'

" Fix colors for gnome-terminal {{{1
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
