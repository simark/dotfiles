" Disable vi compatibility mode (shouldn't be needed in a .vimrc, but would be
" needed is this file is used with vim -u).
set nocompatible

" Disable filetype temporarily (needed by Vundle), it is re-enabled later.
filetype off

" Vundle initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'

call vundle#end()

" Search settings
set hlsearch " highlight
set incsearch " incremental
set ignorecase " ignore case...
set smartcase " unless there is a capital letter in the search term

" Show line numbers
set number

" Indentation
set autoindent
set noexpandtab
set tabstop=8
set softtabstop=8

" Enable mouse !
set mouse=a

" Saner backspace behavior
set backspace=indent,eol,start

" Enable completion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Enable syntax highlight
syntax on

" Status line
set laststatus=2
set statusline=%<%f\ " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y] " Filetype
set statusline+=\ [%{getcwd()}] " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
