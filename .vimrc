execute pathogen#infect()

"color scheme
colorscheme palenight
syntax enable
set background=dark
set termguicolors

"enable mouse
set mouse=a

"set spacing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" UI configuration
set number
set numberwidth=1
set showcmd
set cursorline
filetype plugin indent on
set wildmenu    " better popup menus
set splitright
set backspace=indent,eol,start  " good to have to standardize backspace on most machines

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" leave marks when going top or bottom
nnoremap <silent> T ma:0<CR>
nnoremap <silent> G maG<CR>

" faster vertical moving
nnoremap I 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
nnoremap <c-Down> 5j
nnoremap <c-Up> 5k
vnoremap <c-Down> 5j
vnoremap <c-Up> 5k
inoremap <c-Down> <Down><Down><Down><Down><Down>
inoremap <c-Up> <Up><Up><Up><Up><Up>
map <ESC>f e
map! <ESC>f <ESC>e


" cut copy paste
nnoremap <c-x> dd
vnoremap <c-x> <c-o>dd
inoremap <c-x> <c-o>dd
vmap <c-x> :!pbcopy<CR>  
vmap <c-c> :w !pbcopy<CR><CR>

" commenting
nmap <c-_> <Plug>NERDCommenterToggle
vmap <c-_> <Plug>NERDCommenterToggle<CR>gv
imap <c-_> <c-o><Plug>NERDCommenterToggle

" tabs
nmap <c-l> gt
vmap <c-l> <c-o>gt
imap <c-l> <c-o>gt
nmap <c-k> gT
vmap <c-k> <c-o>gT
imap <c-k> <c-o>gT


" folding
set foldenable
set foldlevelstart=10
nnoremap , za
set foldmethod=syntax

" filetype customizations
au BufNewFile,BufRead SCons* set filetype=scons
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal foldmethod=indent
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" nerdtree
autocmd StdinReadPre * let s:std_in=1 " open NERDTree if no file provided
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
function OpenNERDTreeTabHere()
 tabe %
 NERDTreeFind %
endfunction
function OpenNERDTreeSplitHere()
 vs %
 NERDTreeFind %
endfunction
:command T call OpenNERDTreeTabHere()
:command S call OpenNERDTreeSplitHere()
map - :NERDTreeFind<cr>
map = :NERDTreeToggle<cr>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

" airline
let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type= 2
autocmd VimEnter * highlight airline_tabfill ctermbg=237



