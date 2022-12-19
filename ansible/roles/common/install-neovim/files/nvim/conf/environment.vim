" environment detection {{{
if has('win32') || has('win64')
    let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
    let g:plugged_home = '~/.local/share/nvim/plugged'
endif

" Allow cursor change in tmux
let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI ="\<Esc>]50;CursorShape=0\x7"
    endif
endif
    
"}}}

" code folding
set foldmethod=marker

" filetype inedentation
filetype plugin indent on

" syntax
syntax on
syntax enable
set ruler

" colorscheme {{{

" make background dark/light
set background=dark

" Uncomment a theme below to set
    " colorscheme challenger_deep
    " colorscheme minimalist
    colorscheme hybrid
"}}}

" change window title to current file being edited
set title

" disable error beeps
set noerrorbells

" display cli tab complete options as menu
set wildmenu

" True Color support if available
if has("termguicolors")
    set termguicolors
endif

" text rendering options
set encoding=utf-8
set fileencoding=utf-8
set linebreak " avoid wrapping line in middle of a word
set wrap " enable line wrapping

" line numbers
set number

" numbers scroll around current line
" set relativenumber

" open invisible buffer on start
set hidden

" show the last command
set showcmd

" mouse support
set mouse=a

" Do not show -- INSERTION -- in command line
set noshowmode
set noshowmatch
set lazyredraw

" Improve searching within file
set ignorecase
set smartcase
set hlsearch " search highlighting
set incsearch " incremental search/partial matches

" Tab and indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround " round indentation to nearest multiple of shiftwidth
set smarttab " insert tabstop number of spaces when tab is pressed

" Performance options
set complete-=i " limit files searched for autocomplete

" Turn off backup
set nobackup
set noswapfile
set nowritebackup 

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Misc
set autoread " automatically re-read if unmodified version is open in nvim
set backspace=indent,eol,start " allow backspacing over indents, line breaks, inserts
set confirm " prompt when closing without saving
set history=1000 " increase undo limit
set wildignore+=.pyc,.swp " ignored file extensions
set bomb " editing between Windows & Linux
let mapleader=',' " not sure what this does

" Tries to set shell from env, defaults to bash
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
" let g:session_directory = "~/.config/nvim/session"