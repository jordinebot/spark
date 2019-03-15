" -----------------------------------------------
" BASIC SETTINGS
" -----------------------------------------------

" Set nvim interface language to en_US
language en_US

" Enable syntax highlight
syntax enable

" Show line numbers
set number

" Show command in bottom bar
set showcmd

" Highlight current line
set cursorline

" Show ruler on columns 80 & 120
set colorcolumn=80,120

" Default Tabs & Indent
set tabstop=2       " spaces per TAB
set shiftwidth=2    " spaces per TAB for autoindent
set softtabstop=2   " spaces per TAB when editing
set expandtab       " TAB with spaces
set autoindent
set copyindent      " copy indent from the previous line
set nowrap          " By default, don't wrap long lines

" Make searching case insensitive
set ignorecase

" ... unless the query has capital letters.
set smartcase

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
set noswapfile


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

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Fuzzy file finding for neovim
Plug 'cloudhead/neovim-fuzzy'

" Color highlighting theme
Plug 'patstockwell/vim-monokai-tasty'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}

"Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'

" Syntax Highlight for Vue.js components
Plug 'posva/vim-vue'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Vim Syntax for SCSS (Sassy CSS)
Plug 'hail2u/vim-css3-syntax'
Plug 'ObserverOfTime/scss.vim', {'for': 'scss'}

" The ultimate snippet solution for Vim
Plug 'sirver/ultisnips'

" Default snippets for UltiSnips and others
Plug 'honza/vim-snippets'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Asynchronous linting/fixing for Vim
Plug 'w0rp/ale'

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'

"Vim script for automatically detecting indent settings
Plug 'ciaranm/detectindent'

"A (Neo)vim plugin for formatting code.
Plug 'sbdchd/neoformat'

" Initialize plugin system
call plug#end()


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
nnoremap <leader>i mzgg=G`z<CR>

" Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" Save on leaving Insert mode
inoremap <Esc> <Esc>:w<CR>

" Close current buffer without losing split
" http://stackoverflow.com/a/4468491/1534704
nnoremap <C-c> :bp\|bd #<CR>

" Close all buffers but current
nnoremap <Leader>co :%bd<bar>e #<bar>bd #<CR><CR>

" Abbreviations
cnoreabbrev vr vertical resize
cnoreabbrev ag Ag
cnoreabbrev W w

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Sort inside brackets
nnoremap siB :?{?+,/}/-sort<CR>
nnoremap si{ :?{?+,/}/-sort<CR>
nnoremap si( :?(?+,/)/-sort<CR>

" Enable/Disable spell check for current buffer
" ]s next, [s previous, z= suggestions, zg add word
nnoremap <leader>o :setlocal spell spelllang=en_us<CR>
nnoremap <leader>O :setlocal nospell<CR>


" -----------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------

" Set path for python (required by ultisnips)
let g:python3_host_prog = '/usr/local/bin/python3'

" Enable deoplete (for local autocompletion) on startup
" let g:deoplete#enable_at_startup = 1

" Hide some files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '.git$', 'tmp$', '.DS_Store']

" Use another Emmet Leader key
let g:user_emmet_leader_key=','

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use fzy as CtrlP
nnoremap <C-p> :FuzzyOpen<CR>

" Ultisnips
let g:UltiSnipsSnippetsDir='~/.spark/nvim/ultisnips'
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" coc.nvim integration with airline
"if you want to disable auto detect, comment out those two lines
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Use Prettier keybinding for Neoformat
nnoremap <Leader>p :Neoformat<CR>


" -----------------------------------------------
" ADVANCED SETTINGS
" -----------------------------------------------

" Highlight trailing whitespaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

" Cancel a search with Esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Replace all occurrences of word under cursor in the whole file
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Disable Ex Mode
" https://vi.stackexchange.com/a/2692/11899
nnoremap Q <Nop>


" -----------------------------------------------
" THEME AND VISUAL SETTINGS
" -----------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
if (has("termguicolors"))
    set termguicolors
endif


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

" Auto detect indentation when opening a new buffer
autocmd BufReadPost * :DetectIndent


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

" Split navigation
nnoremap <A-h> <C-w><C-h>
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>

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
