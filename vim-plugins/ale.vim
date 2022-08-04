" ALE Fixers
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['black'],
\  'rust': ['rustfmt'],
\}

" Run ALE Fixer on save
let g:ale_fix_on_save = 1

" Run linters only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" ALE autocompletion
let g:ale_completion_enabled = 1

set omnifunc+=ale#completion#OmniFunc

" Format for echo messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
