set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'

Plug 'bling/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_show_hidden = 1
set wildignore+=*/.git/*,*/.idea/*,*/.DS_Store,*/env,*/__pycache__,*.pyc

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrows  = 1
let NERDTreeShowHidden = 1

" Tmux
Plug 'christoomey/vim-tmux-navigator'

set completeopt+=noinsert

call plug#end()

set hidden
set noswapfile
set nobackup

syntax on
set termguicolors
color seoul256
let g:seoul256_background = 233
set background=dark

set number

set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent nosmartindent
set listchars=tab:↹\

set backspace=eol,start,indent

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
setlocal spelllang=en_us

filetype plugin on
au FileType make setl ts=4 sw=4 sts=4 noet
au FileType scala setl ts=2 sw=2 sts=2
au FileType yaml setl ts=2 sw=2 sts=2
au FileType gitcommit setl spell
au FileType proto setl ts=2 sw=2 sts=2
au BufRead,BufNewFile *.tmpl set filetype=gohtmltmpl
au BufRead,BufNewFile *.sbt set filetype=scala

set colorcolumn=80
" highlight OverLength ctermbg=red ctermfg=white guibg=#FFD9D9
" match OverLength /\%80v.*/
" autocmd WinEnter * match OverLength /\%81v.\+/

set nofoldenable
set novisualbell
set modifiable
