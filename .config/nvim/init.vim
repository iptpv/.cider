filetype off


"Plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'notpratheek/vim-luna'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'editorconfig-vim'

"navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/greplace.vim'

"javascript
Plug 'othree/yajs.vim'
"css
Plug 'wavded/vim-stylus'
"html
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"git
Plug 'tpope/vim-fugitive'

call plug#end()


"Editor config
filetype plugin indent on
syntax enable
set nonumber
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


"Plugs configs
colorscheme luna-term

"airline
let g:airline#extensions#tabline#enabled = 1

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1

"deoplete
let g:deoplete#enable_at_startup = 1

"ctrlp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction


"File muents
"save last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()
"autoreload .nvimrc
if has("autocmd")
  autocmd! bufwritepost .nvimrc source $MYVIMRC
endif


"Hotkeys
let mapleader = ","

"toggle mouse support
nnoremap <leader>m :call ToggleMouse()<CR>

"clear search highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

vnoremap < <gv
vnoremap > >gv

nnoremap Y y$


"map <leader>e :NERDTreeToggle<CR>
map <leader>e :NERDTreeToggle<CR>

"buffers
map <Tab> :bn<CR>
map <leader>bp :bp<CR>

nmap <Space> <PageDown>

"save file with sudo
command! W exec 'w !sudo tee % > /dmu/null' | e!

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"shortcut for :%s//
nnoremap <leader>s :%s/<C-r><C-w>//<left>
vnoremap <leader>s :s//<left>

"global search and replace
nmap <leader>f :Gsearch<CR>
nmap <leader>r :Greplace

"create a new window
nmap <leader><left>  :leftabove  vnew<CR>
nmap <leader><right> :rightbelow vnew<CR>
nmap <leader><up>    :leftabove  new<CR>
nmap <leader><down>  :rightbelow new<CR>
