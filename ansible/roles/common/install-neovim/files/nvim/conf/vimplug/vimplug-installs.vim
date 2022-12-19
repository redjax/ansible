" UI {{{

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Smooth scrolling motion
    Plug 'yuttie/comfortable-motion.vim' 
    " Awesome vim colorschemes
    Plug 'rafi/awesome-vim-colorschemes'
    " Vim colorpack
    Plug 'flazz/vim-colorschemes' 
    " vim-themes
    Plug 'mswift42/vim-themes'
    " Highlight yank (copy) area
    Plug 'machakann/vim-highlightedyank'
    " Code folding
    Plug 'tmhedberg/SimpylFold'
    " Scrollbar
    Plug 'Xuyuanp/scrollbar.nvim'

"}}}

" Code completion & syntax {{{

    " coc (code intellisense)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " autopairs for quote/bracket completion
    Plug 'jiangmiao/auto-pairs'
    " auto-format for code formatting
    Plug 'sbdchd/neoformat'
    " neomake, mostly for linting with pylint
    Plug 'neomake/neomake'
    " display indents with thin lines
    Plug 'Yggdroot/indentline'
    " Collectionof language packs for (n)vim
    Plug 'sheerun/vim-polyglot'
    " nerdtree for file-browsing
    Plug 'scrooloose/nerdtree'
    " Formatter
    Plug 'Chiel92/vim-autoformat'
    " Syntax checker/linter
    Plug 'scrooloose/syntastic'
    " Python Black
    Plug 'psf/black', { 'branch': 'stable' }
    " Auto-indent rules for Python
    " Plug 'vim-scripts/indentpython.vim'
    " Highlight whitespace with red, fix with :FixWhitespace
    " Plug 'bronson/vim-trailing-whitespace'
    " Deoplete
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
        " Generic completion for deoplete
    "   Plug 'Shuogo/neco-syntax'
    " endif
    " Deoplete plugins
    " Plug 'deoplete-plugins/deoplete-jedi'
    " Plug 'deoplete-plugins/deoplete-docker'

"}}}
