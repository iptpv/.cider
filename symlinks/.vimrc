filetype off


"Plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'notpratheek/vim-luna'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'editorconfig-vim'

"navigation
Plug 'scrooloose/nerdtree'
Plug 'dispatch.vim'
Plug 'wincent/ferret'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

"javascript
Plug 'othree/yajs.vim'
"css
"Plug 'wavded/vim-stylus'
"html
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"git
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/vim-diff-enhanced'

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
set colorcolumn=120
set textwidth=120
set formatoptions-=o
set linebreak
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
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


"save last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()
"autoreload .vimrc
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

"Hotkeys
let mapleader = ","

"toggle mouse support
nnoremap <leader>m :call ToggleMouse()<CR>

vnoremap < <gv
vnoremap > >gv
nnoremap Y y$

map <leader>e :NERDTreeToggle<CR>

"fzf - fuzzy finder
nmap <leader>p :FZF<CR>

"buffers
map <Tab> :bn<CR>
map <s-Tab> :bp<CR>
map <leader>x :bd<CR>

"save file with sudo
command! W exec 'w !sudo tee % > /dmu/null' | e!

"navigation mapping
nmap <Space> <PageDown>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"shortcut for :%s//
nnoremap <leader>s :%s/<C-r><C-w>//<left>
vnoremap <leader>s :s//<left>

"create a new window
nmap <leader><left>  :leftabove  vnew<CR>
nmap <leader><right> :rightbelow vnew<CR>
nmap <leader><up>    :leftabove  new<CR>
nmap <leader><down>  :rightbelow new<CR>

"ferret
nmap <leader>r <Plug>(FerretAcks)<C-r><C-w>//<left>
nmap <leader>f <Plug>(FerretAck)<C-r><C-w>

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
