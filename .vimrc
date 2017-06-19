" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged') 
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Additional
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'derekwyatt/vim-sbt'
Plug 'Raimondi/delimitMate'
Plug 'derekwyatt/vim-scala'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

syntax on

filetype plugin on
filetype plugin indent on

set expandtab
set shiftwidth=4
set softtabstop=4

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"x":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" IndentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = "#3a3a3a"
let g:indentLine_char = '|'

" delimiteMate
let delimitMate_expand_cr = 1

" vim-scala
let g:scala_scaladoc_indent = 1

" Move cursor to the previous line when revist files
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" line number
set nu
" highlight LineNr ctermfg=grey ctermbg=grey
" highlight LineNr ctermbg=grey

"
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
" highliting line number
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
