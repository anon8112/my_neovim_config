set nocompatible
" Plugins
call plug#begin('~/.local/share/nvim/plugged')


Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'digitaltoad/vim-pug'
Plug 'zchee/deoplete-jedi'

call plug#end()

" General
set clipboard=unnamed

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2

" Colors
if (has("termguicolors"))
 set termguicolors
endif

colorscheme zenburn

highlight clear SignColumn

" Plugin conf

"	deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = "$HOME/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_src_path = "$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

" 	neomake

autocmd! BufWritePost *.cpp *.ts Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

"	java
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" 	rust
autocmd! BufWritePost *.rs NeomakeProject cargo
command CargoBuild execute "!cargo build"
command Cargo execute "!cargo run"
