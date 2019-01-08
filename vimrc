" SAVE THIS FILE AS YOUR .vimrc FILE IN YOUR HOME DIRECTORY
" Enjoy!

set nocompatible
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'scrooloose/nerdtree'
Plugin 'gregsexton/gitv'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-obsession'
Plugin 'posva/vim-vue'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end() "Required, plugins must be add before this line



syntax on
filetype plugin indent on "Required

set number " Show line numbers
set ruler  " Show line and column location of cursor

if has("gui_running")
  set guioptions=egmrt        "Disable menu bar for gvim/macvim
  set guifont=Menlo\ Regular:h12
  "set transparency=10
  "hi Visual guibg=#223366
endif

" Behavior
set nobackup                      "don't create backup files
set ignorecase                    "ignore case in searched
set nocompatible                  "disable VI compatibility mode
set ai                            "autoindent
set si                            "smart indent
set ofu=syntaxcomplete#Complete   "Enable syntax completion
set encoding=utf-8
set spelllang=en_us               " Set spell check language
set nowrap                        " Disable word wrap.
set history=200
set hidden
set autoread                      " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed             " yank and paste with the system clipboard
set scrolloff=10                  " show context above/below cursorline
colorscheme grb256                " Sets default colorscheme to grb256, a dark background with blue text
" colorscheme molokai               " Sets default colorscheme to monokai, a gray brown background with green text
" let g:molokai_original = 1        " Doesn't work with vim-clojure-static plugin



" NORMAL MODE
" Activate after saving.
iunmenu File.Save
imenu <silent> File.Save <Esc>:w<CR>

" Inserting empty lines using [enter] when in normal mode.
map <S-Enter> O<Esc>
map <CR> o<Esc>k

" Insert spaces using space bar when in normal mode.
nnoremap <space> i<space><esc>

" Remove search highlighting with <leader><space>
nnoremap <silent> <leader><space> :noh<CR>

" Searching
set hlsearch          "Highlight found searches
set incsearch
set smartcase
map <silent> // :noh<CR>

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Moving lines up/down using [apple]-[shift]-[up]/[down].
" nmap <silent> <D-S-down> ddp==
" nmap <silent> <D-S-up> yykPjjddkk==
"nmap <silent> <D-S-up> ddkP==

" Duplicating lines.
nnoremap <silent> <D-d> yyp
imap <silent> <D-d> <esc>yypi
imap <silent> <D-S-down> <esc>ddp==i
imap <silent> <D-S-up> <esc>ddkP==i

" Saving
" Stripping Whitespace on save.
" autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" workaround for ^G error https://github.com/scrooloose/nerdtree/issues/928
let g:NERDTreeNodeDelimiter = "\u00a0"

" Make ESC key into noop
nnoremap <esc> :noh<return><esc>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Something about apple computers inserting weird characters when you use
" arrow keys
nnoremap <silent> <ESC>OA <Nop>
nnoremap <silent> <ESC>OB <Nop>
nnoremap <silent> <ESC>OC <Nop>
nnoremap <silent> <ESC>OD <Nop>
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

" Manually disable arrow keys to force you to learn vim
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>



""""""" Startup commands
"" Open NerdTree for every file
" autocmd vimenter * NERDTree
"" Open NerdTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" close vim if only NERDtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
