"----------------------- Vanilla Vim Settings -------------------"
set nocompatible                        " Not compatible with vi
filetype plugin on                      " Because I'm a pleb and use plugins
set noshowmode                          " Doesn't show --INSERT--
set tabstop=4                           " 4 space tabs
set softtabstop=0                       " No softtab
set shiftwidth=0                        " shiftwidth = tabstop
set expandtab                           " use spaces not tabs
set smarttab                            " backspace deletes tab-amount of spaces
set ignorecase                          " case insensitive 
set smartcase                           " unless it's a capital letter 

syntax on                               " Syntax highlighting! Colors!

set colorcolumn=101                     " ruler

set showcmd                             " leader key activation visual feedback

let mapleader=" "                       " spacebar leader key for maximum productivity

set number                              " Have line numbers!

set mouse=a                             " i'm sorry

set wildmode=longest:list,full          " The little autocomplete menu when pressing tab in cmd-mode

" open/close tag list
nnoremap <leader>t :TlistOpen<CR>
let Tlist_Close_On_Select = 1           " Close taglist after selecting

" fly through buffers
nnoremap <leader><CR> :ls<CR>:b<space>

" open/close nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" insert single char
nnoremap <leader>i i_<Esc>r


function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction


set encoding=UTF-8                      " For DevIcons!

"----------------------- Plugins ----------------------"
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'

" --- Use neovim if we have it ---
if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
endif


" --- Cosmetic ---
Plug 'morhetz/gruvbox'                  " Nice colors
Plug 'itchyny/lightline.vim'            " Little status line on the bottom
Plug 'airblade/vim-gitgutter'           " Lets me know which lines are new/deleted/modified
Plug 'ryanoasis/vim-devicons'           " Nice icons for Nerdtree c:


" --- Navigation ---
Plug 'christoomey/vim-tmux-navigator'   " Navigate between vim & tmux using the same keybindings
Plug 'universal-ctags/ctags'            " Create tags for navigating functions
Plug 'vim-scripts/taglist.vim'          " and then have a nice list of them
Plug 'scrooloose/nerdtree'              " Filetree navigation!
Plug '~/.fzf'                           " Fuzzy find for jetpack flying through files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" --- Linter/Code Completion ---
Plug 'w0rp/ale'                         " Asynchronous Lint Engine cause my code doesn't compile
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}    " Text completion


" --- Misc QOL --- 
Plug 'tomtom/tcomment_vim'              " Ezpz creating comments
Plug 'qpkorr/vim-bufkill'               " Kill buffers without closing the split!!


call plug#end()

" -------------------- Plugin Settings ---------------------

" -- YouCompleteMe --
let g:ycm_autoclose_preview_window_after_insertion = 1      " autoclose preview window

" -- ALE --
" Next error
nmap <silent> <leader>ak <Plug>(ale_previous)
" Previous Error
nmap <silent> <leader>aj <Plug>(ale_next)
set laststatus=2                        " Make room for lightline
let g:ale_lint_delay=1000               " Woah slow down matey

" -- Lightline --
" Nice colors c:
let g:lightline = {
            \ 'colorscheme': 'Tomorrow_Night',
            \ }

" -- NERDtree --
let g:NERDTreeWinSize=20               " The size, of the window

" -- Gruvbox --
"let g:gruvbox_italic=1                 " Italics don't like tmux
let g:gruvbox_contrast_dark = 'hard'    " Cause we go hard bois
let g:gruvbox_contrast_light = 'hard'   " even if we're light-theme
colorscheme gruvbox                     " groovy
set background=dark                     " dark mode

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



" --------- Vanilla Vim Settings To Override Plugin Settings --------

set cursorline                          " Highlight current line
highlight clear cursorline              " But only the line number (must be after colorscheme)

