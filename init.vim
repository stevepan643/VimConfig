set runtimepath^=~/.config/vim

set nocompatible
filetype plugin on

let g:vimspector_enable_mappings = 'HUMAN'


call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

Plug 'puremourning/vimspector'
Plug 'bujnlc8/vim-translator'

call plug#end()

set number
set relativenumber

filetype plugin indent on
syntax on

set noexpandtab
set tabstop=8
set shiftwidth=8
set softtabstop=8

colorscheme flexoki_dark

autocmd FileType * setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

" set hidden
" set showtabline=2

runtime! ftplugin/man.vim

set keywordprg=:Man

function! RunClaude()
	botright vertical terminal claude --model qwen3-coder-plus
	vertical resize 65
	wincmd h
endfunction

command! Claude call RunClaude()

let g:airline#extensions#tabline#enabled = 1
let g:vimwiki_list = [{'path': '~/Documents/Obsidians',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
