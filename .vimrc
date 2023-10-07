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

"" colorscheme gruvbox
"" colorscheme monokai-chris
colorscheme onedark
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
set number
set incsearch
set hlsearch
set backspace=indent,eol,start

"" Indentation
set smartindent
filetype plugin indent on
set expandtab ts=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

"" Show trailing whitespace
set listchars=tab:›\ ,trail:·,eol:¬,nbsp:_,extends:…,precedes:…
set foldlevelstart=99
set fillchars=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

"" keep selection when reindenting
vnoremap > >gv
vnoremap < <gv

"" add fzf path if installed using brew
set rtp+=/usr/local/opt/fzf

" move lines up and down with ALT+J/K
inoremap <M-H> <CMD>normal <<<CR>
inoremap <M-L> <CMD>normal >><CR>
inoremap <M-K> <CMD>m .-2<CR>
inoremap <M-J> <CMD>m .+1<CR>

vnoremap <M-K> :m '<-2<CR>gv
vnoremap <M-J> :m '>+1<CR>gv
vnoremap <M-H> <gv
vnoremap <M-L> >gv

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