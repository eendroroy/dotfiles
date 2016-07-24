" Map more leader keys
let mapleader=","
let g:mapleader=","

" Load plugins
source ~/.config/nvim/plugins.vim

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
" set ruler               " Show the line and column numbers of the cursor.
set number
set autoread            " Detect when a file changed
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
" set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set cursorline
set tabstop=4           " tab size"

set textwidth=120
set showbreak=↪
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

nmap <silent> <leader>k :NERDTreeToggle<cr> " Toggle NERDTree
nmap <silent> <leader>l :NERDTreeFind<cr> " Toggle NERDTree
nmap <silent> <leader>e :bnext<cr>          " switch to nex buffer
nmap <silent> <leader>w :bprevious<cr>      " switch to previous buffer

