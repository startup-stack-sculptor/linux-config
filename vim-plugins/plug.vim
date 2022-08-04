" Plugin manager for vim
call plug#begin()
  Plug 'mattn/emmet-vim'          " Emmet
  Plug 'dense-analysis/ale'       " Linter and fixer
  Plug 'SirVer/ultisnips'         " Snippets
  Plug 'honza/vim-snippets'       " Util snips collection
  Plug 'tpope/vim-eunuch'         " Vim sugar for UNIX commands
  Plug 'tpope/vim-surround'       " Operate on surroundings in pairs
  Plug 'tpope/vim-vinegar'        " Netrw enhancement
  Plug 'ziglang/zig.vim'          " Vim configuration for zig
  Plug 'tpope/vim-commentary'     " Comment stuff out
  Plug 'mg979/vim-visual-multi'   " Multiple cursor
  Plug 'OmniSharp/omnisharp-vim'  " dotnet lsp

  if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'mfussenegger/nvim-jdtls'                " Support for eclipse.jdt.ls
  endif

call plug#end()
