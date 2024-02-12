"              ██
" ██▒  ▒██     ██
" ██▓  ▓██     ██
" ▒██  ██▒
" ▒██  ██▒   ████     ██▓█▒██▒   ██░████    ▓████▒
"  ██ ░██    ████     ████████   ███████   ███████
"  ██▒▒██      ██     ██░██░██   ███░     ▓██▒  ▒█
"  ██▒▒██      ██     ██ ██ ██   ██       ██░
"  ▒████▒      ██     ██ ██ ██   ██       ██
"  ░████░      ██     ██ ██ ██   ██       ██░
"   ████       ██     ██ ██ ██   ██       ▓██▒  ░█
"   ████    ████████  ██ ██ ██   ██        ███████
"   ▓██▓    ████████  ██ ██ ██   ██         ▓████▒
"
" Scholar 7r <scholar7r@outlook.com>(scholar7r.cn)
" ================================================
" ===
" === Auto load for first time users
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter = PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Default
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=UTF-8
set clipboard=unnamed

" ===
" === Main code display
" ===
" set number
" set relativenumber
set ruler
set cursorline
syntax enable
syntax on

" ===
" === Editor behavior
" ===
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set nowrap
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set showcmd
set noshowmode
set formatoptions-=tc

" Show command autocomplete
set wildignore=node_modules/**,target/**
set wildmenu
set wildmode=longest,list,full

" Searching options
set hlsearch
set incsearch
set ignorecase
set smartcase
exec "nohlsearch"

" ===
" === Instal plugins with Vim-Plug
" ===
call plug#begin('~/.vim/plugged')
" Dress up vim
Plug 'connorholyday/vim-snazzy'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

" Startify
Plug 'mhinz/vim-startify'

" Signify
Plug 'mhinz/vim-signify'

" Markdown support
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Rust support
Plug 'rust-lang/rust.vim'

" Syntax check
Plug 'dense-analysis/ale'

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Nerd commenter <LEADER> + key
Plug 'preservim/nerdcommenter'

" Auto surround
Plug 'tpope/vim-surround'

" Tagbar <F8>
Plug 'preservim/tagbar'

" Fzf <LEADER> fu
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tracyone/fzf-funky', { 'on': 'FzfFunky' }

call plug#end()

" ===
" === Dress up my vim
" ===
set t_Co=256
set termguicolors
colorscheme snazzy
hi Normal guibg = NONE
let g:webdevicons_enable = 1
let g:lightline = {
  \ 'colorscheme': 'ayu_dark',
  \ 'component_function': {
    \ 'filetype': 'LightFileType',
    \ 'fileformat': 'LightFileFormat',
    \}
  \}

function! LightFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ===
" === Vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Nerd comment
" ===
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" ===
" === Coc.nvim
" ===
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-marketplace',
  \ 'coc-rust-analyzer',
  \ 'coc-explorer',
  \ 'coc-toml',
  \ 'coc-json'
  \]

" Use <Tab> and <Shift-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Vim signify configuration for async update
set updatetime=100

" Rust Dev
let g:rustfmt_autosave=1
let g:rustfmt_command="rustfmt"

" Ale
let g:ale_linters={'rust': ['cargo', 'clippy', 'analyzer']}
let g:ale_fixers={'rust': ['cargo', 'rustfmt']}
let g:ale_rust_cargo_use_clippy=1

" Coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" FzfFunky
nmap <Leader>fu :FzfFunky<CR>
