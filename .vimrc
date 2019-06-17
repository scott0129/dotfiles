"----------------------- Vanilla Vim Settings -------------------"
set nocompatible          		   		" Not compatible with vi
filetype plugin on              	   	" Because I'm a pleb and use plugins
set noshowmode							" Doesn't show --INSERT--
set tabstop=4							" 4 space tabs
set softtabstop=0						" No softtab
set shiftwidth=0						" shiftwidth = tabstop
set expandtab							" use spaces not tabs
set smarttab							" backspace deletes tab-amount of spaces


syntax on								" Syntax highlighting! Colors!

set shellcmdflag=-ic					" have :! behave like cmd prompt

set colorcolumn=99						" ruler

set showcmd 							" leader key activation visual feedback

let mapleader=" "						" spacebar leader key for maximum productivity

" open/close tag list
nnoremap <leader>t :TlistToggle<CR>

" fly through buffers
nnoremap <leader>l :ls<CR>:b<space>

" open/close nerdtree
nmap <leader>n :NERDTreeToggle<CR>


" fzf through buffers
function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
            \   'source':  reverse(<sid>buflist()),
            \   'sink':    function('<sid>bufopen'),
            \   'options': '+m',
            \   'down':    len(<sid>buflist()) + 2
            \ })<CR>


set number relativenumber				" Have line number AND relative number, bonkers

set encoding=UTF-8						" Cause we're a modern society that uses DevIcons

"----------------------- Plugins ----------------------"
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'

" --- Use neovim if we have it ---
if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
endif


" --- Cosmetic ---
Plug 'morhetz/gruvbox'					" Nice colors
Plug 'itchyny/lightline.vim'			" Little status line on the bottom
Plug 'airblade/vim-gitgutter'			" Lets me know which lines are new/deleted/modified
Plug 'ryanoasis/vim-devicons'			" Nice icons for Nerdtree c:


" --- Navigation ---
Plug 'christoomey/vim-tmux-navigator'	" Navigate between vim & tmux using the same keybindings
Plug 'universal-ctags/ctags'			" Create tags for navigating functions
Plug 'vim-scripts/taglist.vim'			" and then have a nice list of them
Plug 'scrooloose/nerdtree'				" Filetree navigation!
Plug '~/.fzf'							" Fuzzy find for jetpack flying through files


" --- Linter/Code Completion ---
Plug 'w0rp/ale'							" Asynchronous Lint Engine cause my code doesn't compile
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'} 	" Text completion


" --- Misc QOL --- 
Plug 'tomtom/tcomment_vim'				" Ezpz creating comments
Plug 'qpkorr/vim-bufkill'				" Kill buffers without closing the split!!


call plug#end()

" -------------------- Plugin Settings ---------------------

" -- YouCompleteMe --
let g:ycm_autoclose_preview_window_after_insertion = 1		" autoclose preview window

" -- ALE --
" Next error
nmap <silent> <leader>ak <Plug>(ale_previous)
" Previous Error
nmap <silent> <leader>aj <Plug>(ale_next)
set laststatus=2						" Make room for lightline
let g:ale_lint_delay=1000				" Woah slow down matey

" -- Lightline --
" Nice colors c:
let g:lightline = {
            \ 'colorscheme': 'Tomorrow_Night',
            \ }

" -- NERDtree --
:let g:NERDTreeWinSize=20				" It's the size. Of the window. C'mon man

" -- Gruvbox --
colorscheme gruvbox
"let g:gruvbox_italic=1					" Italics don't like tmux
let g:gruvbox_contrast_dark = 'hard'	" Cause we go hard bois
let g:gruvbox_contrast_light = 'hard'	" even if we're light-theme
set background=dark						" but we're not
"set background=light					" but in case we want to

" -- tmux-vim-navigator --
" Super simple way to move between tmux + vim panes using just one key binding
nnoremap <silent> <Alt-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Alt-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Alt-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Alt-l> :TmuxNavigateRight<cr>
nnoremap <silent> <Alt-\\> :TmuxNavigatePrevious<cr>

" -- Devicons --
" Refresh devicons when sourcing vimrc (for troubleshooting)
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
