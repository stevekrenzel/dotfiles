runtime! plugin/sensible.vim

set nocompatible
filetype off

call pathogen#infect()
filetype plugin indent on

set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
"set background=light
"colorscheme solarized
colorscheme desert

"Delete entire words
map <bs> bdw

set guioptions-=T

set mousehide
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set showmatch
set incsearch
set ignorecase
set smartcase
set scrolloff=4

map Q gq

syntax on
set hlsearch

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

  augroup END

else

  set autoindent

endif

" Shed light on hidden things
set list
set listchars=tab:»»,trail:•
set linebreak
set showbreak=↳
" autocmd BufWritePost *.sass make
" autocmd BufWritePost *.mail.html make
set ar

set completeopt+=longest
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guifont=Menlo:h13

" Smart file openning
map <leader>r :ruby @finder = nil<CR>
let g:fuzzy_ignore = "*.pyc;*.png;*.jpg;*.gif;*bmp;*.css"

" Ack stuff
map <leader>a :Ack 

" CtrlP
map <leader>p :CtrlPCurWD<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*bmp,*.o,*.class,obj,*.sassc

" Fuzzy Finder
map <leader>f :FuzzyFinderTextMate <CR>
map <leader>r :ruby @finder = nil<CR>
let g:fuzzy_ignore = "*.pyc;*.png;*.jpg;*.gif;*bmp;*.css;*.o;*.class;obj;*.sassc;*.js"

" Nerd Tree
map <leader>n :NERDTreeToggle<CR>

" Undo tree
map <leader>u :GundoToggle<CR>

au! BufRead,BufNewFile *.haml         setfiletype haml

" Make JST files act like erb files
au! BufNewFile,BufRead *.jst setfiletype haml

au! BufNewFile,BufRead *.go setfiletype go

" Undo persistance
if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

" Sets the number of columns to support n windows of a given width.
function! SplitNVertical(nSplits, width)
    let &columns = (a:width + 1) * a:nSplits - 1
    execute "normal \<C-w>="
endfunction
nmap <leader>1 :call SplitNVertical(1, 79)<cr>
nmap <leader>2 :call SplitNVertical(2, 79)<cr>
nmap <leader>3 :call SplitNVertical(3, 79)<cr>
nmap <leader>4 :call SplitNVertical(4, 79)<cr>
nmap <leader>5 :call SplitNVertical(5, 79)<cr>

" Toggles colorcolumn
function! ToggleColorColumn()
  if &colorcolumn > 0
    set colorcolumn=
  else
    set colorcolumn=80
  endif
endfunction
set colorcolumn=80
nmap <leader>0 :call ToggleColorColumn()<cr>

set nocul " Don't highlight current line
set lazyredraw
set noerrorbells

" Much of below is from: https://github.com/tpope/tpope/blob/master/.vimrc
set dictionary+=/usr/share/dict/words
if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

set timeoutlen=1200
set ttimeoutlen=50

if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif

set wildmenu
set wildmode=longest:full,full

if !has("gui_running") && $DISPLAY == '' || !has("gui")
  set mouse=
endif

if $TERM =~ '^screen'
  if exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
  endif
  if $TERM != 'screen.linux' && &t_Co == 8
    set t_Co=16
  endif
endif

if $TERM == 'xterm-color' && &t_Co == 8
  set t_Co=16
endif

set splitbelow
set splitright
