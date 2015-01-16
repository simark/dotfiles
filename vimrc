" Enable syntax highlight
syntax on

" Highlight current search
set hlsearch
" Incremental search
set incsearch

" Enable mouse !
set mouse=a

" Saner backspace behavior
set backspace=indent,eol,start

" Enable completion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

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


