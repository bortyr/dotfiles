call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mcchrish/nnn.vim'
Plug 'dense-analysis/ale'

call plug#end()

"Autocmd for markdown files

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

set nocompatible
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
  autocmd FileType text			   call pencil#init()
augroup END

"Set spell checker language in markdown files

autocmd FileType markdown,mkd,md :set spelllang=en

"Automaticaly run make after writing .md file

autocmd BufWritePost *.md :make

"Change spelling errors highlighting style

autocmd FileType markdown,mkd,md hi clear SpellBad
autocmd FileType markdown,mkd,md hi  SpellBad ctermfg=red
autocmd FileType markdown,mkd,md hi  SpellBad cterm=underline
autocmd FileType markdown,mkd,md hi  SpellBad cterm=bold

autocmd FileType markdown,mkd,md hi clear SpellCap
autocmd FileType markdown,mkd,md hi  SpellCap ctermfg=cyan
autocmd FileType markdown,mkd,md hi  SpellCap cterm=underline
autocmd FileType markdown,mkd,md hi  SpellCap cterm=bold

"Shorcuts
map <F3> make <CR>
map <F4> :noautocmd w <CR>

"Toggle tagbar

nmap <F8> :TagbarToggle<CR>

"Syntax
syntax on
syntax enable
colorscheme OceanicNext	

"gui
set background=dark
set nocompatible
set autoindent
set linebreak
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set hidden
set history=100
set number	
set visualbell
set hlsearch
set rnu

"Persistent undo
set undodir=~/.vim/undodir
set undofile

"Use global buffer for y and p
"set clipboard+=unnamed

filetype plugin indent on

map rr :source ~/.vimrc

if &term =~ '256color'
	set t_ut=
endif

set t_vb=

packloadall
silent! helptags ALL
