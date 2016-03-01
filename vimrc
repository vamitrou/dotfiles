
" --------------------------------------------------------
" General settings
" --------------------------------------------------------

:tab sall


" editor settings
" set mouse=a
" set clipboard=unnamed
" set cursorline
set ruler							" line numbers and column the cursor is on
set number							" Show line numbering
set showcmd

autocmd vimenter * AcpDisable

" set scrolloff=3						" Keep 3 lines below and above the cursor
set numberwidth=1					" Use 1 col + 1 space for numbers
set bs=2

" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M

" remove toolbar widget
set guioptions-=T

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"search rules
set ignorecase
set smartcase

cmap w!! w !sudo tee > /dev/null %

syntax on
filetype on                 " enables filetype detection
filetype plugin indent on   " enables filetype specific plugins

"autocmd BufWritePost *.py call Flake8()

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" set autochdir
autocmd BufEnter * silent! lcd %:p:h

" code folding
"set foldmethod=indent
"set foldlevel=2
"set foldnestmax=4

" indentation
autocmd FileType * set noexpandtab | set shiftwidth=4
autocmd FileType python set softtabstop=4|set tabstop=4|set shiftwidth=4|set expandtab

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

set pastetoggle=<F2>
set wildignore+=*.o,*.d,*.P,*.ELF,*.bin,*.so,*.pyc,*pyo,*.obj,.git,*.gcda,*.gcno,*.swp

:let g:EasyGrepRecursive = 1
:let g:EasyGrepFilesToExclude = '*.o,*.d,*.P,*.ELF,*.bin,*.so,*.pyc,*pyo,*.obj,.git,*.gcda,*.gcno,*.swp'

" Nerd tree
" autocmd vimenter * NERDTreeToggle

" set auto-indentation
" set cindent " correct one

"autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
"filetype plugin indent on

:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" map <Leader>t :FufFile **/<CR>

map <C-g> :NERDTreeToggle<CR> "toggle nerd tree
map <F3> :NERDTreeToggle<CR>

" always add the current file's directory to the path if not already there
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path+=".s:tempPath

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.

""autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete


" --------------------------------------------------------
" Appearance settings
" --------------------------------------------------------

"set t_ts=^[]1;
"set t_fs=^G

colorscheme molokai
"colorscheme solarized
set t_Co=256
let g:molokai_original = 0
"set guifont=Lucida_Console:h11
" colorscheme badwolf

hi Visual term=reverse cterm=reverse guibg=Grey

" --------------------------------------------------------
" Behaviour settings
" --------------------------------------------------------
set nocompatible
set showmatch


" enable some nice non-compliant vim features.
set nocp

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Search settings
" --------------------------------------------------------

" Remove marked matches after search command
nnoremap <CR> :nohlsearch<CR>/<BS><CR>
nnoremap <C-b> :!make<CR>

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


" Load pylint code plugin
""let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
""let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Disable pylint checking every save
""let g:pymode_lint_write = 1

" Load run code plugin
""let g:pymode_run = 1

" Hold cursor in current window
" when quickfix is open
""let g:pymode_lint_hold = 0

" Place error signs
""let g:pymode_lint_signs = 1

" disable automatic python folding
""let g:pymode_folding=0

" disable rope refactoring module, it's too slow
""let g:pymode_rope = 0

" Disable g:pymode_rope_guess_project to make rope always create
" .ropeproject in current dir.
""let g:pymode_rope_guess_project = 0


" --------------------------------------------------------
" Testarea for Vim settings.
" --------------------------------------------------------
map <C-e> <esc>$
map <C-a> <esc>^
imap <C-e> <esc>$a
imap <C-a> <esc>^i


" code completion using clang
" let g:clang_complete_auto = 1
" let g:clang_user_options = '|| exit 0'
" let g:clang_use_library = 1
