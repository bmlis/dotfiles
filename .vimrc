set nocompatible
filetype off

" set rtp+=~/.vim/bundle/vundle/
" call vundle#begin()

" Vundle
" Bundle 'gmarik/vundle'

" Looks
" Bundle 'vim-airline/vim-airline'
" Bundle 'vim-airline/vim-airline-themes'
" Bundle 'morhetz/gruvbox'
" Bundle 'noah/vim256-color'
" Plugin 'crusoexia/vim-monokai'

" Git
" Bundle 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'

" Python
" Bundle 'klen/python-mode'
" Bundle 'davidhalter/jedi-vim'

" IDE
" Bundle 'kien/ctrlp.vim'
" Plugin 'mileszs/ack.vim'
" Bundle 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'

"HTML
" Plugin 'alvan/vim-closetag'

" CSS
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'ap/vim-css-color'

" JS
" Plugin 'jason0x43/vim-js-indent'
" Plugin 'pangloss/vim-javascript'

" JSON
" Plugin 'elzr/vim-json'

" Typescript
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'leafgarland/typescript-vim'

"React
" Plugin 'mxw/vim-jsx'

" Ruby
" Plugin 'vim-ruby/vim-ruby'

" call vundle#end()  
" filetype plugin indent on

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
colorscheme solarized 
set background=dark
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" edit vim quickly
nmap ,ev :e $MYVIMRC<CR>
nmap ,sv :so $MYVIMRC<CR>

" edit zsh quickly
nmap ,ez :e ~/.zshrc<CR>

" get rid of swap files
set noswapfile

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf-8

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

" Enable indentation
let g:pymode_indent = 1

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

" Turn off real time mode in gitgutter (because of error)
let g:gitgutter_realtime = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" " automatically change window's cwd to file's dir
set autochdir
"
" " I prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab


" " more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
    set gfn=Liberation\ Mono\ for\ Powerline\ 12

    endif

" ctrlP config
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v\.(pyc)$'

" splits mapping
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" tabs mappings
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> 10gt

" copying and pasting
set clipboard+=unnamed
set paste

" JSX
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.js,*.html.erb"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_checkers = ['eslint']
