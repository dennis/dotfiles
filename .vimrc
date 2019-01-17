version 8.0

set number
set nobackup
set noswapfile
" set list
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

filetype on
filetype plugin indent on
filetype indent on

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

map <leader>l :setlocal number!<CR>:setlocal relativenumber!<CR>
map <leader>o :set paste!<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>rf i# frozen_string_literal: true<CR>
map <leader>rp irequire "pry"; binding.pry<CR>
map <leader>rs! :call RunLastFailure()<CR>
map <leader>rs$ :call RunLastSpec()<CR>
map <leader>rs. :call RunCurrentSpecFile()<CR>
map <leader>rs<space> call RunNearestSpec()<CR>
map <leader>rse :call VsplitSpec()<CR>
map <leader>vh :HardTimeToggle<Cr>
map <leader>ea=      :Align =<CR>
map <leader>ea>      :Align =><CR>
map <leader>ea{      :Align {<CR>
map <leader>n :call RenameFile()<cr>

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
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-markdown'
Plugin 'msanders/snipmate.vim'
" Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'
" Plugin 'slim-template/vim-slim'
" Plugin 'gaogao1030/vim-slimbars'
" Plugin 'pangloss/vim-javascript'
" Plugin 'cakebaker/scss-syntax.vim'
Plugin 'robertmeta/nofrils'
" Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-surround'  " cs"' (change " to ')
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sheerun/vim-polyglot' " Syntax files
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'romainl/vim-cool' " Turn off hlsearch when 'done'
Plugin 'vim-scripts/Align'
Plugin 'mattn/emmet-vim'
Plugin 'takac/vim-hardtime'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock' " adds ar and ir textobj
Plugin 'thoughtbot/vim-rspec'

function! OpenSpec()
  let repl = substitute(substitute(expand('%'), '\.rb', '', ''), "lib/", "spec/", "")
  let path = repl . '_spec.rb'
  exec('tabe ' . path)
endfunction

function! RunLastFailure()
  exec('!bundle exec rspec --next-failure')
endfunction

function! VsplitSpec()
  let repl = substitute(substitute(substitute(expand('%'), '\.rb', '', ''), "lib/", "spec/", ""), "app/", "spec/", "")
  let path = repl . '_spec.rb'
  let folder = fnamemodify(path, ":p:h")
  echom folder
  silent exec('!mkdir -p ' . folder)
  exec('vsplit ' . path)
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" Hardtime
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1

" Ag setup for ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" rspec setup
let g:rspec_command = "!bundle exec rspec {spec}"

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme nofrils-dark
  let g:CoolTotalMatches = 1

