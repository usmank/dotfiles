""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Usman Khan
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle {{{

" Run :PluginInstall to automatically retrieve and install plugins

" The following are required by Vundle
set nocompatible
filetype off

" Setup the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List of pluings
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/unite.vim'

call vundle#end()
filetype plugin indent on

" }}}
" Colorscheme {{{

" Enable syntax highlighting
syntax on

" Set background (determines what colors are used by some colorschemes)
set background=dark

" Number of colors
set t_Co=256

" Determines which version of the solarized colorscheme gets used
"let g:solarized_termcolors=256

colorscheme molokai

" }}}
" General {{{

" Completion mode
set wildmode=longest,list

" Maintain a buffer of lines when scrolling up or down
set scrolloff=2

" Show line numbers
set number

" Always show status line
set laststatus=2

" Highlight current line
set cursorline

" Enable mouse support in all modes
set mouse=a

" Don't create swap files for buffers
set noswapfile

" Highlight the 81st column
set colorcolumn=81

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
" Spaces and Tabs {{{

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
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¬

nnoremap <silent> <leader>l :set list!<CR>

" }}}
" Indentation {{{

" Continue the current line's indentation when starting a new line
set autoindent

" Copy the structure of the existing lines when autoindenting
set copyindent

" Disable auto-unindentation of lines staritng with #
set cinkeys-=0#

" }}}
" Filetype {{{

" Enable loading plugin files based on filetype
filetype plugin on

" Enable loading indent files based on filetype
filetype indent on

" }}}
" Search {{{

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
" Ctags {{{

set tags=./.tags,.tags,../.tags;

" }}}
" Tabline {{{

set tabline=%!MyTabLine()

" Colors for tabline
highlight TabLine ctermfg=250 ctermbg=233 cterm=None
highlight TabLineFill ctermfg=16 ctermbg=233 cterm=None
highlight TabLineSel ctermfg=233 ctermbg=33 cterm=None

" }}}
" Leader Shortcuts {{{

" Set leader key to comma
let mapleader=","

" Reload .vimrc file
nnoremap <leader>r :so $MYVIMRC<CR>

" Toggle cursorline
nnoremap <silent> <leader>c :set cursorline!<CR>

" Strip all trailing whitespace from a file
nnoremap <leader>s :%s/\s\+$//<CR>:let @/=''<CR>

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Toggle Gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" }}}
" General Navigation {{{

" Treat wrapped lines as multiple lines
nnoremap j gj
nnoremap k gk

" Swap 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" Tab finds matching bracket
noremap <tab> %

" Visual select the last inserted text
nnoremap gV `[v`]

" }}}
" Tab Creation and Navigation {{{

" Tab creation
nnoremap <leader>te :tabedit 
nnoremap <leader>tm :tabmove 

" Tab navigation
nnoremap t gt
noremap T gT

"}}}
" Unite Configuration {{{

" Use fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <silent> <leader>f :Unite -start-insert buffer file_rec<CR>

" }}}
" Buffer navigation {{{

nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bv :vert sb 

" }}}
" Custom Functions {{{

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
if exists("+showtabline")
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
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
