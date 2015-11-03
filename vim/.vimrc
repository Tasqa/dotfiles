"ViM config file
"Curated by Tako Marks from various sources

" ===== init =====
set nocompatible                  "Be iMproved

source ~/.vim/plug.vim            "Load Plug package manager

call plug#begin('~/.vim/plugged')

" My Plugs here:
Plug 'bling/vim-airline'          "ViM only powerline alternative
Plug 'chriskempson/base16-vim'    "Dark colorscheme
Plug 'kien/ctrlp.vim'             "Quickly switch buffers
Plug 'scrooloose/nerdtree'        "Filebrowser plugin
Plug 'Lokaltog/vim-easymotion'    "Quickly and easily move through windows
Plug 'elixir-lang/vim-elixir'     "Elixir syntax highlighting
Plug 'scrooloose/syntastic'       "Syntax checking
Plug 'vim-scripts/JSON.vim'       "JSON syntax highlighting
Plug 'tpope/vim-fugitive'         "Git wrapper
Plug 'msanders/snipmate.vim'      "Snips plugin, like in ST2/3
Plug 'tpope/vim-repeat'           "enable repeating supported plugin maps with .
Plug 'plasticboy/vim-markdown'    "Markdown highlighting and rules with mappings
Plug 'edkolev/tmuxline.vim'       "ViM Airline theme to tmux
Plug 'davidhalter/jedi-vim'       "Python autocompletion

call plug#end()

" ===== general =====
set history=50                      "Sets how many lines of history VIM has to remember
let mapleader = ","                 "Set the leader key

" Enable filetype plugins
filetype plugin on
filetype indent on

set modelines=0                     "Prevent modelines security exploits
au FocusLost * :silent! wall        "Save when losing focus
set encoding=utf-8                  "UTF-8 encoding as default
set scrolloff=6                     "When scrolling, leave the bottom six lines free

set title                           "Change the terminal's title
set visualbell                      "Don't beep
set noerrorbells                    "Don't beep
set cursorline                      "Highlight the line the cursor is on
set ttyfast                         "Use fast scrolling
set ruler                           "Show the location in the file
set number                          "Show line numbers
set showcmd                         "Show partial commands in statusline
set showmatch                       "Set show matching parenthesis
set autoindent                      "Automatically use indent settings of previous line
set backspace=indent,eol,start      "Make backspace work sanely
set hidden                          "Allow for hidden buffers that haven't been written to disk

" Smarter search settings
set ignorecase                      "Ignore case...
set smartcase                       "Except when capatilization is used
set incsearch                       "show search matches as you type
set hlsearch                        "Highlight matching strings

" Invisible character settings
set list                            "show invisable characters
set listchars=tab:▸\ ,eol:¬         "set invisable character symbols

" ===== buffers =====
nmap <Tab> :bn<CR>              "Tab cycles forward through all buffers
nmap <S-Tab> :bp<CR>            "Shift Tab cycles backwards through all buffers

" ===== visual =====
syntax on
let base16colorspace=256            "Access colors present in 256 colorspace
colorscheme base16-tomorrow         "Set colorscheme
set background=dark                 "Pick dark theme version
hi Normal ctermbg=NONE              "Disable background color for transparency

" ===== ident/whitespace =====
set expandtab                       "Indentation with spaces
set smarttab
set shiftwidth=2                    "Spaces used for each step in autoindent
set softtabstop=2                   "Spaces used for Tab
set shiftround
autocmd BufWritePre * :%s/\s\+$//e  "Cleanup file whitespace when saving

" ===== misc =====
set mouse=a
set wim=list:full                   "Wildmode settings
set writebackup                     "Do not keep backup files after writeing changes to disk
set noswapfile                      "Do not write annoying intermediate swap files,
set undofile                        "Remember history after file write until reboot
set undodir=/tmp/nvimundo//         "Store swap files in fixed location, not current directory.

" ====== markdown ======
let g:vim_markdown_folding_disabled=1 "Disable markdown plugin folds

" ====== airline =====
set laststatus=2                    "Always show statusline
set ttimeoutlen=50                  "More responsive mode indicator in statusline
let g:airline_powerline_fonts=1     "Use nice powerline patched font symbols

" ===== nerdtree =====
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1            "Show hidden files and folders
let NERDTreeHighlightCursorline=1   "Highlight cursor line
let NERDTreeMouseMode=2             "Use a single click to fold/unfold directories and a double click to open
let NERDTreeIgnore = ['\.DS_Store$', '\.un\~$', '\.swp$']       " Set file filtering patterns

" ===== easymotion =====
let g:EasyMotion_leader_key = '<space>'             "Easymotion leader key to spacebar

" ===== syntastic =====
set statusline+=%{SyntasticStatuslineFlag()}        "Show Syntastic errors in statusline
let g:syntastic_check_on_open=1     "Check syntax on file open
let g:syntastic_enable_signs=1      "Show errors in ruler

" ===== vimrc reloading =====
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
