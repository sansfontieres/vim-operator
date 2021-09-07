scriptencoding utf-8

set encoding=utf-8
set fileencoding=utf-8
if &compatible
	set nocompatible
endif


"""""""""""""
" »Plugins« "
"""""""""""""

let g:loaded_matchit=1

function! PackInit() abort
packadd minpac
call minpac#init({'verbose': 3})
call minpac#add('k-takata/minpac', {'type': 'opt'})
	" Real plugins
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('mhinz/vim-signify')
	call minpac#add('lambdalisue/gina.vim', {'type': 'opt'})
	call minpac#add('ludovicchabant/vim-lawrencium', {'type': 'opt'})
	call minpac#add('ludovicchabant/vim-gutentags')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-surround')
	call minpac#add('justinmk/vim-sneak')
	call minpac#add('romainl/vim-qf')
	call minpac#add('haya14busa/vim-asterisk')
	call minpac#add('haya14busa/is.vim')
	call minpac#add('kana/vim-textobj-user')
	call minpac#add('kana/vim-textobj-line')
	" QOL
	call minpac#add('lambdalisue/fern.vim')
	call minpac#add('andymass/vim-matchup')
	call minpac#add('liuchengxu/vim-clap', {'do': {-> clap#installer#force_download()}})
	call minpac#add('liuchengxu/vista.vim', {'type': 'opt'})
	call minpac#add('dense-analysis/ale', {'type': 'opt'})
	call minpac#add('igankevich/mesonic', {'type': 'opt'})
	call minpac#add('dstein64/vim-startuptime', {'type': 'opt'})
	call minpac#add('thinca/vim-quickrun', {'type': 'opt'})
	call minpac#add('https://git.sansfontieres.com/~sansfontieres/eleline.vim')
	call minpac#add('mattn/emmet-vim', {'type': 'opt'})
	" Syntax Highlighting
	call minpac#add('vim-scripts/SyntaxRange')
	call minpac#add('vim-jp/vim-cpp')
	call minpac#add('fatih/vim-go')
	call minpac#add('plasticboy/vim-markdown')
	call minpac#add('cespare/vim-toml')
	call minpac#add('rust-lang/rust.vim')
	call minpac#add('pangloss/vim-javascript')
	call minpac#add('google/vim-jsonnet')
	call minpac#add('tbastos/vim-lua')
	call minpac#add('VaiN474/vim-etlua')
	call minpac#add('leafo/moonscript-vim')
	call minpac#add('leafgarland/typescript-vim')
	call minpac#add('vim-ruby/vim-ruby')
	call minpac#add('vim-erlang/vim-erlang-runtime')
	call minpac#add('elixir-editors/vim-elixir')
	call minpac#add('slashmili/alchemist.vim')
	call minpac#add('neovimhaskell/haskell-vim')
	call minpac#add('davidoc/taskpaper.vim')
	call minpac#add('mesonbuild/meson')
	call minpac#add('lifepillar/vim-colortemplate')
	call minpac#add('https://tildegit.org/sloum/gemini-vim-syntax', {'do': 'make'})
endfunction
filetype plugin indent on
syntax enable


command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()


" lazy-lazyload
command! -nargs=* Gina :packadd gina.vim | Gina <f-args>
command! -nargs=* Startuptime :packadd vim-startuptime | StartupTime <f-args>
command! -nargs=* QuickRun :packadd vim-quickrun | QuickRun <f-args>
command! LazyDev :packadd ale | packadd vista.vim | packadd mesonic
command! Lhg packadd vim-lawrencium
augroup PackLazy
	autocmd!
	autocmd FileType colortemplate packadd vim-colortemplate
	autocmd FileType html,css,scss,eruby,etlua packadd emmet-vim
augroup END


" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:jsx_ext_required=0

" Signify
let g:signify_sign_add='┃'
let g:signify_sign_change='┃'
let g:signify_sign_delete='•'
let g:signify_sign_show_count=0


" ALE
let g:ale_disable_lsp=1
let g:ale_sign_error='✘ '
let g:ale_sign_warning='‼ '
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_fix_on_save=1
let g:ale_fixers={
	\'c': ['clang-format'],
	\'go': ['gofmt'],
	\'pascal': ['ptop'],
	\'haskell': ['brittany'],
	\'lua': ['lua-format'],
	\'elixir': ['mix_format'],
	\'ruby': ['rubocop'],
	\'erb': ['erubi'],
	\'css': ['prettier'],
	\'html': ['prettier'],
	\'javascript': ['eslint'],
\}
let g:ale_javascript_prettier_options='--config ~/.prettierrc'
let g:ale_css_prettier_options='--config ~/.prettierrc'
let g:ale_pascal_ptop_options='-c "$HOME"/.ptop.cfg'


" Mesonic
let g:meson_command = 'meson'
let g:meson_ninja_command = 'samu' 


" Gutentags
let g:gutentags_cache_dir='~/.vim/cache/gutentags'

" incsearch
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

" QuickRun
"let g:quickrun_config = {}

" eleline
let g:eleline_powerline_fonts = 1


" Vista
let g:vista#renderer#icons = {
\   "function": "ƒ",
\   "variable": "\uf71b",
\  }

" »General«

" Update like normal human
set autoread


" SILENCE
set belloff=all

" Remember things
set backupdir=$HOME/.vim/cache/backup
set directory=$HOME/.vim/cache/swap
set viewdir=$HOME/.vim/cache/view
set undodir=$HOME/.vim/cache/undo
set viminfofile=$HOME/.vim/cache/viminfo
set history=100


" Normal human clipboard
set clipboard^=unnamed,unnamedplus
set pastetoggle=<F2>


" Normal human backspace
set backspace=indent,eol,start


" Normal human search
set hlsearch
set incsearch
set ignorecase
set smartcase
set path+=**


" Better (arguably) grep
set grepprg=rg\ --vimgrep\ --smart-case


" Normal human mouse
set mouse=a


" Normal human buffers
set hidden
set splitright
set splitbelow


" Superhuman smart (jk, still normal human)
set complete-=i
set smarttab
set autoindent
set formatoptions+=j


" Normal human increments
set nrformats-=octal


" Indent wrapped lines
set breakindent


" Not normal human regex, just normal regex
set magic

" Various metalines
set laststatus=2
set noshowmode
set showtabline=2


" Line numbers
set relativenumber


" Show cursor
set cursorline


" Some breathing room around cursor's line
set scrolloff=3


" Command completion
set wildmenu
set wildmode=longest,list,full
set wildignorecase


" Skip useless redraws
set lazyredraw


" Keep I don't want my gutter to move around
set signcolumn=yes


" Viewing whitespaces
set listchars=tab:┃\ ,space:·,nbsp:␣,trail:•

" Split separator
set fillchars+=vert:│

" Filetype preferences
augroup FileTypes
	autocmd!
	autocmd FileType c setlocal noet ts=2 sw=2 tw=80
	autocmd FileType h setlocal noet ts=2 sw=2 tw=80
	autocmd FileType cpp setlocal noet ts=2 sw=2 tw=80
	autocmd FileType pascal setlocal noet ts=2 sw=2 tw=80
	autocmd FileType lua setlocal noet ts=2 sw=2 tw=80
	autocmd FileType go setlocal noet ts=4 sw=4
	autocmd FileType sh setlocal noet ts=2 sw=2
	autocmd BufRead,BufNewFile *.js setlocal et ts=2 sw=2
	autocmd FileType html setlocal et ts=2 sw=2
	autocmd FileType ruby setlocal et ts=2 sw=2
	autocmd FileType scss setlocal et ts=2 sw=2
	autocmd FileType yaml setlocal et ts=2 sw=2
	autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
	autocmd FileType text setlocal noet ts=2 sw=2 tw=80
	autocmd FileType typescript setlocal et ts=2 sw=2
	autocmd FileType python setlocal et ts=2 sw=2
	autocmd BufNewFile,BufRead *.ms set syntax=python ts=2 sw=2 noet
	autocmd FileType mail setlocal noautoindent
	autocmd FileType gmi set wrap linebreak
	autocmd FileType vim setlocal noet ts=2 sw=2
augroup END
let g:pascal_fpc=1
let g:c_syntax_for_h = 1



" I want to spell like a normal human
nnoremap <leader>ds :set spell!<CR>:set spell?<CR>
nnoremap <leader>dfr :set spelllang=fr<CR>
nnoremap <leader>den :set spelllang=en_gb<CR>


" Some light completion
set omnifunc=syntaxcomplete#Complete



""""""""""""""
" »Mappings« "
""""""""""""""

let mapleader="\<space>"
let maplocalleader="\<space>"
inoremap jk  <Esc>


" Save like a normal human
noremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>


" Insert empty line like a normal human
nnoremap <CR> o<Esc>


"" Motions like a normal human
"nnoremap j gj
"nnoremap k gk


" Move lines like a normal human
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv


" Enable whitespace viewing
nnoremap <silent> <leader>w :set list!<CR>


" Quickfix/Location list
nnoremap <silent> <C-N> :cnext<CR>
nnoremap <silent> <C-P> :cprev<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cc :cclose<CR>

" Easier command line access & remap for Sneak
nnoremap : ;
nnoremap ; :
map \ <plug>Sneak_;


" GUI specific
if has('gui_running')
	nnoremap <silent> <leader>0 :set columns=180<CR>
	set columns=90
endif

" Buffer/Tabs management
nnoremap <leader>o :Clap files<CR>
nnoremap <leader><Tab> :Clap buffers<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <silent><leader><C-w> :bd!<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt


" File browsing
nnoremap <leader>- :Fern . -drawer -toggle -keep<CR>

" Tab browsing
nnoremap <leader>= :Vista!!<CR>
nnoremap <leader><S-Tab> :Clap tags<CR>


" Open my taskaper
nnoremap <leader>tas :tabnew \| e $HOME/todo/now.taskpaper<CR>


" Cancel & resume Visual
vnoremap c <esc>v


" External calls
if has('gui_macvim') && &filetype==#'python'
	nnoremap <silent> <F3> :!robofont "%:p"<CR>
	inoremap <silent> <F3> <ESC> :!robofont "%:p"<CR> 
elseif &filetype==#'python'
	nnoremap <silent> <F4> :python3 "%"<CR>
	inoremap <silent> <F4> :python3 "%"<CR>
endif



""""""""""""""""""
" »GUI Settings« "
""""""""""""""""""


if has('gui_running')
	set guioptions-=T " I don’t know why I have to
	set guioptions-=m " use multiple lines for
	set guioptions-=r " gvim win32
	set guioptions-=L
	set guioptions-=e
	set lines=999
	if has('gui_macvim')
		set guifont=PragmataProLiga-Regular:h11
		set macligatures
	elseif has('gui_win32')
		set guifont=Pragmata_Pro:h9:cANSI
	endif
	if has('gui_gtk2')
		set guifont=PragmataPro\ Liga\ 12
		" Experimental ligatures
		let g:gtk_nocache=[0x00000000, 0xfc00ffff,0xf8000001, 0x78000001]
	endif
elseif (has('termguicolors'))
	set termguicolors
endif

colorscheme hito

" Vim-clap theme based on hitodama
let s:palette={}
let s:palette.display={'guibg': '#ebebeb'}
let s:bg0={'guibg': '#cccccc'}
let s:bg1={'guibg': '#ebebeb'}
let s:palette.input=s:bg0
let s:palette.indicator=extend({'guifg':'#858585'}, s:bg0)
let s:palette.spinner=extend({'guifg':'#db6600', 'gui': 'bold'}, s:bg0)
let s:palette.search_text=extend({'guifg': '#2a2a2a', 'gui': 'bold'}, s:bg0)
let s:palette.preview=s:bg1

let s:palette.selected={'guifg': '#3d3d3d', 'gui': 'bold,underline'}
let s:palette.current_selection=extend({'guifg': '#2a2a2a', 'gui': 'bold'}, s:bg0)

let s:palette.selected_sign={'guifg': '#d11100'}
let s:palette.current_selection_sign=s:palette.selected_sign
let g:clap_theme=s:palette
let g:clap_fuzzy_match_hl_groups=[['64', '#309900'],]

