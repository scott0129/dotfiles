"----------------------- Vanilla Vim Settings -------------------"
set nocompatible                        " Not compatible with vi
filetype plugin on                      " Because I'm a pleb and use plugins
set noshowmode                          " Doesn't show --INSERT--
set tabstop=4                           " 4 space tabs
set softtabstop=0                       " No softtab
set shiftwidth=0                        " shiftwidth = tabstop
set expandtab                           " use spaces not tabs
set smarttab                            " backspace deletes tab-amount of spaces
set ignorecase                          " case insensitive.
set smartcase                           " case insensitive, UNLESS it's a capital letter 

set hlsearch                            " highlight searches
set incsearch                           " show search results while typing 

syntax on                               " Syntax highlighting! Colors!

set backupcopy=yes                      " Remove file rename swapping to work with Parcel HMR

set colorcolumn=101                     " wanna be your ruuuler (ruuuulerrr)

set showcmd                             " leader key activation visual feedback
set nowrap                              " some sanity in line wrapping

let mapleader=" "                       " spacebar leader key for maximum productivity

set number                              " Have line numbers!
set relativenumber                      " But also relative

set mouse=a                             " oh no

set wildmode=longest:list,full          " The little autocomplete menu when pressing tab in cmd-mode

set undofile                            " Maintain persistent undo history
set undodir=~/.vim/undodir              " Put all the undo records somewhere else



" open/close tag list
nnoremap <leader>t :TlistOpen<CR>
let Tlist_Close_On_Select = 1           " Close taglist after selecting


" fly through buffers using string matching!
nnoremap <leader><CR> :ls<CR>:b<space>

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction


" open/close nerdtree
nmap <leader>n :NERDTreeToggle<CR>


" insert single char
nnoremap <leader>i i_<Esc>r


" Sane line movement
nnoremap j gj
nnoremap k gk



set encoding=UTF-8                      " For DevIcons!


if has('nvim')
    " NEOVIM Autoinstall vim-plug 
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    " VIM Autoinstall vim-plug
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

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
Plug 'mustache/vim-mustache-handlebars' " Syntax highlighting for Mustache and Handlebars


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
Plug 'elmcast/elm-vim'                  " Elm support
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }


" --- Misc QOL --- 
Plug 'tomtom/tcomment_vim'              " Ezpz creating comments
Plug 'qpkorr/vim-bufkill'               " Kill buffers without closing the split!!


call plug#end()

" -------------------- Plugin Settings ---------------------

" -- YouCompleteMe --
let g:ycm_autoclose_preview_window_after_insertion = 1      " autoclose preview window

" -- Vim Mustache Handlebars -- 
let g:mustache_abbreviations = 1

" -- ALE --
" Next error
nmap <silent> <leader>ak <Plug>(ale_previous)

" Previous Error
nmap <silent> <leader>aj <Plug>(ale_next)
set laststatus=2                        " Make room for lightline
let g:ale_lint_delay=1000               " Woah slow down

" Use stack ghc instead of just ghc
let g:ale_linters = {
    \   'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools', 'hfmt'],
    \}

" See which linter is complaining
let g:ale_echo_msg_format = '%linter% says %s'



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

