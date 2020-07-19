syntax enable
colorscheme monokai
"color desert
set nocompatible
" fuzzy find files with short cut C-p
nnoremap <C-p> :find *

filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

" allows mouse click to change cursor line
set mouse=a

set wildmenu
set showmatch
set incsearch
set hlsearch

syntax on
set modelines=0
set number
set ruler
set novisualbell
set noerrorbells
set encoding=utf-8

let mapleader = "," 

set hidden

set ttyfast

"status bar things
set laststatus=2
set showcmd
set showmode

" up and down wrapped lines 
nnoremap j gj
nnoremap k gk

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set expandtab

set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>

" clear search
nnoremap <leader><space> :let @/=''<CR>

" vims path stays in root and recursive down
set path+=**

nnoremap <leader>r gg=G

"Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

set splitbelow
set splitright

"colorscheme monokai
set cursorline!
nnoremap <leader>c :set cursorline!<CR>

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
