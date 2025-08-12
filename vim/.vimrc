" General settings
syntax on
set number
set relativenumber
set clipboard=unnamedplus
set shell=/bin/zsh

let mapleader = " "

" 256 colours
set t_Co=256

" Search settings
set hlsearch
set incsearch

" Tabs & indentation
filetype plugin indent on
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set nowrap

" Interactions
set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set nocompatible
set backspace=2

" Visual decorations
set laststatus=2
set showmode
set showcmd
set modeline
set ruler
set title

" Auto commands
augroup autosourcing
   autocmd! 
   autocmd BufWritePost .vimrc source %
augroup END

" Mappings
nmap ,ev :tabedit $MYVIMRC<cr>
nmap ,<space> :nohlsearch<cr>
