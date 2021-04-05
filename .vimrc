"" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" MyPlugins
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""

syntax on
colorscheme vgod
set laststatus=2    " show statusline
set number          " show line number
" set cursorline      " show now line
set autoindent
set cindent

" set space
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" fix mac issue
" set backspace=indent,eol,start

" NERDTree
nnoremap <silent> <F6> :NERDTree<CR>

" Window moving
:let mapleader = ","
nmap <silent> <leader><Up> :wincmd k<CR>
nmap <silent> <leader><Down> :wincmd j<CR>
nmap <silent> <leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>
"

" go to prev tab 
map <C-o> gT
" go to next tab
map <C-p> gt
