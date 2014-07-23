" George Abraham's vimrc


" Notes
" wrap paragrap - gqap
" windo cmd to apply cmd to all windows
" argdo - figure this one out


" Initialize
set nocompatible                " Not Vi compatible 

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Syntax
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting - using
"smartindent
set smartindent
filetype plugin on    " Enable filetype-specific plugins
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

  " Commenting blocks
  autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
  autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
  autocmd FileType perl :set cindent

  " Generic Makefiles
"  au! BufNewFile,BufRead *Makefile* set ft=make

  " Numbering 
  " autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php set number


endif " has("autocmd")  

" Paste with indent
nnoremap p  p'[v']=
nnoremap P  P'[v']=
           


" Spell checker configuration
let g:cvimsyn= expand('${HOME}/.vim/CVIMSYN')
let g:spchkpunc=1 "Check for some simple English punctuation problems

" Terminal Options
set noerrorbells
set visualbell t_vb=
set title              " The title of the window will be set to the value of titlestring
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
set background=dark    " This should be before :syntax


" General Options
set clipboard=exclude:.*        " Same as -X don't connect to XServer
set autowrite                   " Automatically write buffer before special actions
set fileformats=unix,dos        " This gives the end-of-line (<EOL>) formats that will
                                " be tried when starting to edit a new buffer and when reading a file into an
                                " existing buffer
set lazyredraw                  " Don't display macro steps
set esckeys                     " Function keys that start with an <Esc> are recognized in Insert mode
set joinspaces                  " Insert two spaces after a '.', '?' and '!' with a join command.   
set nostartofline               " Cursor is kept in the same column while moving e.g. G,H,M,L
set textwidth=78                " Maximum width of text that is being inserted.  
set whichwrap=b,s,h,l,<,>,[,]   " Allow specified keys that move the cursor left/right to wrap to the
                                " previous/next line when the cursor is on the first/last character in the line


" Indentation
"set cindent                               " C style indenting
set autoindent                            " Copy indent from current line when starting a new line
set tabstop=2 softtabstop=2               " Number of spaces that a <Tab> in the file counts for
set softtabstop=2                         " Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=2                          " Number of spaces to use for each step of (auto)indent
																					" >>, >} for paragraph shifting. In insert mode ^T, ^D and 0^D
set backspace=indent,eol,start            " This specifies where in Insert mode the <BS>
                                          " is allowed to delete the character in front of the cursor.
set smarttab                              " A <Tab> in front of a line inserts blanks according to 'shiftwidth'
set expandtab                             " Use the appropriate number of spaces to insert a <Tab>

set shiftround

" Status 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2 " Always show status line
set cmdheight=3  " Number of screen lines to use for the command-line
set showcmd      " Show (partial) command in status line
set ruler        " Show the line and column number of the cursor position
set showmode     " If in Insert, Replace or Visual mode put a message on the last line

" Backup
set directory=~/.vimdir,.                         " List of directory names for the swap file, separated with commas
set backup
set backupdir=~/.vimback" List of directories for the backup file, separated with commas
"set nowritebackup                            " Do not create backup files (~)
"set bex=.bak                                  " The backup extension

"History
set history=33  " The command-lines that you enter are remembered in a history table.  You can
                " recall them with the up and down cursor keys. 


"Matching
set hlsearch    " Leaves the highlighting on from a previous search
set showmatch   " When a bracket is inserted, briefly jump to the matching one
set incsearch   " Show immediately where the so far typed pattern matches
set smartcase " smartcase instead of Ignore case
set ignorecase
set magic       " Magic chars are on - escape when searching

"Highlighting
" Check by running :so $VIMRUNTIME/syntax/hitest.vim
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws "Check this



"Folding
set foldmarker={,}
" highlight command should be after setting background
"highlight Folded term=standout cterm=bold ctermfg=2 gui=bold guifg=Blue
set foldmethod=syntax           " The kind of folding used for the current window

" Perl
let perl_fold_blocks = 1
let perl_fold = 1


" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Json
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 



" Key Mappings
map <F4> :set nu!<bar>set nonu?<CR>                          " Toggle line number
:nnoremap <buffer> <silent> L :set hlsearch!<Enter>          " Toggle highlighted search
map <F2> :set hls!<bar>set hls?<CR>                          " Toggle search highlighting
map <F6> :set list!<bar>set nolist?<CR>                      " Togglenon-printing chars

" Map Home and End keys in both insert and command mode. INS Mode only works only on Solaris
map [1~ <Home>
map [4~ <End>
inoremap [1~ <Home>
inoremap [4~ <End>
map <C-A> <C-W>
" Map Ctrl + W to Ctrl + A 

" Align
map ,b :!~/local/bin/align                         " Align
" sudo w!!
cmap w!! %!sudo tee > /dev/null %

" Line completion
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

"set spell
let perl_include_pod=1

"# Paste toggle
set pt=<F3>
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Prettify Json
function! DoPrettyJson()
  silent %!python -m json.tool 
endfunction
command! PrettyJson call DoPrettyJson()

