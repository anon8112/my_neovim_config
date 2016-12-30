set nocompatible
" Plugins
call plug#begin('~/.local/share/nvim/plugged')


Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

call plug#end()
" General
syntax enable
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Colors
if (has("termguicolors"))
 set termguicolors
endif

colorscheme zenburn

highlight clear SignColumn

" Plugin conf

" 	neomake
autocmd! BufReadPost,BufWritePost * Neomake
autocmd BufWritePost *.rs Neomake! cargo

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Fuzzyfinder
set rtp+=~/.fzf


" 	racer-rust
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
let g:racer_experimental_completer = 1
