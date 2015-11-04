set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" BUNDLES
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'morhetz/gruvbox'
Bundle 'noah/vim256-color'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/indentpython.vim'

filetype plugin indent on

" Hihlight everythin exceeding 80 chars
augroup vimrc_autocmds
	autocmd!
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%80v.*/
	autocmd FileType python set nowrap
	augroup END

set history=700
set nu

set ruler

syntax enable

"Theme settings
let g:gruvbox_italic=1
set t_Co=256
colorscheme gruvbox
set background=dark
let g:airline_theme='durant'
let g:airline_powerline_fonts=1

" edit vim quickly
nmap ,ev :e $MYVIMRC<CR>
nmap ,sv :so $MYVIMRC<CR>

" edit zsh quickly
nmap ,ez :e ~/.zshrc<CR>

"toggle bg with f5
map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8

set laststatus=2

nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" Python mode config
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_message = 1
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Breakpoint
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()  # XXX BREAKPOINT"

" Don't autofold code
let g:pymode_folding = 0

" auto initialization for jedi
let g:jedi#auto_initialization = 1

" Don't show call signature
let g:jedi#show_call_signatures = 0

" Open goto in new tab
let g:jedi#use_tabs_not_buffers = 1

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" " automatically change window's cwd to file's dir
set autochdir
"
" " I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" " more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
    endif

" ctrlP config
let g:ctrlp_show_hidden = 1

" splits mapping
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
