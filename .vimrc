version 6.0

set number
set nobackup
set noswapfile 
set list
set listchars=tab:▸\ ,trail:·
set ttyfast
set hidden
set nowrap
set autoindent
set copyindent
set title

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

nnoremap ; :

cmap w!! w !sudo tee % >/dev/null

" Autocommands {{{1
if has("autocmd")
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 tw=0 et
    autocmd FileType vim setlocal foldmethod=marker
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

call vundle#end()            " required
filetype plugin indent on    " required

