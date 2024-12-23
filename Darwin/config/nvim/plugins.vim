call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'ervandew/supertab'                " tab completion
Plug 'yggdroot/indentline'              " show verticl line at each indent

Plug 'tpope/vim-commentary'             " comment out target line
Plug 'tpope/vim-endwise'                " auto insert end tag

Plug 'neomake/neomake'                  " style checker
Plug 'davidhalter/jedi-vim'             " autocomplete

Plug 'digitaltoad/vim-jade'             " jade template
Plug 'elixir-lang/vim-elixir'           " elixir
Plug 'avdgaag/vim-phoenix'              " phoenix support

Plug 'bling/vim-bufferline'             " bufferline
Plug 'vim-airline/vim-airline'          " airlne
Plug 'vim-airline/vim-airline-themes'   " airline themes
" Plug 'challenger-deep-theme/vim'
Plug 'arcticicestudio/nord-vim'         " nord theme

Plug 'airblade/vim-gitgutter'           " git
Plug 'mileszs/ack.vim'                  " search enhance

Plug 'Raimondi/delimitMate'             " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tfnico/vim-gradle'                " vim gradle support
Plug 'Scuilion/gradle-syntastic-plugin' " vim syntactic

Plug 'github/copilot.vim'               " github copilot

call plug#end()

colorscheme nord

if has('nvim') || has('termguicolors')
  set termguicolors
endif

let g:lightline = { 'colorscheme': 'nord'}

let g:airline_powerline_fonts = 1
let g:airline_detect_paste    = 1
let g:airline_detect_crypt    = 1

let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#branch#enabled        = 1
let g:airline#extensions#bufferline#enabled    = 1
let g:airline#extensions#branch#vcs_priority   = ["git", "mercurial"]
let g:airline#extensions#syntastic#enabled     = 1
let g:airline#extensions#whitespace#checks     = ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#tabline#enabled       = 1

let g:syntastic_java_checkers                  =['javac']
let g:syntastic_java_javac_config_file_enabled = 1

let g:ctrlp_dotfiles = 1

" vinegar settings
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

nmap <silent> <C-p> :FZF<cr>
