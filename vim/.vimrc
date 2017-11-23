"Curated by Tako Marks from various sources

" ===== init =====
set nocompatible                  "Be iMproved

source ~/.vim/plug.vim            "Load Plug package manager

call plug#begin('~/.vim/plugged')

"My Plugs here:
" - Visual packages
Plug 'chriskempson/base16-vim'    "Dark colorscheme
Plug 'bling/vim-airline'          "ViM only powerline alternative
Plug 'edkolev/tmuxline.vim'       "ViM Airline theme to tmux

" - Functional packages
Plug 'tpope/vim-fugitive'         "Git wrapper
Plug 'neomake/neomake'            "Syntax checker
Plug 'scrooloose/nerdtree'        "Filebrowser plugin
Plug 'junegunn/fzf'               "Quick search with fzf
Plug 'junegunn/fzf.vim'
Plug 'msanders/snipmate.vim'      "Snips plugin, like in ST2/3
Plug 'Lokaltog/vim-easymotion'    "Quickly and easily move through windows
Plug 'tpope/vim-repeat'           "enable repeating supported plugin maps with.
Plug 'vimwiki/vimwiki'            "Wiki plugin for ViM

" - Language plugins
Plug 'vim-scripts/JSON.vim'       "JSON syntax highlighting
Plug 'elixir-lang/vim-elixir'     "Elixir syntax highlighting
Plug 'plasticboy/vim-markdown'    "Markdown highlighting and rules with mappings
Plug 'rust-lang/rust.vim'         "Rust language support + autoformatting

" - Completion engine
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/echodoc.vim'

call plug#end()

"Plug settings
let g:plug_window="horizontal topleft new"

" Enable filetype plugins
filetype plugin on
filetype indent on

" ===== general =====
set history=100                     "Sets how many lines of history VIM has to remember
let mapleader = ","                 "Set the leader key

set modelines=0                     "Prevent modelines security exploits
au FocusLost * :silent! wall        "Save when losing focus
set fileencoding=utf-8              "Save as UTF-8 files as default
set scrolloff=6                     "When scrolling, leave the bottom six lines

set title                           "Change the terminal's title
set visualbell                      "Don't beep
set cursorline                      "Highlight the line the cursor is on
set ttyfast                         "Use fast scrolling
set ruler                           "Show the location in the file
set number                          "Show line numbers
set showcmd                         "Show partial commands in statusline
set showmatch                       "Set show matching parenthesis
set wildmenu                        "Visual autocomplete for command menu
set autoindent                      "Automatically use indent settings of previous line
set backspace=indent,eol,start      "Make backspace work sanely
set hidden                          "Allow for hidden buffers that haven't been written to disk
set wrap                            "Wrap long lines
set linebreak                       "Wraps at words
set colorcolumn=80                  "Highlight line 80
set textwidth=80                    "Automatically wrap lines at 80 characters
set nojoinspaces                    "No two spaces after .?!

" Smarter search settings
set ignorecase                      "Ignore case...
set smartcase                       "Except when capatilization is used
set incsearch                       "show search matches as you type
set hlsearch                        "Highlight matching strings

" Invisible character settings
set list                            "show invisable characters
set listchars=tab:▸\ ,eol:¬         "set invisable character symbols

" ===== mappings =====
"Sane up and down in wrapped lines
nnoremap k gk
nnoremap j gj

"Search through files with fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :Commits<CR>

if has('nvim')
  "Escape from terminal emulator
  tnoremap <Esc> <C-\><C-n>
  "Easier window movement
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

"Move easily between windows with alt keys
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Yank to OS buffer
noremap <leader>y "+y
noremap <leader>yy "+yy

"Tab to cycles forward/backward through all buffers
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

"Quickly load/use vimrc
nnoremap <leader>ev :e $HOME/.vimrc<CR>
nnoremap <leader>sv :source $HOME/.vimrc<CR>

" ====== fzf =====
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" ===== visual =====
syntax on
let base16colorspace=256            "Access colors present in 256 colorspace
colorscheme base16-tomorrow         "Set colorscheme
set background=dark                 "Pick dark theme version
hi Normal ctermbg=none              "Disable background color for transparency

" ===== ident/whitespace =====
set expandtab                       "Indentation with spaces
set shiftwidth=2                    "Spaces used for each step in autoindent
set softtabstop=2                   "Spaces used for Tab
autocmd BufWritePre * :%s/\s\+$//e  "Cleanup file whitespace when saving

" ===== misc =====
set mouse=a
set wim=longest,full                "Wildmode settings
set writebackup                     "Do not keep backup files after writeing changes to disk
set noswapfile                      "Do not write annoying intermediate swap files,
set undofile                        "Remember history after file write until reboot
set undodir=/tmp/vimundo//          "Store swap files in fixed location, not current directory.

" ====== markdown ======
let g:vim_markdown_folding_disabled=1 "Disable markdown plugin folds

" ====== airline =====
set laststatus=2                    "Always show statusline
set ttimeoutlen=50                  "More responsive mode indicator in statusline
let g:airline_powerline_fonts=1     "Use nice powerline patched font symbols
"
" ===== nerdtree =====
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1            "Show hidden files and folders
let NERDTreeHighlightCursorline=1   "Highlight cursor line
let NERDTreeMouseMode=2             "Able to use the mouse to open directories and files
let NERDTreeIgnore = ['\.DS_Store$', '\.un\~$', '\.swp$']       " Set file filtering patterns

" ===== easymotion =====
let g:EasyMotion_leader_key = '<space>'   "Easymotion leader key to spacebar

" ===== Neomake =====
call neomake#configure#automake('w')

" ===== LanguagServer =====
let g:LanguageClient_autoStart = 1  " Automatically start language servers.
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:deoplete#enable_at_startup = 1
