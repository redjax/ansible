" Plugin settings {{{

  " airline {{{

    let g:airline_powerline_fonts=1

    if !exists('g:airline_symbols')
    let g:airline_symbols={}
    endif

    let g:airline_symbols.space="\ua0"
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_buffers=0
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#branch#enabled=1
    let g:powerline_pycmd="py3"
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1

    " airline theme {{{

      " Uncommend a line to use that theme.
      "    Make sure to uncomment ONLY 1 line
      " let g:airline_theme='dark'
      " let g:airline_theme='hybridline'
      " let g:airline_theme='bubblegum'
      " let g:airline_theme='badwolf'
      " let g:airline_theme='badwolf'
      let g:airline_theme='angr' 

    "}}}

  "}}}

  " deoplete {{{

    " let g:deoplete#enable_at_startup = 1
    " deoplete: set preview completion window to auto-close
    " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " deopelete: tab navigation
    " inoremap <expr><tab> pumvisible() ?"\<c-n>" : "\<tab>"

    " Deoplete jedi python settings {{{

      " Maximum length of completion description text. Default: 50
      " g:deoplete#sources#jedi#statement_length = 50
      " Show docstring in preview window. Default: 0
      " g:deoplete#sources#jedi#show_docstring = 1
      " Manually set python path
      " g:deoplete#sources#jedi#python_path = $PATH
      " Ignore jedi errors for completions. Default: 0
      " g:deoplete#sources#jedi#ignore_errors = 0

    "}}}

  "}}}

  " neoformat {{{

    " neoformat: enable-alignment
    let g:neoformat_basic_format_align = 1
    " neoformat: tab to spaces conversion
    let g:neoformat_basic_format_retab = 1
    " neoformat: trim trailing whitespace
    let g:neoformat_basic_format_trim = 1

  "}}}

  " jedi {{{

    " jedi: disable autocompletion, which we use deoplete for
    " let g:jedi#completions_enabled = 0
    " jedi: open go-to function in split, not another buffer
    " let g:jedi#use_splits_not_buffers = "right"

  "}}}

  " nerdtree {{{

    " nerdtree: open/close with C-k, C-B
    nnoremap <silent> <C-k><C-B> :NerdTreeToggle<CR>
    " nerdtree: ignore files
    let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

  "}}}

  " highlightedyank/highlightyank {{{

    " fix colorscheme issues
    hi HighlightedyankRegion cterm=reverse gui=reverse
    " highlight duration, measured in ms
    let g:highlightedyank_highlight_duration = 1000

  "}}}

  " syntastic {{{

    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " let g:syntastic_python_checkers = ['python', 'flake8']
    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0

  "}}}

  " comfortable-motion {{{

    noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
    noremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(-40)<CR>

  "}}}

  " LanguageClient-neovim {{{

    " Required for operations modifying multiple buffers like rename
    " set hidden

    " let g:LanguageClient_serverCommands = {
    "  \ 'sh': ['bash-language-server', 'start']
    "  \ }

  " }}}

  " Scrollbar {{{

    augroup ScrollbarInit
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
    autocmd WinLeave,FocusLost * silent! lua require('scrollab').clear()
    augroup end

  " }}}

"}}}