" Disable vi compatibility mode (shouldn't be needed in a .vimrc, but would be
" needed is this file is used with vim -u).
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            " required

filetype indent plugin on

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
set softtabstop=2
set shiftwidth=2

" Enable mouse !
set mouse=a

" Saner backspace behavior
set backspace=indent,eol,start

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

" How to complete when pressing tab in "command" mode
set wildmode=longest,list,full
set wildmenu

" Highlight stupid non break space
au VimEnter,BufWinEnter * syn match ErrorMsg " "

nmap <F3> :YcmCompleter GoToDefinition<CR>
nmap <Leader>n :lnext<CR>

" When doing "enter" while writing a C function call, align with open
" parenthesis.
set cino+=(0

" Curly brace indented once compared to "if".
set cino+={1s

" Content indented twice comnpared to "if".
set cino+=>2s,

" ... except if there's no curly braces.
set cino+=n-2

" For functions.
set cino+=^-2

" Function return types at column 0.
set cino+=t0

" Line continuation.
set cino+=+2

" Continuation in unclosed parenthesis, in expressions.
set cino+=(0
set cino+=u0
set cino+=w1
set cino+=m1

let g:ycm_always_populate_location_list = 1
