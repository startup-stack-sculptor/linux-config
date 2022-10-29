set nocompatible
set clipboard=unnamedplus
set mouse=a                         " Enable mouse support
set linebreak
set cindent shiftwidth=2

if has("nvim")
  colorscheme tsdh-dark
endif

" Fuzzy finder without plugin
set path=**
set wildignore+=*.git/*,*node_modules/*,*build/*

set wildmenu
set cursorline
set number                          " Display linenumbers
set relativenumber

set tabstop=2                       " Fix tab spaces
set softtabstop=0
set shiftwidth=2
set expandtab

set hlsearch                        " Searching
set incsearch
set ignorecase
set smartcase

set smartindent

filetype plugin on                  " -- AUTOCOMPLETION --
" set omnifunc=syntaxcomplete#Complete

set rtp+=~/.direct/bash_utils/merlin/share/merlin/vim

" extend grep with ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
set grepformat=%f:%l:%c:%m

inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'


let g:OmniSharp_server_use_net6 = 1

" ## Add Terraform Configurations ##
let g:terraform_align=1
let g:terraform_fmt_on_save=1


so ~/.vim/conf.d/ale.vim
so ~/.vim/conf.d/plug.vim
so ~/.vim/conf.d/keybindings.vim
so ~/.vim/conf.d/netrw.vim
so ~/.vim/conf.d/emmet.vim
