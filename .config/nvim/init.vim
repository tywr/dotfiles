" Add custom python endpoint dedicated to neovim experience                             
let g:python3_host_prog = $HOME . '/.python/nvim/bin/python'                           
let g:loaded_python3_provider = 1
let g:loaded_python_provider = 1
let g:gitgutter_git_executable = '/opt/homebrew/bin/git' 


syntax on
set number
set mouse=a
set splitright
set tags=tags
set cursorline
set backspace=indent,eol,start
set showmatch
set noshowmode
set shell=zsh
set background=dark
set nocompatible
set signcolumn=yes
set noswapfile
packadd cfilter
filetype plugin on

" Tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set fillchars+=vert:█

" Search settings
set incsearch
set hlsearch

filetype plugin indent on

" Leader mapped to space
nnoremap <SPACE> <Nop>
map <Space> <Leader>

autocmd filetype markdown setlocal conceallevel=2

" Shorter update time
set updatetime=7

lua require('init')
lua require("lsp-conf")
lua require("mappings")
lua require("colors")

" -----------------------------------------------------------------------------
"  						             CURSOR
" -----------------------------------------------------------------------------
" Set cursor variable
set guicursor+=n:block-blinkon500-blinkoff500
set guicursor+=v:hor50-blinkon500-blinkoff500
set guicursor+=i:ver50-blinkon500-blinkoff500


" -----------------------------------------------------------------------------
"  						          GIT-GUTTER 
" -----------------------------------------------------------------------------
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

let g:copilot_no_tab_map = v:true
