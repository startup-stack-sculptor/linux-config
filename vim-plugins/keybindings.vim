" set <SPACE> as leader key
let mapleader=" "

" Map jj key to ESC in insert mode
inoremap jj <esc>

" Insert semicolon at the end
inoremap <leader>; <C-o>A;

" Autoclose brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Fuzzy file finder for editing
nnoremap <leader>p :FZF<CR>

" Netrw configuration
nnoremap <leader>j :Lexplore %:p:h<CR>
nnoremap <leader>n :Lexplore<CR>

" increase split window width
nnoremap <leader>b :vertical resize +5<CR>
nnoremap <leader>v :vertical resize -5<CR>

" Indent
vnoremap <Tab> >
vnoremap <S-Tab> <

" Navigate between ALE Errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
