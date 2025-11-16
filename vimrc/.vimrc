" ciao
" ===============================
" Minimal VimRC for Arch/i3/X + pywal
" ===============================

" -------------------------------
" Basic Settings
" -------------------------------
set nocompatible              " Disable vi compatibility
set clipboard=unnamedplus     " Use system clipboard for all yank/paste
set paste                     " Disable auto-indent when pasting
set number                    " Show line numbers
set cursorline                " Highlight current line
set cursorcolumn              " Highlight current column
set shiftwidth=4              " Indent 4 spaces
set tabstop=4                 " Tab width 4 spaces
set expandtab                 " Use spaces instead of tabs
set scrolloff=10              " Keep 10 lines above/below cursor
set nowrap                    " Do not wrap long lines
set incsearch                 " Incremental search
set ignorecase                " Ignore case in search
set smartcase                 " Override ignorecase if capitals used
set showcmd                   " Show incomplete commands
set showmode                  " Show current mode
set showmatch                 " Show matching brackets
set hlsearch                  "Highlight search matches
set wildmenu                  " Auto-completion menu
set wildmode=list:longest
set history=1000              " Command history
set nobackup                  " No backup files

" -------------------------------
" Undo Settings
" -------------------------------
set undofile
set undodir=~/.vim/undo
set undoreload=10000
if !isdirectory(expand("~/.vim/undo"))
    call mkdir(expand("~/.vim/undo"), "p")
endif

" -------------------------------
" Key Mappings
" -------------------------------
let mapleader=" "             " Set leader key to space

" Escape Insert mode with 'jk'
inoremap fd <Esc>

" Normal mode navigation & window management
nnoremap <leader>\ ``
nnoremap <leader>sa :wqa!<CR>
nnoremap <leader>src :source %<CR>
nnoremap o o<esc>
nnoremap O O<esc>
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" -------------------------------
" Plugins (vim-plug)
" -------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'       " pywal integration
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'ec965/mjml-preview'
Plug 'amadeus/vim-mjml'
call plug#end()

" -------------------------------
" Filetype, Syntax & Indent
" -------------------------------
filetype plugin indent on
syntax on
augroup filetype_html
    autocmd!
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" -------------------------------
" Cursor Highlight Only Active Window
" -------------------------------
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" -------------------------------
" Statusline
" -------------------------------
set statusline=%F\ %M\ %Y\ %R
set laststatus=2

" -------------------------------
" Colorscheme (pywal)
" -------------------------------
if exists(':Wal')      " only if wal.vim loaded
    colorscheme wal
endif
set background=dark
