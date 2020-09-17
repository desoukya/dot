call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI=1
let g:mapleader = ","
let g:NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on
""colorscheme gruvbox
colorscheme monokai-chris

set number
set incsearch
set hlsearch
set backspace=indent,eol,start
set smartindent
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

set rtp+=/usr/local/opt/fzf

"" Custom Key Bindings
noremap <leader>w :w<cr>
noremap <leader>q :q!<cr>
noremap <leader>wq :wq<cr>
noremap <leader>wq! :wq!<cr>
noremap <leader>qa :qa!<cr>
"" toggle nerd tree
noremap <leader>b :NERDTreeToggle<cr>
"" switch between tree and file
noremap <leader>w <C-w>w
"" start fuzzy search
noremap <leader>f :FZF<cr>
"" open new tab
noremap <leader>t :tabnew<cr>
"" open terminal shell
noremap <leader>sh :term<cr>
