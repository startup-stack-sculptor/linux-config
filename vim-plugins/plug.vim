" Plugin manager for vim
call plug#begin()
  Plug 'mattn/emmet-vim'          " Emmet
  Plug 'dense-analysis/ale', {'on': 'ALEToggle'}       " Linter and fixer
  Plug 'SirVer/ultisnips'         " Snippets
  Plug 'honza/vim-snippets'       " Util snips collection
  Plug 'tpope/vim-surround'       " Operate on surroundings in pairs
  Plug 'tpope/vim-vinegar'         " Netrw enhancement
  Plug 'tpope/vim-commentary'     " Comment stuff out
  Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }  " dotnet lsp
  Plug 'lambdalisue/suda.vim'     " sudo support in neovim + vim
  Plug 'zah/nim.vim', { 'for': 'nim' }
  Plug 'wuelnerdotexe/vim-astro', { 'for': 'astro' }
  Plug 'hashivim/vim-terraform', { 'for': 'terraform'}

call plug#end()
