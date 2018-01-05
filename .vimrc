version 8.0

set number
set nobackup
set noswapfile
set list
" set listchars=tab:▸\ ,trail:·,
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
set synmaxcol=200
set ttyfast
set ttyscroll=3
set lazyredraw
set t_Co=256
set hlsearch
set wildmenu
set showmatch
set colorcolumn=80

set complete=.,w,b,u,t,i,kspell

set spelllang=en_us " ]S + z=

set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf

filetype plugin indent on

let loaded_matchparen = 1 " Do not highlight matching parens

" netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4 " open in previous window
let g:netrw_winsize = 50

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


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

" Use python/perl like regex
nnoremap / /\v
vnoremap / /\v

"nnoremap ; :
map Y y$

nmap <leader>l :setlocal number!<CR>:setlocal relativenumber!<CR>
nmap <leader>o :set paste!<CR>
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>


" easier window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" easier buffer navigation
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Highlight lines longer than 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%82v', 100)

" Autocommands {{{1
if has("autocmd")
  autocmd FileType vim setlocal foldmethod=marker
  autocmd BufNewFile,BufRead *.slim set ft=slim
  autocmd BufNewFile,BufRead *.slimbars set ft=slim
  autocmd BufNewFile,BufRead *.hbs set ft=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
  autocmd BufRead,BufNewFile *.scss,*.scss.erb set filetype=scss.css
  " Auto resize splits, if vim is resized
  autocmd VimResized * wincmd =

  " Large files: http://vim.wikia.com/wiki/Open_big_files_and_work_fast
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile 
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
  augroup END

  function LargeFile()
    " no syntax highlighting etc
    set eventignore+=FileType
    " save memory when other file is viewed
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " no undo possible
    setlocal undolevels=-1
    " display message
    autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
  endfunction
end

" Vundle {{{1
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'msanders/snipmate.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'
Plugin 'slim-template/vim-slim'
Plugin 'gaogao1030/vim-slimbars'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'robertmeta/nofrils'
Plugin 'rust-lang/rust.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" Ag setup for ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme nofrils-dark
