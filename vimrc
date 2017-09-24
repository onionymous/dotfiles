""" GENERAL """
set nocompatible
filetype off
set t_Co=256

""" vundle """
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtREE'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
" Plugin 'qualiabyte/vim-colorstepper'
Plugin 'matze/vim-move'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
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

""" LEADER """
let mapleader="," "leader is comma

""" VIM AIRLINE """
" colorscheme tangoshady molokai_dark spacegray Tomorrow-Night-Bright
" let g:airline_theme='jellybeans'
colorscheme dracula 
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""" NERDTREE """
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>o :NERDTreeToggle<CR>

""" CTRL-P """
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

""" VIM COLORSCHEME SWITCHER """
" nmap <F6> <Plug>ColorstepPrev
" nmap <F7> <Plug>ColorstepNext
" nmap <S-F7> <Plug>ColorstepReload

""" VIM MULTIPLE CURSORS """
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

""" VIM MOVE LINES """
let g:move_key_modifier = 'C'

""" SPACES/TABS """
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set noexpandtab
set smarttab

set ai "autoindent
set si "smartindent

""" DISABLE THE BEEP """
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""" TABS, WINDOWS, BUFFERS """
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>

" Move up and down half a page
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" New buffer in current window
map <leader>n :enew!<cr>
" map <C-t> :enew!<cr>

" Close the current buffer
map <leader>d :bd<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Navigating between buffers
map <C-p> :bp!<cr>
map <C-n> :bn!<cr>
" map <leader>h :bp!<cr>
" map <leader>l :bn!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""" UI/COLORS/SYNTAX """
syntax enable
set number
set showcmd
set cursorline
set ruler
set wildmenu

" enable regex
set lazyredraw

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set showmatch
set mat=2

set splitbelow
set splitright

""" SEARCH """
set incsearch
set hlsearch

set ignorecase
set smartcase

" Clear highlights
augroup no_highlight
    autocmd TermResponse * nnoremap <esc> :noh<return><esc>
augroup end

""" MOVING LINES """
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""" PASTE """
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Toggle paste mode on and off
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""" SPELLCHECK """
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
