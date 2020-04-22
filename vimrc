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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'jremmen/vim-ripgrep'
Plugin 'godlygeek/tabular'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Yggdroot/IndentLine'

" List of colorschemes
"Plugin 'sjl/badwolf'
"Plugin 'baskerville/bubblegum'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'ayu-theme/ayu-vim'

call vundle#end()
filetype plugin indent on

" }}}
" ========== Colorscheme {{{

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" Enable syntax highlighting
syntax enable

" Set background (determines what colors are used by some colorschemes)
set background=dark

colorscheme onedark

" }}}
" ========== Leader Key {{{

" Set leader key to comma
let mapleader=","

" }}}
" ========== General {{{

" Use old regex engine for better scrolling performance
set regexpengine=1

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

" Fix mouse scroll in columns past 223
if has('mouse_sgr')
    set ttymouse=sgr
endif

" Don't create swap files for buffers
set noswapfile

" Set textwidth to be longer than the default 78
set textwidth=0

" Show partial command as it is typed
set showcmd

" Don't redraw screen while executing macros
set lazyredraw

" Number of lines checked for set commands
set modelines=1

" Highlight column
set colorcolumn=80

" Line wrap
set nowrap

" Number of characters to scroll horizontally
set sidescroll=2

" Buffer to maintain during horizontal scrolling
set sidescrolloff=4

" Configure spell check
set spelllang=en_us

" }}}
" ========== Spaces and Tabs {{{

" Convert tab to spaces
set expandtab

" Number of spaces for each tab
set tabstop=4

" Number of spaces for each tab when editing
set softtabstop=4

" Number of spaces to use when indenting (e.g. >>, <<, etc.)
set shiftwidth=4

" Use shiftwidth instead of tabstop/softabstop on <Tab>
set smarttab

" Show special characters like tabs and trailing spaces
set listchars=tab:\|\ ,trail:·,precedes:,extends:,nbsp:·,space:·,eol:¬

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
" ========== Cursor {{{

" Change cursor based on mode
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Highlight current line
set nocursorline

" }}}
" ========== Filetype {{{

" Enable loading plugin files based on filetype
filetype plugin on

" Enable loading indent files based on filetype
filetype indent on

" }}}
" ========== Autocmd {{{

" Toggle cursorline on insert/normal modes
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline

" Don't expand tabs for makefiles
autocmd FileType make setlocal noexpandtab

autocmd BufNew,BufRead SConstruct setf python
autocmd BufNew,BufRead *.cfg set filetype=yaml

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

" Searches don't wrap
set nowrapscan

" Use very magic search
nnoremap / /\v
nnoremap ? ?\v

" Clear search highlighting
map <silent> <leader><space> :nohlsearch<CR>

" Visual mode search
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Search using ripgrep
nnoremap <leader>/ :Rg 

" }}}
" ========== Ctags {{{

set tags=./tags,tags,../tags;

" }}}
" ========== Tabline {{{

"if exists('+showtabline')
"    set tabline=%!MyTabLine()
"endif

" Colors for tabline
"highlight TabLine ctermfg=245 ctermbg=7 cterm=underline
"highlight TabLineFill ctermbg=7 cterm=underline
"highlight TabLineSel ctermfg=243 ctermbg=15 cterm=none

" }}}
" ========== Keybinds {{{

" Pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Reload .vimrc file
nnoremap <leader>so :so $MYVIMRC<CR>

" Toggle spell check
nnoremap <leader>sp :set spell!<CR>

" Reload current file
nnoremap <leader>e :e!<CR>

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Toggle Gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" Save
nnoremap <leader>w :w<CR>

" Make Y yank to the end of the current line
nnoremap Y y$

" Swap ` and ' for marks
nnoremap ' `
nnoremap ` '

" Treat wrapped lines as multiple lines
nnoremap j gj
nnoremap k gk

" Swap 0 and ^
"nnoremap 0 ^
"nnoremap ^ 0

" Visual select the last inserted text
nnoremap gV `[v`]

" Open and close quick fix window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>

" Zoom into current split
nnoremap <C-w>z <C-w><Bar><C-w>_

" Sort lines in paragraph
nnoremap <leader>i vip:sort<CR>

" Tabularize
nnoremap <leader>tab :Tabularize /
vnoremap <leader>tab :Tabularize /

" }}}
" ========== Tab Creation and Navigation {{{

" Tab creation
nnoremap <leader>te :tabedit
nnoremap <leader>tm :tabmove

" Tab navigation
nnoremap t gt
noremap T gT

"}}}
" ========== CtrlP {{{

" Remap the keybinding used to invoke CtrlP.
"let g:ctrlp_map = '<leader>f'

"let g:ctrlp_cmd = 'CtrlPMixed'

" Use the pwd instead of the directory of the current file.
let g:ctrlp_working_path_mode = 'rwa'

" Resize the CtrlP window.
"let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'

" Remap <CR> to open files in a tab and <c-t> to open in the current window.
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>', '<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }

let g:ctrlp_custom_ignore = {'dir': '\v(refroot|venv|build)$'}

" }}}
" ========== NERDTree {{{

nnoremap <silent> <leader>n :NERDTreeTabsToggle<CR>

" Disable header
let g:NERDTreeMinimalUI = 1

" Ignore certain extensions
let g:NERDTreeIgnore = ['\.d$', '\.o$', '\.tsk$', '\.pyc$', '__pycache__']

" Set window size on open
let g:NERDTreeWinSize = 40

" Single click to open directories, double click for files
let g:NERDTreeMouseMode = 3

" Cursorline withing NERDTree window
let g:NERDTreeHighlightCursorline = 0

" Collapse directories with only a single child directory
let g:NERDTreeCascadeSingleChildDir = 0

" }}}
" ========== Airline {{{

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_theme = 'papercolor'

" Enable branch
let g:airline#extensions#branch#enabled = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Dont show tab label in top
let g:airline#extensions#tabline#tabs_label = ''

" Don't show tab count in top right
let g:airline#extensions#tabline#show_tab_count = 0

" Don't show split names in top right
let g:airline#extensions#tabline#show_splits = 0

" Don't show buffers when there is only a single tab
let g:airline#extensions#tabline#show_buffers = 0

" Minimum tabs before tabline is shown
let g:airline#extensions#tabline#tab_min_count = 1

" Which number is displayed for each tab
let g:airline#extensions#tabline#tab_nr_type = 1

" Disable tagbar extension
let g:airline#extensions#tagbar#enabled = 0

" Unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'P'
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
" ========== IndentLine {{{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 7
" }}}
" ========== Tagbar {{{

nnoremap <silent> <leader>to :TagbarOpen fj<CR>
nnoremap <silent> <leader>tc :TagbarClose<CR>

" Focus tagbar on open
let g:tagbar_autofocus = 1

" Don't close upon jumping to a tag
let g:tagbar_autoclose = 0

" Open window on right side
let g:tagbar_left = 0

" Use single clicks
let g:tagbar_singleclick = 1

" }}}
" ========== YouCompleteMe {{{

" Set python interpreter used by ycmd. We point it to a fake one that launches
" this within a Docker container. The interpreter name must end in 'python'
"let g:ycm_server_python_interpreter = 'ymcd-python'

" Set global configuration file location
"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

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
        let s .= '  ' . tab . ':'

        if bufname != ''
            let s .= pathshorten(bufname)
        else
            let s .= 'No Name'
        endif

        let bufmodified = getbufvar(bufnr, "&mod")
        if bufmodified
            let s .= ' +  '
        else
            let s .= '  '
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
