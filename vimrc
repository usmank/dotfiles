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

" General
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/tagbar'
Plugin 'kyazdani42/nvim-tree.lua'
Plugin 'sheerun/vim-polyglot'
Plugin 'godlygeek/tabular'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'file:///Users/ukhan47/code/note-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
"Plugin 'nvim-treesitter/nvim-treesitter'

" Language server and autocompletion
"Plugin 'neovim/nvim-lspconfig'

" Color schemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rakr/vim-one'
Plugin 'base16-project/base16-vim'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'yorik1984/newpaper.nvim'
"Plugin 'jacoborus/tender.vim'
Plugin 'file:///Users/ukhan47/code/tender.vim'
Plugin 'bluz71/vim-nightfly-guicolors'
Plugin 'rktjmp/lush.nvim'
Plugin 'alaric/nortia.nvim'
Plugin 'folke/tokyonight.nvim'


call vundle#end()
filetype plugin indent on

set rtp+=~/.vim/

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

"let g:one_allow_italics = 1

"lua << END
"require("newpaper").setup({
"    style = "dark",
"    sidebars_contrast = {"NvimTree", "tagbar"},
"    error_highlight = "bg",
"    italic_strings = false,
"    italic_functions = true,
"})
"END

set background=light
colorscheme base16-solarized-light

set guifont=Input\ Mono:h18

" }}}
" ========== Leader Key {{{

" Set leader key
nnoremap <space> <nop>
let mapleader=" "

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
if !has('nvim') && has('mouse_sgr')
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

set splitright

"set undodir=~/.vimundo
"set undofile

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
set listchars=tab:\|\•,trail:•,precedes:‹,extends:›,nbsp:•,space:•,eol:¬

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

" }}}
" ========== Ctags {{{

set tags=./tags,tags,../tags;

" }}}
" ========== Tabline {{{

"if exists('+showtabline')
"    set tabline=%!MyTabLine()
"endif

" Colors for tabline
"highlight TabLine guibg=red
"highlight TabLineFill guibg=#000000 gui=underline
"highlight TabLineSel guibg=#ffe5e3  guifg=colour4 gui=bold

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
vnoremap j gj
vnoremap k gk

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

" Toggle IndentLines
nnoremap <silent> <leader>m :IndentLinesToggle<CR>

" Increment and decrement
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>

" === Fugitive (Git) ===
" Open Fugitive status window
nnoremap <leader>gg :G<CR>

" Open log in quickfix list
nnoremap <leader>gl :GcLog<CR>

" Git diff the current file
nnoremap <leader>gd :Gvdiffsplit<CR>

" Git blame the current file
nnoremap <leader>gb :G blame<CR>

" === fzf ===
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>o :BTags<CR>
nnoremap <leader>O :Tags<CR>
nnoremap <leader>/ :Rg 

" }}}
" ========== Tab Creation and Navigation {{{

" Tab navigation
nnoremap t gt
noremap T gT

"}}}
" ========== CtrlP {{{

" Remap the keybinding used to invoke CtrlP.
"let g:ctrlp_map = '<leader>f'

"let g:ctrlp_cmd = 'CtrlPMixed'

" Use the pwd instead of the directory of the current file.
"let g:ctrlp_working_path_mode = 'rwa'

" Resize the CtrlP window.
"let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'

" Remap <CR> to open files in a tab and <c-t> to open in the current window.
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>', '<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }

"let g:ctrlp_custom_ignore = {'dir': '\v(refroot|venv|build)$'}

" }}}
" ========== nvim-tree {{{

lua << END
require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
    renderer = {
        indent_markers = {
          enable = false,
        },
        icons = {
            padding = "",
            show = {
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "›",
                    arrow_open = "⌄",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
    git = {
        enable = false,
    },
})
END

nnoremap <silent> <leader>n :NvimTreeToggle<CR>

"nnoremap <silent> <leader>n :NERDTreeTabsToggle<CR>
"
"" Disable header
"let g:NERDTreeMinimalUI = 1
"
"" Ignore certain extensions
"let g:NERDTreeIgnore = ['\.d$', '\.o$', '\.tsk$', '\.pyc$', '__pycache__']
"
"" Set window size on open
"let g:NERDTreeWinSize = 40
"
"" Single click to open directories, double click for files
"let g:NERDTreeMouseMode = 3
"
"" Cursorline withing NERDTree window
"let g:NERDTreeHighlightCursorline = 0
"
"" Collapse directories with only a single child directory
"let g:NERDTreeCascadeSingleChildDir = 0

" }}}
" ========== Airline {{{

"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ }

let g:airline_theme = 'one'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_theme = 'papercolor'

let g:airline_section_c = '%t %m'

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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'PASTE'
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
"let g:indentLine_char = '┆'
"let g:indentLine_first_char = '┆'
"let g:indentLine_showFirstIndentLevel = 0
" }}}
" ========== Tagbar {{{

nnoremap <silent> <F8> :TagbarToggle<CR>

" Focus tagbar on open
let g:tagbar_autofocus = 1

" Close upon jumping to a tag
let g:tagbar_autoclose = 1

" Open window on right side
let g:tagbar_left = 0

" Use single clicks
let g:tagbar_singleclick = 1

" }}}
" ========== Highlights {{{

" Spell checker highlighting
highlight SpellBad guibg=#ffe5e3 gui=none
highlight SpellCap guibg=#e3efff gui=none
highlight SpellLocal gui=none cterm=none
highlight SpellRare gui=none cterm=none

" Search highlighting
highlight Search gui=bold term=reverse ctermfg=230 ctermbg=255 guifg=#1e1e1e guibg=#ffe1a1
"highlight Search gui=reverse term=none ctermfg=255 ctermbg=230

" Cursorline
"highlight CursorLine guibg=#101010

" Visual Mode Selection
highlight Visual ctermbg=7 guibg=#eee8d5

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
" ========== treesitter {{{

"lua << END
"require('nvim-treesitter.configs').setup({
"    -- A list of parser names, or "all"
"    ensure_installed = {
"        "bash",
"        "c",
"        "clojure",
"        "cmake",
"        "comment",
"        "cpp",
"        "dockerfile",
"        "dot",
"        "fish",
"        "fortran",
"        "go",
"        "graphql",
"        "haskell",
"        "html",
"        "java",
"        "javascript",
"        "jsdoc",
"        "json",
"        "json5",
"        "latex",
"        "llvm",
"        "markdown",
"        "markdown_inline",
"        "ninja",
"        "ocaml",
"        "perl",
"        "python",
"        "query",
"        "regex",
"        "ruby",
"        "rust",
"        "scheme",
"        "toml",
"        "typescript",
"        "vim",
"        "yaml" },
"
"    -- Install parsers synchronously (only applied to `ensure_installed`)
"    sync_install = false,
"
"    -- Automatically install missing parsers when entering buffer
"    auto_install = true,
"
"    -- List of parsers to ignore installing (for "all")
"    ignore_install = {},
"
"    highlight = {
"        -- `false` will disable the whole extension
"        enable = true,
"
"        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
"        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
"        -- the name of the parser)
"        -- list of language that will be disabled
"        disable = {},
"
"        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"        -- Using this option may slow down your editor, and you may see some duplicate highlights.
"        -- Instead of true it can also be a list of languages
"        additional_vim_regex_highlighting = false,
"    },
"})
"END

" }}}
" ========== vim-rhubarb {{{

let g:github_enterprise_urls = ['https://bbgithub.dev.bloomberg.com']

" }}}
" ========== fzf {{{

let g:fzf_tags_command = 'ctags -R'

" }}}

" vim:foldmethod=marker:foldlevel=0
