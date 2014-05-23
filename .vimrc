" Kompatibilitätsmodus zu vi abschalten
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#infect()
filetype plugin indent on

" change the mapleader from \ to ,
let mapleader=","

set hidden        " hide buffers instead of closing them
set nowrap        " do not wrap lines
set tabstop=4     " tab = 4 spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set cindent       " c-like indentation
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with < and >

set showmatch     " show matching parenthesis
set ignorecase    " ignore case on search
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search results
set incsearch     " show search matches as you type
set gdefault      " search/replace "globally" (on a line) by default

set pastetoggle=<F2> " when in insert mode, press <F2> to go to
                     "    paste mode, where you can paste mass data
                     "    that won't be autoindented

set mouse=a       " enable mouse
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

cmap w!! w !sudo tee % >/dev/null " sudo write

" Syntaxhighlighting
syntax on
" syntax highlighting for custom file extensions
au BufNewFile,BufRead *.launch set filetype=xml

" Colorscheme
let t_Co=16
set background=dark
colorscheme Monokai

" immer die Statuszeile mit dem Dateinamen anzeigen
set ls=2

" Ersetze Tabulatoren durch Leerzeichen
set expandtab

" zeigt unten links diverse Positionsinformationen der Schreibmarke
set ruler

" die Shell, die beim Starten von Programmen aus dem Editor heraus
" verwendet werden soll
set shell=/bin/bash

" zeigt beim Schließen von Klammern kurz an, wo sie geöffnet wurde

" zeigt in der Statuszeile an, ob man sich im Einfügemodus (INSERT) oder im
" Ersetzungsmodus (REPLACE) befindet
set showmode

" run uncrustify on current file
map <F5> :%!uncrustify --replace --no-backup -l CPP -q<RETURN>

" navigate tabs
map <F7> :tabp <RETURN>
map <F8> :tabn <RETURN>

" toggle navigation list
map <F12> :TlistToggle <RETURN>

"  nicht an den Zeilenanfang bei Benutzung von Bild auf und Bild ab gehen
set nostartofline

" backspace taste
set bs=2

" highlight long lines
highlight OverLength ctermbg=DarkBlue ctermfg=white guibg=DarkBlue guifg=white
match OverLength /\%81v.\+/

" autorun ctags
:au BufWritePost .c,.cpp,*.h silent! !ctags -R &

" go to next error and previous error easily
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

set path=.,,..,../..,./*,./*/*,../*,~/,~/**,/usr/include/*

