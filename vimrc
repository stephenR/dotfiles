set nocompatible              " be iMproved, required
filetype off                  " required

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/autoload_cscope.vim'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'tpope/vim-sleuth'
Plugin 'Raimondi/delimitMate'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=8
set softtabstop=2
set expandtab
set shiftwidth=2
set wildmenu
set wildmode=longest,longest:full,full
set mouse=a
set splitbelow
set splitright
set wildignore+=*.o,*.obj,.git,*.class,*.html,*.pyc
set relativenumber
set number
setglobal relativenumber

"search
set noincsearch
set ignorecase
set smartcase

"folding
set foldmethod=syntax
set foldlevel=4
"set nofoldenable

"indentation
"set autoindent
"set cindent

set virtualedit=all
"set showbreak=\ \ 
"set showcmd
set list listchars=tab:➔·,trail:.,extends:>

"undo
set undodir=~/.vim/undofiles
set undofile

"always show the statusline
set laststatus=2

"make i_<C-U> and i_<C-W> undoable
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"tab mappings
nnoremap <Leader>tk :tabr<cr>
nnoremap <Leader>tj :tabl<cr>
nnoremap <Leader>th :tabp<cr>
nnoremap <Leader>tl :tabn<cr>

"nerd tree
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>nm :NERDTreeMirror<cr>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeMinimalUI=1

"tagbar
nnoremap <Leader>tb :TagbarToggle<cr>
let g:tagbar_compact=1

command W w !sudo tee % > /dev/null

"gundo
nnoremap <Leader>gu :GundoToggle<cr>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

"solarized
"set background=dark
"colorscheme solarized

" configure delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

let g:UltiSnipsExpandTrigger="<c-j>"

au BufRead,BufNewFile *.asm set filetype=nasm
