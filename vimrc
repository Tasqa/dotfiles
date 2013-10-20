 "ViM config file
 "Curated by Tako Marks by various sources

 " ===== init =====
set nocompatible                        "Be iMproved

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 NeoBundle 'Shougo/vimproc'

 " My Bundles here:
 NeoBundle 'bling/vim-airline'          "ViM only powerline alternative
 NeoBundle 'chriskempson/vim-tomorrow-theme'    "Custom colorscheme
 NeoBundle 'kien/ctrlp.vim'             "Quickly switch buffers
 NeoBundle 'scrooloose/nerdtree'        "Filebrowser plugin
 NeoBundle 'Lokaltog/vim-easymotion'    "Quickly and easily move through windows
 NeoBundle 'elixir-lang/vim-elixir'     "Elixir syntax highlighting
 NeoBundle 'plasticboy/vim-markdown'    "Markdown syntax highlighting
 NeoBundle 'scrooloose/syntastic'       "Syntax checking
 NeoBundle 'tpope/vim-rails'            "Rails shizzle
 NeoBundle 'vim-scripts/JSON.vim'       "JSON syntax highlighting
 NeoBundle 'tpope/vim-fugitive'         "Git wrapper
 NeoBundle 'msanders/snipmate.vim'      "Snips plugin, like in ST2/3
 NeoBundle 'Valloric/YouCompleteMe'     "Code completion engine!
 NeoBundle 'tpope/vim-sleuth'           "Plugin for auto identation settings
 NeoBundle 'tpope/vim-surround'         "Plugin for surrounding managing quotes and brackets
 NeoBundle 'tpope/vim-repeat'           "enable repeating supported plugin maps with .
 NeoBundle 'plasticboy/vim-markdown'    "Markdown highlighting and rules with mappings

 filetype plugin indent on              "Required!
 NeoBundleCheck                         "Installation check.

 " ===== general =====
    set history=700                     "Sets how many lines of history VIM has to remember

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
    set showmatch                       "Set show matching parenthesis
    set backspace=indent,eol,start      "Make backspace work sanely

    " Smarter search settings
    set ignorecase
    set incsearch                       "show search matches as you type
    set smartcase                       "Ignore case when seraching, except when capatilization is used
    set hlsearch                        "Highlight matching strings

    " Invisible character settings
    set list                            "show invisable characters
    set listchars=tab:▸\ ,eol:¬         "set invisable character symbols
    set virtualedit=all                 "allow the cursor to go in to "invalid" places

 " ===== visual =====
    syntax on
    colorscheme tomorrow-night          "Set colorscheme
    set t_Co=256                        "Force 256 colors

 " ====== airline =====
    set laststatus=2                    "Always show statusline
    let g:airline_powerline_fonts=1     "Use nice powerline patched font symbols
    set ttimeoutlen=50                  "More responsive mode indicator in statusline

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

 " ===== ident/whitespace =====
    set expandtab
    set smarttab
    set shiftround
    autocmd BufWritePre * :%s/\s\+$//e  "Cleanup file whitespace when saving

 " ===== misc =====
    set mouse=a
    set wildmenu                        "Show a navigable menu for tab completion
    set wildmode=longest,list,full      "Wildmode settings
    set wildignore=*.swp,*.bak,*.pyc,*.class
    let mapleader=","                   "Change the mapleader from \ to ,
    let maplocalleader="\\"
    set nobackup                        "Do not keep backup files, it's 70's style cluttering
    set noswapfile                      "Do not write annoying intermediate swap files,
