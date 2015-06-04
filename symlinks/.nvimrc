filetype off
let g:SOURCE_DIR_BUNDLE = "~/.nvim/bundle/"


"Neobundle
let &runtimepath.=','.escape(expand(SOURCE_DIR_BUNDLE.'neobundle.vim/'), '\,')
call neobundle#begin(expand(SOURCE_DIR_BUNDLE))
NeoBundleFetch 'Shougo/neobundle.vim'

"interface
NeoBundle 'bling/vim-airline'
NeoBundle 'notpratheek/vim-luna'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
"navigation
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim', {
		\ 'build' : {
		\     'windows' : 'tools\\update-dll-mingw',
		\     'cygwin' : 'make -f make_cygwin.mak',
		\     'mac' : 'make -f make_mac.mak',
		\     'unix' : 'make -f make_unix.mak',
		\    },
		\ }
NeoBundle 'thinca/vim-qfreplace'
"code
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh'
        \ }
     \ }
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'editorconfig-vim'
NeoBundle 'jiangmiao/auto-pairs'
"javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'heavenshell/vim-jsdoc'
"css
NeoBundle 'wavded/vim-stylus'
"html
NeoBundle 'othree/html5.vim'
NeoBundle "mattn/emmet-vim"
"other
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fireplace'

NeoBundleCheck
call neobundle#end()


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


"NeoBundles configs
"interface
let g:airline_theme = "luna"
colors luna-term
"unite
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_toggle = 1
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_project_files'])
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
"codecomplete
let g:ycm_add_preview_to_completeopt = 1
"syntastic
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


"File events
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

"list of buffers
map <Leader>l :Unite buffer<CR>
"search file in current git repo
map <Leader>f :Unite -start-insert file_rec/git<CR>
"grep
map <Leader>g :Unite -no-quit -keep-focus grep:.<CR>
"paste with history
map <Leader>r :Unite register<CR>
"open Vimfiler
nmap <Bs> :VimFilerExplorer<CR>

nmap <Space> <PageDown>

"open .nvimrc
nmap <leader>v :e $MYVIMRC<CR>

"switch splits
map <Leader>w <C-w>w

"create a new window
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

"save file with sudo
command! W exec 'w !sudo tee % > /dev/null' | e!

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"shortcut for :%s//
nnoremap <leader>s :%s/<C-r><C-w>//<left>
vnoremap <leader>s :s//<left>

"js
map <Leader>jd :JsDoc<CR>

"clojure
map <Leader>c :Eval<CR>
