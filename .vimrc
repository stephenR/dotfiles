set number
set tags+=tags;/
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/usr_include
set tabstop=4
set shiftwidth=4
"set nohls
set wildmenu
set wildmode=longest:full
set mouse=a
set splitbelow
set splitright
set wildignore+=*.o,*.obj,.git,*.class,*.html,*.pyc

set relativenumber

"search
set noincsearch
set ignorecase
set smartcase

"folding
set foldmethod=syntax
set foldlevel=4

"indentation
set autoindent
set cindent

set virtualedit=all
set listchars=eol:$,tab:\ \ 
set list
set showbreak=\ \ 
set showcmd

"make i_<C-U> and i_<C-W> undoable
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"function! UPDATE_TAGS()
"  let _f_ = expand("%:p")
"  let _resp = system('ctags -a -f /home/tsuro/workspace/tags ' . _f_)
"  unlet _f_
"  unlet _resp
"endfunction
"autocmd BufWrite *.cpp,*.cxx,*.h,*.c call UPDATE_TAGS()

"function! CSCOPE_NEW_FILE()
"	let _cwd_ = getcwd()
"	call system('find ' . _cwd_ . ' -iregex ".*\.\(cpp\|h\|c\)" > cscope.files')
"	unlet _cwd_
"endfunction
function! UPDATE_CSCOPE()
  let _f_ = expand("%:p")
  call system('grep -q "' . _f_ . '" cscope.files')
  if v:shell_error
	  call system('echo "' . _f_ . '" >> cscope.files')
  endif
  call system('cscope -b')
  unlet _f_
endfunction
autocmd BufWritePost *.cpp,*.cxx,*.h,*.c call UPDATE_CSCOPE()

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"tab mappings
nnoremap <C-t>k :tabr<cr>
nnoremap <C-t>j :tabl<cr>
nnoremap <C-t>h :tabp<cr>
nnoremap <C-t>l :tabn<cr>

"tagstack
nnoremap <C-t>t <C-t>

"nerd tree
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>nm :NERDTreeMirror<cr>
let g:NERDTreeChDirMode=2

"command-t
"nnoremap <Leader>tt :CommandT<cr>

"ctrl-p
let g:ctrlp_map = '<Leader>tt'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=30000

"tagbar
nnoremap <Leader>tb :TagbarToggle<cr>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

"minibufexplorer
let g:miniBufExplSplitBelow=0
let g:miniBufExplModSelTarget = 1
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplorerMoreThanOne=999

"augroup tex
"autocmd!
"autocmd BufEnter *.tex setlocal spell spelllang=de,en
"augroup END

" Save folds
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

nmap n nzz
nmap N Nzz

command W w !sudo tee % > /dev/null

"needed by snipmate
filetype plugin on
filetype indent on

"python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
au FileType python set tabstop=4
au FileType python set expandtab
au FileType python set foldmethod=indent
au BufNewFile,BufRead *.ah set filetype=cpp

"clang complete
let g:clang_snippets=1
let g:clang_snippets_engine = 'snipmate'
"let g:clang_periodic_quickfix=1
let g:clang_complete_copen=0
let g:clang_conceal_snippets=1
let g:clang_library_path='/usr/lib/llvm'
let g:clang_use_library=1
nnoremap <Leader>cu :call g:ClangUpdateQuickFix()<cr>

"Pathogen
call pathogen#infect()

"gundo
nnoremap <Leader>gu :GundoToggle<cr>

"show changes made
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

