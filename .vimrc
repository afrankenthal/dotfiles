""""""""""""""""""""""" BEGIN Stuff for Vundle """""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_server_python_interpreter = 'python3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'


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

""""""""""""""""""""""""" END Stuff for Vundle """"""""""""""""""""""""

" Enable autoident
"set ai

" Set filetype on
filetype on

" Set # of spaces that <Tab> in file uses
set ts=2

" Set line number
set number

" Enable syntax highlighting
syntax on

" Do incremental searches
set incsearch

" C identation
:autocmd FileType *      set formatoptions=tcql nocindent comments&
:autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
set cindent

" Abbreviation for comments
:ab #b /********************************************************
:ab #e ********************************************************/
:ab #l /*------------------------------------------------------*/

" Abbreviation for define and include
:ab #d #define
:ab #i #include

" No Carriage Return (CR)
set notextmode

" Line wrapping for pasted text
set textwidth=72

" Set enconding to utf-8
set encoding=utf-8

" Use 256 colors
set t_Co=256

" Use colorscheme delek (can't remember where from)
colorscheme delek

" Always show statusline
set laststatus=2

" Set location of powerline status binding for vim
set rtp+=$HOME/anaconda/lib/python3.4/site-packages/powerline/bindings/vim

" Set font (closest to Monaco, which is default in iTerm2)
set guifont=Inconsolate\ for\ Powerline:h15

" Don't know what these do, but related to Powerline status
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
