" Typical settings
    
filetype plugin indent on   " Turn on other plugins
set autochdir               " Change pwd to that of the file being edited
set nocompatible            " Set when vimrc is found; better safe than sorry.
set tabstop=2               " Size of tab when reading files
set softtabstop=2           " Size of tab when editing files
set shiftwidth=2            " Size of indent
set textwidth=79            " Hard line wrap at 79 columns
set expandtab               " Write tabs as spaces
set lazyredraw              " Don't redraw screen when executing macros
set showmatch               " Show matching brackets
set incsearch               " Start searching as you type
set nohlsearch              " Turns off search highlighting
set noeb vb t_vb=           " Disable error bells
set noignorecase            " Case-sensitive search
set number                  " Show line numbers

syntax enable
colorscheme solarized
let g:solarized_termcolors = 256
let g:tex_flavor='latex'
set background=light        " For console vim, overriden in gvimrc

" Set syntax highlighting for filetypes
au BufNewFile,BufRead *.ts set filetype=javascript

" Key remaps

map ,c "+y          " Copy to the system clipboard
map ,v "+p          " Paste from the system clipboard
