"----------------------- Vanilla Vim Settings -------------------"
set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=2
set shiftwidth=0
syntax on

"leader key activation visual feedback
set showcmd

"rebind leader key
let mapleader=" "

"open/close tag list
nnoremap <leader>t :TlistToggle<CR>

"open/close nerdtree
nmap <leader>n :NERDTreeToggle<CR>


inoremap jj <ESC>
set number relativenumber


" the following are for colors:
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Needed for DevIcons
set encoding=UTF-8

"----------------------- vim-plug Settings -------------------"

call plug#begin('~/.vim/plugged')

" plugins
Plug 'qpkorr/vim-bufkill'
Plug 'VundleVim/Vundle.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'universal-ctags/ctags'
Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tcomment_vim'




" all of plugins must be added before the following line
call plug#end()

" following are for linter:
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
set laststatus=2
let g:ale_lint_delay=1000

" following are for lightline:
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ }

set background=dark
"set background=light
let g:gruvbox_italic=1
"let g:solarized_term_italics=1
"let g:solarized_visibility='high'
set noshowmode
set tabstop=2

"disable ale
"set runtimepath-=~/.vim/bundle/ale

" tmux vim navigator
"let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Alt-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Alt-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Alt-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Alt-l> :TmuxNavigateRight<cr>
nnoremap <silent> <Alt-\\> :TmuxNavigatePrevious<cr>k

colorscheme gruvbox

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
