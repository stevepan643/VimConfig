set runtimepath^=~/.config/vim

set nocompatible

call plug#begin()

Plug 'sheerun/vim-polyglot'

call plug#end()

set number
set relativenumber

filetype plugin indent on
syntax on

set noexpandtab
set tabstop=8
set shiftwidth=8
set softtabstop=8

colorscheme flexoki_light

autocmd FileType * setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

" set hidden
" set showtabline=2

runtime! ftplugin/man.vim
