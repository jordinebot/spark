" -----------------------------------------------
" BASIC SETTINGS
" -----------------------------------------------

" Enable syntax highlight
syntax on

" Show line numbers
set number

" Show command in bottom bar
set showcmd

" Highlight current line
set cursorline

" Show ruler on columns 80 & 120
set colorcolumn=80,100,120

" Always show signcolumns
set signcolumn=yes

" Default Tabs & Indent
set tabstop=4       " spaces per TAB
set shiftwidth=4    " spaces per TAB for autoindent
set softtabstop=4   " spaces per TAB when editing

" set expandtab       " Indent with spaces
set noexpandtab     " Indent with TAB

" Don't wrap long lines
set nowrap

" Make searching case insensitive
set ignorecase

" ... unless the query has capital letters.
set smartcase

" Indentation
set autoindent
set cindent
set smarttab

" Autodetect file types on buffer opening and
" enable specific indentation and plugins
filetype plugin indent on

" Interface response time to changes in ms
set updatetime=250

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Don't store backups or swap files since important files are
" always git tracked (also I save too often)
set nobackup
set nowritebackup
set noswapfile

" Set + as the default register so that vim yanks and pastes to/from
" system's clipboard by default
set clipboard=unnamedplus

" Enable mouse scroll and select
" https://stackoverflow.com/a/33358103/1534704
set mouse=a
" -----------------------------------------------
" MY PLUGINS
" -----------------------------------------------

" Automatically install vim-plug if missing
if empty(glob('~/.spark/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.spark/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.spark/nvim/plugged')

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Fuzzy file finding for neovim
Plug 'cloudhead/neovim-fuzzy'

" Color highlighting theme
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Text objects for the current line
Plug 'kana/vim-textobj-line'

" Create your own text objects (required by kana/vim-textobj-line)
Plug 'kana/vim-textobj-user'

" Provides support for expanding abbreviations
Plug 'mattn/emmet-vim'

" Vim plugin for the_silver_searcher
Plug 'Numkil/ag.nvim'

" Syntax highlighting and indenting for JSX.
Plug 'mxw/vim-jsx'

" Intellisense engine for vim8 & neovim, full language server protocol support
" as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'

" Vim plugin to toggle boolean values.
Plug 'sagarrakshe/toggle-bool'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim Syntax for SCSS (Sassy CSS)
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}

" Default snippets for UltiSnips and others
Plug 'honza/vim-snippets'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Vim syntax for TOML.
Plug 'cespare/vim-toml'

" Mustache and Handlebars mode for vim
Plug 'mustache/vim-mustache-handlebars'

" Syntax Highlight for Vue.js components
Plug 'posva/vim-vue'

" Initialize plugin system
call plug#end()

" Set system node as version to use
let g:coc_node_path = "/usr/local/bin/node"

" -----------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------

" Set path for python (required by ultisnips)
let g:python3_host_prog = '/usr/local/bin/python3'

" Hide some files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '.git$', 'tmp$', '.DS_Store']
let g:NERDTreeWinSize=45

" Use another Emmet Leader key
let g:user_emmet_leader_key=','

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use fzy as CtrlP
nnoremap <C-p> :FuzzyOpen<CR>

" Set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" Setup CoC Prettier extension
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Set tags path
set tags=tags

" https://github.com/ludovicchabant/vim-gutentags/issues/178
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

" To know when Gutentags is generating tags, add this to your vimrc:
set statusline+=%{gutentags#statusline()}


" -----------------------------------------------
" MY KEYBINDINGS
" -----------------------------------------------

" Set <Leader> key
let mapleader=","

" Edit/reload vimrc
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>

" better Esc
inoremap jj <Esc>j
inoremap kk <Esc>k

" Reindent
nnoremap <Leader>i mzgg=G`z<CR>

" Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" Save on leaving Insert mode
" inoremap <Esc> <Esc>:w<CR>

" Close current buffer without losing split
" http://stackoverflow.com/a/4468491/1534704
nnoremap <C-c> :bp\|bd #<CR>

" Close all buffers but current
nnoremap <Leader>co :%bd<bar>e #<bar>bd #<CR><CR>

" Cancel a search with Esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Replace all occurrences of word under cursor in the whole file
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Find all occurrences of word under cursor in the project
nnoremap <Leader>f :Ag <C-r><C-w><CR>

" Console.log word under cursor as variable
" nnoremap <silent><Leader>L :put! =printf('console.log(''%s:'',  %s);', expand('<cword>'), expand('<cword>'))<CR><Esc>==
nnoremap <silent><Leader>L "ayiwOconsole.log('<C-R>a:', <C-R>a);<Esc>
nnoremap <silent><Leader>l "ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>

" Toggle booleans
noremap ! :ToggleBool<CR>:w<CR>

" Abbreviations
cnoreabbrev vr vertical resize
cnoreabbrev ag Ag
cnoreabbrev W wa

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Sort inside brackets
nnoremap siB :?{?+,/}/-sort<CR>
nnoremap si{ :?{?+,/}/-sort<CR>
nnoremap si( :?(?+,/)/-sort<CR>
nnoremap si[ :?[?+,/]/-sort<CR>

" Enable/Disable spell check for current buffer
" ]s next, [s previous, z= suggestions, zg add word
nnoremap <Leader>o :setlocal spell spelllang=en_us<CR>
nnoremap <Leader>O :setlocal nospell<CR>

" Comment / Uncomment lines
nnoremap // :Commentary<CR>
vnoremap // :Commentary<CR>

" Go to Definition
noremap <Leader>m :ALEGoToDefinition<CR>zz

" Show method signature
nnoremap <Leader>d :ALEHover<CR>

" Apply prettier to selected range
vmap <Leader>p <Plug>(coc-format-selected)
nmap <Leader>p :Prettier<CR>

let g:prettier#config#config_precedence = 'file-override'


" -----------------------------------------------
" ADVANCED SETTINGS
" -----------------------------------------------

" Highlight Trailing Whitespace
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

" Disable Ex Mode
" https://vi.stackexchange.com/a/2692/11899
nnoremap Q <Nop>


" -----------------------------------------------
" THEME AND VISUAL SETTINGS
" -----------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokayo
if (has("termguicolors"))
	set termguicolors
endif

" Set airline theme
let g:airline_theme='dark'

" Show Airline arrows
let g:airline_powerline_fonts = 1

" -----------------------------------------------
" AUTOMATIC ACTIONS
" -----------------------------------------------

" Remove trailing spaces on save except for some filestypes
" https://stackoverflow.com/a/10410590/1534704
let exceptions = ['markdown']
autocmd BufWritePre * if index(exceptions, &ft) < 0 | :%s/\s\+$//e

" Wrap .md files to 120 cols
au BufRead,BufNewFile *.md,*.wiki setlocal textwidth=120
au BufRead,BufNewFile *.md,*.wiki setlocal formatoptions+=t

" Trigger autoread when changing buffers or coming back to vim.
" Useful after `git checkout --` on external terminal.
au FocusGained,BufEnter * :silent! !

" Workaround 'Insert <Paste>' bug in Neovim
" See https://github.com/neovim/neovim/issues/7994#issuecomment-388296360
au InsertLeave * set nopaste

" -----------------------------------------------
" TEXT EDITING
" -----------------------------------------------

" Quick way to move lines of text up or down.

" Normal mode
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

" Insert mode
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi

" Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv


" -----------------------------------------------
" BUFFER & SPLIT NAVIGATION
" -----------------------------------------------

" Allow hidden buffers (to switch without save first)
set hidden

" List buffers
map <Leader>. :ls<CR>:b

" Fast Next / Previous buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Split navigation with direction arrows
" faster than A-* and it forces me to navigate
" text with hjkl.
map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

" Increase and decrease vertical splits width
nnoremap <A-+> :vertical resize +10<CR>
nnoremap <A--> :vertical resize -10<CR>

nnoremap <C-s> :vsplit<CR>

