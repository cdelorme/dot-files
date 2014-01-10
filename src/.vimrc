
" default state
set nocompatible
set modelines=0 enc=utf-8 ffs=unix
set ts=4 sw=4 sts=4 expandtab shiftround
set autoindent smartindent
set showmode showcmd laststatus=2
set hidden nowrap number ruler cursorline
set ignorecase smartcase hlsearch incsearch showmatch scrolloff=3
set backspace=indent,eol,start
set ttyfast lazyredraw vb
set wildmenu wildmode=list:longest
set foldmethod=syntax foldlevelstart=20
set nobackup noswapfile
:silent! set undodir=$HOME/.vim/undo undolevels=1000 undoreload=10000 undofile

" these options can improve visibility of newlines and tabs,
"  at the cost of making it difficult to copy externally
"set list listchars=tab:▸\ ,eol:¬

" if you want a more pronounced divider for the 80
"  character width entry space enable this
"set formatoptions=qrn1 colorcolumn=85

" mouse operation makes it harder to
"  copy and paste outside of vim
"set mouse=a

" select color scheme
set background=dark
:silent! colorscheme vividchalk

" set leader-key to comma
let mapleader=","

" clear search
nnoremap <leader><space> :noh<cr>

" remap inconvenient keys
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" shortcut ; to : for less keys
nnoremap ; :

" toggle paste mode with F2
set pastetoggle=<F2>

" quickly edit/reload the vimrc file (,ev or ,sv)
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" disable noise makers
set noeb vb t_vb=

" auto syntax highlighting and fold-settings
:filetype on
:syntax on
:filetype indent on
filetype plugin on
set foldmethod=syntax

" additional file recognition
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} set filetype=markdown

" missing syntax recognition
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py match BadWhitespace /*\t\*/
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" save on focus lost
au FocusLost * :wa

" autoconvert tabs to spaces
au BufWritePre * :%s/\t/    /e

" remove whitespace automatically on save
au BufWritePre * :%s/\s\+$//e

" remove windows carriage returns automatically
au BufWritePre * :%s/\r//e

" tab autocompletion
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" load plugins
:silent! set runtimepath^=~/.vim/bundle/ctrlp.vim
:silent! :helptags ~/.vim/doc
