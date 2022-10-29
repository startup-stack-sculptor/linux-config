" set <SPACE> as leader key
let mapleader=" "

" Map jj key to ESC in insert mode
inoremap jj <esc>

" Insert semicolon at the end
inoremap ; <C-o>A;

" Autoclose brackets
if has('nvim')
  inoremap ( ()<Left>
  inoremap [ []<Left>
  inoremap < <><Left>
  inoremap { {}<Left>
  inoremap ' ''<Left>
  inoremap " ""<Left>
endif

" Fuzzy file finder for editing
nnoremap <leader>p :FZF<CR>

" Netrw configuration
nnoremap <leader>j :Lexplore %:p:h<CR>
nnoremap <leader>n :Lexplore<CR>

" Indent
vnoremap <Tab> >
vnoremap <S-Tab> <

map <leader>d :ALEGoToDefinition<CR>
map <leader>f :ALEFix<CR>
map <leader>h :ALEHover<CR>
map <leader>r :ALEFindReferences<CR>
map <leader>t :ALEToggle<CR>

" Navigate between ALE Errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
map <silent> <C-j> <Plug>(ale_next_wrap)

" Switch between windows splits easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Hold down Ctrl and move between windows
" with standard vim movement keys
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>
