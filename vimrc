" Typical settings
    
filetype plugin indent on   " Turn on other plugins
set nocompatible            " Set when vimrc is found; better safe than sorry.
set tabstop=4               " Size of tab when reading files
set softtabstop=4           " Size of tab when editing files
set shiftwidth=4            " Size of indent
set expandtab               " Write tabs as spaces
set lazyredraw              " Don't redraw screen when executing macros
set showmatch               " Show matching brackets
set incsearch               " Start searching as you type
set noeb vb t_vb=           " Disable error bells
set background=dark         " For console vim, overriden in gvimrc
syntax enable

" Key remaps

map ,c "+y          " Copy to the system clipboard
map ,v "+p          " Paste from the system clipboard
