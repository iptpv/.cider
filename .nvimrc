set nocompatible
filetype off


"Neobundle
set runtimepath+=~/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"interface
NeoBundle 'bling/vim-airline'
NeoBundle 'notpratheek/vim-luna'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell.vim'
"navigation
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'chrisbra/histwin.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
"snippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
"code
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'editorconfig-vim'
NeoBundle 'jiangmiao/auto-pairs'
"javascript
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
"css
NeoBundle 'wavded/vim-stylus'
"html
NeoBundle 'othree/html5.vim'
NeoBundle "mattn/emmet-vim"

NeoBundleCheck
call neobundle#end()


"Editor config
filetype plugin indent on
syntax enable
set number
set undofile
set undodir=/tmp
set encoding=utf-8
set wildmenu
set title
set showcmd
set scrolloff=999
set wrap
set colorcolumn=80
set textwidth=80
set formatoptions-=o
set linebreak
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set linespace=1
set cursorline
set t_Co=256
set shortmess+=I
set hidden
set laststatus=2
set visualbell
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault
set backspace=indent,eol,start
set noswapfile
set viminfo='10,\"100,:20,%,n~/.viminfo
set history=1000
set autoread
set clipboard=unnamed


"NeoBundles configs
"interface
let g:airline_theme="luna"
colors luna-term
"navigation
"nerdtree
nmap <Bs> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
"unite
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
"snippets
let g:neocomplcache_enable_at_startup = 1
"code
"syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1


"Functions
"toggle mouse support
set mouse=
  function! ToggleMouse()
    if &mouse == 'a'
      set mouse=
      echo "Mouse usage disabled"
    else
      set mouse=a
      echo "Mouse usage enabled"
    endif
  endfunction
"autoreload .nvimrc
if has("autocmd")
  autocmd! bufwritepost .nvimrc source $MYVIMRC
endif
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction


"File events
"auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h
"save last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()


"Hotkeys
let mapleader = ","

nnoremap <leader>m :call ToggleMouse()<CR>

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

vnoremap < <gv
vnoremap > >gv

map <Leader>h :Histwin<CR>

nnoremap Y y$

map <Leader>l :Unite buffer<CR>
map <Leader>f :Unite -start-insert file_rec/async<CR>
map <Leader>F :Unite grep:.<CR>

nmap <Space> <PageDown>

nmap <leader>v :e $MYVIMRC<CR>

map <Leader>w <C-w>w
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

command! W exec 'w !sudo tee % > /dev/null' | e!

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

map <Leader>t :VimShellCurrentDir<CR>
map <Leader>x :VimShellClose<CR>
