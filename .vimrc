call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

syntax on
set re=0

" Specific colorscheme settings (must come before setting your colorscheme).
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme.
colorscheme gruvbox
set background=dark

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

set number
set incsearch
set hlsearch
set backspace=indent,eol,start

"" Indentation
set smartindent
filetype plugin indent on
set expandtab ts=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

set hidden

"" By default set relate numbers
set relativenumber

let g:airline_powerline_fonts = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI=1
let g:mapleader = ","
let g:NERDTreeShowHidden=1

" Reference chart of values:
"   Ps = 0 -> blinking block
"   Ps = 1 -> blinking block (default)
"   Ps = 2 -> steady block
"   Ps = 3 -> blinking underline
"   Ps = 4 -> steady underline
"   Ps = 5 -> blinking bar (xterm)
"   Ps = 6 -> steady bar (xterm)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json'
      \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"" cmd+/ comment line or multiple lines (requires going to iterm key bindings)
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"" keep selection when reindenting
vnoremap > >gv
vnoremap < <gv

"" add fzf path if installed using brew
set rtp+=/usr/local/opt/fzf

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Toggle(!/inv invert) spell check
nnoremap <leader>sc :setlocal spell!<CR>

" Toggle(!/inv invert) relative numbers
nnoremap <leader>rn :set relativenumber!<CR>

" Toggle(!/inv invert) white space
nnoremap <leader>ws :set list!<CR>

"" Custom Key Bindings
noremap <leader>s :w<cr>
noremap <leader>q :q!<cr>
noremap <leader>wq :wq<cr>
noremap <leader>wq! :wq!<cr>
noremap <leader>qa :qa!<cr>
"" toggle nerd tree
noremap <leader>b :NERDTreeToggle<cr>
"" switch between tree and file
noremap <leader>w <C-w>w
"" start fuzzy search
"" noremap <leader>f :FZF<cr>
"" open new tab
noremap <leader>t :tabnew<cr>
"" open terminal shell
noremap <leader>sh :term<cr>
"" open fuzzy search (new)
noremap <leader>f :Files<cr>
"" visual block
noremap <leader>vb <C-v>
"" edit Coc Snippets
noremap <leader>csnip :CocCommand snippets.editSnippets<cr>
"" edit Coc Config and auto format on save
noremap <leader>cconf :CocConfig<cr>
