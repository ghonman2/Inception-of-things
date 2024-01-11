
" Vundle
set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype plugin indent on
Plugin 'VundleVim/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()
    
" snipMate
let g:snipMate = { 'snippet_version' : 1 }

set backspace=indent,eol,start
" snippets
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

" UltiSnips
"#let g:UltiSnipsExpandTrigger="<tab>"
"#let g:UltiSnipsJumpForwardTrigger="<tab>"
"#let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"#let g:UltiSnipsEditSplit="vertical"

" Basic setting
set hidden
set autowrite
set incsearch showmatch hlsearch		" search options
set autoindent
set tabstop=4 shiftwidth=4 softtabstop=4
set foldmethod=manual nofoldenable
set encoding=utf-8
set modeline modelines=5
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase
set title
set viminfo='64,f1
set wildmenu
set wildmode=longest:full
set wildignore+=*.swp,*.bak
set wildignore+=*.o,*.obj,*.class,*.pyc,*DS_Store,*Thumb.db
set wildignore+=*.pdf,*.eps,*.png,*.jpg,*.gif
set nobackup nowb noswapfile
set scrolloff=3
set ruler
set cursorline



" Colorscheme
if &t_Co >= 256 || has("gui_running")
elseif &t_Co >= 8
	colorscheme default
	hi comment term=NONE cterm=NONE ctermfg=lightblue
endif

if &t_Co > 2 || has("gui_running")
	syntax on
endif


" Return to last edit position when opening files (You want this!)
if has('autocmd')
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	exe "normal! g`\"" |
		\ endif
endif


" Enable mouse
"set mouse=a

" Show whitespace
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=tab:▸\ ,eol:¬

" per-filetype configurations
if has('autocmd')
	"autocmd filetype python set noexpandtab ts=4 sw=4 sts=4 list listchars=tab:▸\
	"autocmd filetype html,xml set listchars-=tab:>.
	autocmd filetype tex set foldmethod=marker textwidth=0
	autocmd filetype markdown set tabstop=2 shiftwidth=2 softtabstop=2
endif

set tags=./tags
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunction

if has('autocmd')
	autocmd BufWrite *.tex :call DeleteTrailingWS()
	autocmd BufWrite *.py :call DeleteTrailingWS()
	autocmd BufWrite *.html,*.htm :call DeleteTrailingWS()
	autocmd BufWrite *.php :call DeleteTrailingWS()
endif


" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map key to toggle opt
function MapToggle(key, opt)
	let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" option toggling
MapToggle <leader>w wrap
MapToggle <leader>z paste

" Make moving around long lines easy
map j gj
map k gk
set nu
" NERD tree
map <leader>nt <esc>:NERDTreeToggle<cr>

" vert term
cmap vt	vert term

" Move between split windows
nmap <C-h>	<C-w>h
nmap <C-j>	<C-w>j
nmap <C-k>	<C-w>k
nmap <C-l>	<C-w>l

" un-highlight search
nnoremap <silent> <leader><space> :nohlsearch<cr>
nnoremap <silent> <tab><space> :nohlsearch<cr>

" Reduce stress to press <shift> for :
nnoremap ; :

" file open/save
nmap <leader>o  :browse oldfiles<cr>
nmap <leader>s	:w!<cr>

" Write with root privilege
cmap w!! w !sudo tee % > /dev/null<cr>

" build and run
nmap <leader>r	:!./%<cr>
nmap <leader>b	:make<cr>
nmap <leader>v	:make -j 16<cr>

nmap <leader>e	:make -j 16 && ~/go r<cr>
nmap <C-\>r		:!~/go r<cr>
nmap <C-\>k		:!~/go k<cr>

" hex manipulation
nmap <leader>hr	:%!xxd<cr> :set filetype=xxd<cr>
nmap <leader>hw	:%!xxd -r<cr> :set filetype=<cr>

let g:user42 = 'joowpark'
let g:mail42 = 'joowpark@student.42seoul.kr'
