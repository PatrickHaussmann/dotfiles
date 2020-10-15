" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" General Config
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" turn on syntax highlighting
syntax on
  
" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir /tmp/.vim/backups > /dev/null 2>&1
  set undodir=/tmp/.vim/backups
  set undofile
endif

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Keep 5 lines below and above the cursor
set scrolloff=5

" To have the completion behave similarly to a shell, i.e. complete only up to the point of ambiguity (while still showing you what your options are), also add the following:
set wildmode=list:longest

" Use case-smart searching
" These two options, when set together, will make /-style searches case-sensitive only if there is a capital letter in the search expression. *-style searches continue to be consistently case-sensitive.
set ignorecase 
set smartcase

" Set the terminal title
set title

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
"syntax on
filetype on
filetype plugin on
filetype indent on

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Catch trailing whitespace
" The following will make tabs and trailing spaces visible when requested:
set list
set listchars=tab:>-,trail:·,extends:>,precedes:<

set visualbell

" display right colors in tmux
set background=dark

" line numbers in grey 
highlight LineNr ctermfg=grey

" enables mouse in all modes (mouse scrolling in vim instead of tmux)
set mouse=a

" excape delay
set  timeoutlen=1000 " time out for key codes
set ttimeoutlen=20   " wait up to 20ms after Esc for special key

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
set spl=en spell
set nospell
endif

" Plugins 
" Load all plugins
packloadall
