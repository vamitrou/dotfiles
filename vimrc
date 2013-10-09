
" --------------------------------------------------------
" General settings 
" --------------------------------------------------------

set mouse=a

" Nerd tree
" autocmd vimenter * NERDTree " open automatically

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close if only tree left

" autocmd vimenter * NERDTreeToggle

:nnoremap <F8> :setl noai nocin nosi inde=<CR>

map <C-g> :NERDTreeToggle<CR> "toggle nerd tree

" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype on
filetype plugin on
filetype indent on

" --------------------------------------------------------
" Appearance settings 
" --------------------------------------------------------
syntax on

"TODO: foobar
"

" colorscheme molokai
set bg=dark
set t_Co=256
let g:molokai_original = 0 
colorscheme molokai
"colorscheme vylight  

" editor settings
set cursorline
set ruler							" line numbers and column the cursor is on
set number							" Show line numbering
set showcmd

set scrolloff=3						" Keep 3 lines below and above the cursor
set numberwidth=1					" Use 1 col + 1 space for numbers
set bs=2
set tabstop=4
set shiftwidth=4

" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M

" remove toolbar widget
set guioptions-=T

set guifont=Cousine\ 10

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" --------------------------------------------------------
" Behaviour settings
" --------------------------------------------------------
set nocompatible
set expandtab
set autoindent
set cindent
set smartindent
set tabpagemax=20
set showmatch 


" enable some nice non-compliant vim features. 
set nocp

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

"Some vertipper :)
ab mkae make
ab tish this
ab tihs this

" --------------------------------------------------------
" Search settings 
" --------------------------------------------------------

" Remove marked matches after search command
nnoremap <CR> :nohlsearch<CR>/<BS><CR>
nnoremap <C-b> :!make<CR>

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"search rules
set ignorecase 
set smartcase


" --------------------------------------------------------
" File Types handling
" --------------------------------------------------------
au BufNewFile,BufRead *.wiki setf Wikipedia

" dspm desc files
au BufRead,BufNewFile *.desc set filetype=dspm
au! Syntax newlang source $HOME/.vim/syntax/dspm.vim

" dspm metafile 
au BufRead,BufNewFile *.mfs set filetype=metafile
au! Syntax newlang source $HOME/.vim/syntax/metafile.vim

" scons files
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

" open office files
au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))

" delphi file system package
au BufReadCmd *.dfs call tar#Browse(expand("<amatch>"))

" makefile template files
au BufRead,BufNewFile *.Mf set filetype=make

" Beautify C/C++ files
function! BeautifyCPPFiles()
    :silent !beautify.py '%:p' > /dev/null 2>&1
    :e
    :syntax on
endfunction

autocmd! bufwritepost *.cpp :call BeautifyCPPFiles()
autocmd! bufwritepost *.hpp :call BeautifyCPPFiles()
autocmd! bufwritepost *.c   :call BeautifyCPPFiles()
autocmd! bufwritepost *.h   :call BeautifyCPPFiles()

" --------------------------------------------------------
" Handy Stuff
" --------------------------------------------------------

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="


" --------------------------------------------------------
" Settings for Pythonistas
" --------------------------------------------------------

"Pathogen load
filetype off 
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on 

" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Disable pylint checking every save 
let g:pymode_lint_write = 1 

" Load run code plugin 
let g:pymode_run = 1

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" disable automatic python folding
let g:pymode_folding=0 

" disable rope refactoring module, it's too slow
let g:pymode_rope = 1

" Disable g:pymode_rope_guess_project to make rope always create 
" .ropeproject in current dir.
let g:pymode_rope_guess_project = 0


" --------------------------------------------------------
" Testarea for Vim settings.  
" --------------------------------------------------------
map <C-e> <esc>$
map <C-a> <esc>^
imap <C-e> <esc>$a
imap <C-a> <esc>^i


" code completion using clang
let g:clang_complete_auto = 1
let g:clang_user_options = '|| exit 0'
let g:clang_use_library = 1
