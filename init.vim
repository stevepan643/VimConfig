" ===========================
" 基础设置
" ===========================
set nocompatible
filetype plugin indent on
syntax on
set runtimepath^=~/.config/vim

set number
set relativenumber

" Tab 设置（Rust 默认用 tab=8）
set noexpandtab
set tabstop=8
set shiftwidth=8
set softtabstop=8
autocmd FileType * setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

colorscheme flexoki_dark

" ===========================
" 插件
" ===========================
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

Plug 'puremourning/vimspector'
Plug 'bujnlc8/vim-translator'

" LSP + Completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'

call plug#end()

" ===========================
" Vimwiki
" ===========================
let g:vimwiki_list = [{
	\ 'path': '~/Documents/Obsidians',
	\ 'syntax': 'markdown',
	\ 'ext': '.md'
	\ }]

" Airline 标签栏
let g:airline#extensions#tabline#enabled = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ===========================
" Rust LSP (rust-analyzer)
" ===========================
let g:lsp_auto_enable = 1

if executable('rust-analyzer')
	augroup LspRust
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'rust-analyzer',
			\ 'cmd': {server_info -> ['rust-analyzer']},
			\ 'allowlist': ['rust'],
			\ })
	augroup END
endif

" ===========================
" Completion (asyncomplete)
" ===========================
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

inoremap <expr> <Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>     pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

augroup AsyncompleteClose
	autocmd!
	" popup close fix
	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" ===========================
" Man page support
" ===========================
runtime! ftplugin/man.vim
set keywordprg=:Man

" ===========================
" Claude Terminal
" ===========================
function! RunClaude()
	botright vertical terminal claude --model qwen3-coder-plus
	vertical resize 65
	wincmd h
endfunction

command! Claude call RunClaude()

