call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'graphql'] }
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'tpope/vim-fugitive'         " see git commits
Plug 'Rigellute/rigel'            " Riget color scheme https://github.com/Rigellute/rigel
Plug 'tribela/vim-transparent'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Setup Prettier command in .vimrc
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"""" enable 24bit true color
set termguicolors

"""" enable the theme
syntax enable
colorscheme rigel

set incsearch
set ignorecase
set number
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

" let g:airline_powerline_fonts = 1
let g:rigel_airline = 1
let g:airline_theme = 'rigel'

let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI=1
let g:mapleader = ","
let g:NERDTreeShowHidden=1
" Once vim-javascript is installed you enable flow highlighting
let g:javascript_plugin_flow = 1

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
"" open fuzzy search (new) - use GFiles as it ignores all paths in .gitignore
noremap <leader>f :GFiles<cr>
"" visual block
noremap <leader>vb <C-v>
"" edit Coc Snippets
noremap <leader>csnip :CocCommand snippets.editSnippets<cr>
"" edit Coc Config and auto format on save
noremap <leader>cconf :CocConfig<cr>
"" search for term in directory
noremap <leader>a :Ag<cr>
"" search all open buffers/files/tabs
nnoremap <silent><leader>l :Buffers<CR>
"" vsc ctrl+d to add multiple cursors to same selected word
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
"" see github commits
noremap <leader>gc :Commits<cr>
