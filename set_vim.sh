#!/bin/bash

mkdir -p $HOME/.vim

# ref. https://github.com/VundleVim/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
#git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim
#git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

cat > .vimrc << EOF
set ai
set nu
set nocompatible
set vb
set showmatch
set binary noeol
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
set foldmethod=marker
" set runtimepath^=~/.vim/bundle/ctrlp.vim
syntax on


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'L9'
Plugin 'jshint.vim'
Plugin 'javascript.vim'
Plugin 'jade.vim'
Plugin 'vim-coffee-script'
Plugin 'vim-stylus'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'JavaScript-Indent'
Plugin 'snipMate'
Plugin 'Tagbar'
Plugin 'node.js'
"Plugin 'Command-T'
"Plugin 'FuzzFinder'
Plugin 'ctrlp.vim'
Plugin 'The-NERD-tree'
Plugin 'Syntastic'
Plugin 'ekini-dark-colorscheme'


filetype plugin indent on
" au filetype javascript set dictionary+=$HOME/.vim/dict/node.dict

let g:JSLintHighlightErrorLine = 0
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nnoremap ,b :CommandTBuffer<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" Split Window MOVE
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
EOF
