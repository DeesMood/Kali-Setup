" ==========================================
" Plugin Manager
" ==========================================
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
call plug#end()

" ==========================================
" Core Options
" ==========================================
syntax on
filetype plugin indent on

set number
set incsearch ignorecase smartcase
set hidden
set expandtab shiftwidth=4 softtabstop=4   " default: 4-space (Python/bash style)

" Route yank/delete/paste through the system clipboard (X11 CLIPBOARD
" selection) instead of Vim's internal-only register. Requires a Vim
" build with +clipboard -- if `vim --version | grep clipboard` shows
" -clipboard, install vim-gtk3 instead of plain vim.
set clipboard=unnamedplus

" JS/JSON convention is 2-space, not 4
autocmd FileType javascript,json setlocal shiftwidth=2 softtabstop=2

" ==========================================
" ALE -- linting only, no auto-fix (keep it out of your way)
" ==========================================
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'sh': ['shellcheck'],
\}
let g:ale_lint_on_text_changed = 'never'   " lint on save, not every keystroke
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1

" ==========================================
" Colors -- Tokyo Night-inspired, on Kali Dark bg
" ==========================================
set termguicolors
set background=dark
highlight Normal        guibg=#23262e guifg=#c0caf5
highlight LineNr         guifg=#4a4f5c
highlight CursorLineNr   guifg=#7aa2f7
highlight Comment        guifg=#565f89
highlight NonText        guifg=#1f2229
highlight Visual         guibg=#2f3341
highlight SignColumn     guibg=#23262e
highlight FoldColumn     guibg=#23262e
highlight CursorLine     guibg=#1f2229
highlight StatusLine     guibg=#7aa2f7 guifg=#1a1b26
highlight StatusLineNC   guibg=#1f2229 guifg=#565f89
highlight VertSplit      guifg=#1f2229 guibg=#23262e
highlight Pmenu          guibg=#1f2229 guifg=#c0caf5
highlight PmenuSel       guibg=#7aa2f7 guifg=#1a1b26
highlight ALEErrorSign   guifg=#f7768e guibg=#23262e
highlight ALEWarningSign guifg=#e0af68 guibg=#23262e
