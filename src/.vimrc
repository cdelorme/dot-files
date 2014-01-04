
" Define Default State
set nocompatible
set modelines=0 enc=utf-8 ffs=unix
set ts=4 sw=4 sts=4 expandtab shiftround
set autoindent smartindent
set showmode showcmd laststatus=2
set hidden nowrap number ruler cursorline
set ignorecase smartcase hlsearch incsearch showmatch scrolloff=3
set backspace=indent,eol,start
set ttyfast lazyredraw vb
set formatoptions=qrn1 colorcolumn=85
set wildmenu wildmode=list:longest
set list listchars=tab:▸\ ,eol:¬
set foldmethod=syntax foldlevelstart=20
set nobackup noswapfile
:silent! set undodir=$HOME/.vim/undo undolevels=1000 undoreload=10000 undofile
set mouse=a

" Define Color Scheme
set background=dark
:silent! colorscheme vividchalk

" Set leader-key to comma
let mapleader=","

" Clear search
nnoremap <leader><space> :noh<cr>

" Remap Convenient Keys
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" Shortcut ; to : for less keys
nnoremap ; :

" Toggle paste mode with F2
set pastetoggle=<F2>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" No Noise
set noeb vb t_vb=

" Syntax and File Type Config
:filetype on
:syntax on
:filetype indent on
filetype plugin on
set foldmethod=syntax

" File Recognition
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} set filetype=markdown

" Added Syntax
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py match BadWhitespace /*\t\*/
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" Save on focus lost
au FocusLost * :wa

" Autoconvert tabs to spaces
au BufWritePre * :%s/\t/    /e

" Remove Whitespace automatically on save
au BufWritePre * :%s/\s\+$//e

" Remove windows carriage returns automatically
au BufWritePre * :%s/\r//e

" Tab autocompletion
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" Load Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/doc

