""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Usman Khan
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ========== Vundle {{{

" Run :PluginInstall to automatically retrieve and install plugins

" The following are required by Vundle
set nocompatible
filetype off

" Setup the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List of pluings
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'eagletmt/ghcmod-vim'
Plugin 'travitch/hasksyn'

" List of colorschemes
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scwood/vim-hybrid'
Plugin 'duythinht/inori'
Plugin 'baskerville/bubblegum'
"Plugin 'file:///home/usman/dev/vim-bubblegum-custom'

call vundle#end()
filetype plugin indent on

" }}}
" ========== Colorscheme {{{

" Enable syntax highlighting
syntax enable

" Set background (determines what colors are used by some colorschemes)
set background=dark

" Number of colors
set t_Co=256

colorscheme bubblegum-256-dark

" }}}
" ========== Leader Key {{{

" Set leader key to comma
let mapleader=","

" }}}
" ========== General {{{

" Completion mode
set wildmode=longest,list

" Ignore case when autocompleting file names
set wildignorecase

" Maintain a buffer of lines when scrolling up or down
set scrolloff=2

" Show line numbers
set number

" Always show status line
set laststatus=2

" Enable mouse support in all modes
set mouse=a

" Don't create swap files for buffers
set noswapfile

" Set textwidth to be longer than the default 78
set textwidth=120

" Show partial command as it is typed
set showcmd

" Don't redraw screen while executing macros
set lazyredraw

" Number of lines checked for set commands
set modelines=1

" Make Y yank to the end of the current line
nnoremap Y y$

" Swap ` and ' for marks
nnoremap ' `
nnoremap ` '

" }}}
" ========== CursorLine {{{

" Highlight current line
set cursorline

" Toggle cursorline
nnoremap <silent> <leader>c :set cursorline!<CR>

" }}}
" ========== Spaces and Tabs {{{

" Convert tab to spaces
set expandtab

" Number of spaces for each tab
set tabstop=2

" Number of spaces for each tab when editing
set softtabstop=2

" Number of spaces to use when indenting (e.g. >>, <<, etc.)
set shiftwidth=2

" Use shiftwidth instead of tabstop/softabstop on <Tab>
set smarttab

" Show special characters like tabs and trailing spaces
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¬

" Toggle list
nnoremap <silent> <leader>l :set list!<CR>

" }}}
" ========== Indentation {{{

" Continue the current line's indentation when starting a new line
set autoindent

" Copy the structure of the existing lines when autoindenting
set copyindent

" Disable auto-unindentation of lines staritng with #
set cinkeys-=0#

" }}}
" ========== Filetype {{{

" Enable loading plugin files based on filetype
filetype plugin on

" Enable loading indent files based on filetype
filetype indent on

" }}}
" ========== Search {{{

" Show matches while typing search pattern
set incsearch

" Highlight search pattern matches
set hlsearch

" Make search case-insensitive
set ignorecase

" Search becomes case-sensitive if an uppercase character is present
set smartcase

" Use very magic search
nnoremap / /\v
nnoremap ? ?\v

" Clear search highlighting
map <silent> <leader><space> :nohlsearch<CR>

" Visual mode search
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" }}}
" ========== Ctags {{{

set tags=./tags,tags,../tags;

" }}}
" ========== Tabline {{{

if exists('+showtabline')
    set tabline=%!MyTabLine()
endif

" Colors for tabline
highlight TabLine ctermfg=245 ctermbg=236
highlight TabLineFill ctermbg=236
highlight TabLineSel ctermfg=252 ctermbg=235 cterm=None

" }}}
" ========== Leader Shortcuts {{{

" Reload .vimrc file
nnoremap <leader>s :so $MYVIMRC<CR>

" Reload current file
nnoremap <leader>e :e!<CR>

" Trim all trailing whitespace from a file
nnoremap <leader>t :%s/\s\+$//<CR>:let @/=''<CR>

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Toggle Gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" Save
nnoremap <leader>w :w<CR>

" }}}
" ========== General Keybinds {{{

" Treat wrapped lines as multiple lines
nnoremap j gj
nnoremap k gk

" Swap 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" Visual select the last inserted text
nnoremap gV `[v`]

" }}}
" ========== Tab Creation and Navigation {{{

" Tab creation
nnoremap <leader>te :tabedit
nnoremap <leader>tm :tabmove

" Tab navigation
nnoremap t gt
noremap T gT

"}}}
" ========== CtrlP Configuration {{{

" Remap the keybinding used to invoke CtrlP.
"let g:ctrlp_map = '<leader>f'

"let g:ctrlp_cmd = 'CtrlPMixed'

" Use the pwd instead of the directory of the current file.
let g:ctrlp_working_path_mode = 'rwa'

" Resize the CtrlP window.
"let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'

" Remap <CR> to open files in a tab and <c-t> to open in the current window.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>', '<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" }}}
" ========== Airline Configuration {{{

let g:airline_theme = 'bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '│'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'paste'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = ''

" Shortform mode text
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" }}}
" ========== Buffer navigation {{{

nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bv :vert sb

" }}}
" ========== Custom Functions {{{

" Use current visual mode selection to search forward/backward
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Custom tabline formatting
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " Set up some variables
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)

        let s .= '%' . tab . 'T'
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' [' . tab . ':'

        if bufname != ''
            let s .= pathshorten(bufname)
        else
            let s .= 'No Name'
        endif

        let bufmodified = getbufvar(bufnr, "&mod")
        if bufmodified
            let s .= ' +] '
        else
            let s .= '] '
        endif
    endfor

    let s .= '%#TabLineFill#'
    let s .= '%T'
    let s .= '%='
    let s .= '%#TabLine#'
    let s .= '%999XX'

    return s
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
