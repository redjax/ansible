" Source external vim config files: $> source /path/to/vimconfig

"
" Copy and paste for new sources:
" if filereadable(expand('~/.config/nvim/conf/<CONF>.vim'))
"    source ~/.config/nvim/conf/<CONF>.vim
"end
"

" Neovim environment conf
if filereadable(expand('~/.config/nvim/conf/environment.vim'))
    source ~/.config/nvim/conf/environment.vim
end

" Vim Plug plugin manager conf
if filereadable(expand('~/.config/nvim/conf/vimplug/vimplug-core.vim'))
    source ~/.config/nvim/conf/vimplug/vimplug-core.vim
end

" Vim Plug - Plugin installs
if filereadable(expand('~/.config/nvim/conf/vimplug/vimplug-installs.vim'))
    source ~/.config/nvim/conf/vimplug/vimplug-installs.vim
end

" Vim Plug - plugin settings conf
if filereadable(expand('~/.config/nvim/conf/vimplug/vimplug-plugin-settings.vim'))
    source ~/.config/nvim/conf/vimplug/vimplug-plugin-settings.vim
end

" Autocmd rules conf
if filereadable(expand('~/.config/nvim/conf/autocmd-rules.vim'))
    source ~/.config/nvim/conf/autocmd-rules.vim
end

" Keymaps
if filereadable(expand('~/.config/nvim/conf/mappings.vim'))
    source ~/.config/nvim/conf/mappings.vim
end
