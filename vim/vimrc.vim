"Set leaders
let mapleader = " "
let maplocalleader = "  "

set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
"set rtp+=~/home/samr/.vim/bundle/Vundle.vim
"set rtp=/home/samr/.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'w0rp/ale'  " This seems to really kill load time on dev-vms
Plugin 'nvie/vim-flake8'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'sandeepcr529/buffet.vim'
Plugin '907th/vim-auto-save'
Plugin 'ojroques/vim-oscyank'

" Tmux and vim navigator
Bundle 'christoomey/vim-tmux-navigator'

" Turn on autosave on vim startup
let g:auto_save = 1

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

" Ed's tab stuff
"set expandtab
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
:set foldlevelstart=99  " Don't have folds closed on open

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

:set wrap linebreak nolist
" numbering
set number norelativenumber

"Getting python indentation
"au BufNewFile,BufRead *.py
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix

"Adding support for utf8
set encoding=utf-8

"Get search results always in the centre of the screen
set scrolloff=999

"Highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='pythonTODO', timeout=200 }
augroup END

"For copy and paste
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg + | endif

"Remove search highlighting
nnoremap <Leader><space> :noh<cr>

"Make code look nice
let python_highlight_all=1
syntax on

"Adding hybrid line numbering
:set number relativenumber

"Stops vim from splitting lines
set formatoptions-=tc

"Vim window resizing
set splitbelow
set splitright

"Turn off swap files
set noswapfile
set nobackup
set nowb

"Keep undo history across sessions
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"Buffet mapping
map <C-e> :Bufferlist<CR>

"NERDtree mapping
nmap <C-a> :NERDTreeToggle<CR>

"Make NERDTREE look cleaner
let NERDTreeDirArrows=1
let g:NERDTreeNodeDelimiter="\u00a0"

"NERDtree relative line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

"Better NERDtree closing
let NERDTreeQuitOnOpen=1

"Custom NERDtree split keys
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='hh'

"Allow mouse scrolling
"set mouse=a 

"Better highlighting
set background=light

"Buffer stuff
set hidden

" Turn off filename line at bottom of pane
set laststatus=0

"Copy and paste stuff 
set clipboard+=unnamedplus

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Custom mappings
noremap <leader>ev :split $HOME/git/dotfiles/vim/vimrc.vim<cr>G
noremap <leader>sv :source $HOME/.vimrc<cr>
noremap <leader>0 ^
noremap <leader>pdb Oimport pdb; pdb.set_trace()<esc>
noremap <leader>todo O# TODO:
noremap <leader>l ggjj
noremap <leader>test iif<Space>__name__<Space>==<Space>"__main__":<cr>unittest.main()<cr>
noremap <leader>3 ^i#<esc>
noremap <leader>nnum :set nonumber norelativenumber<cr>
noremap <leader>num :set number relativenumber<cr>
