"Configure of Vundle

set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins

"call vundle#begin('~/some/path/here')
"
" Default Plugin

Plugin 'scrooloose/nerdtree'

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'Valloric/YouCompleteMe'

Plugin 'github/copilot.vim'

"Plugin 'lervag/vimtex'

"Plugin 'artur-shaik/vim-javacomplete2'


" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:

"filetype plugin on

"

" Brief help

" :PluginList       - lists configured plugins

" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate

" :PluginSearch foo - searches for foo; append `!` to refresh local cache

" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"

" see :h vundle for more details or wiki for FAQ

"

" Put your non-Plugin stuff after this line

"

"Old encoding setting...

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set termencoding=utf-8

set encoding=utf-8



"Configure airline

let molokai_original=1

let g:airline_theme="molokai"

"始终显示状态栏

set laststatus=2

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"

nnoremap <C-tab> :bn<CR>

nnoremap <C-s-tab> :bp<CR>

" 关闭状态显示空白符号计数

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#whitespace#symbol = '!'

" 设置consolas字体"前面已经设置过

"set guifont=Consolas\ for\ Powerline\ FixedD:h11

if !exists('g:airline_symbols')

  let g:airline_symbols = {}

endif

"End





"Own configure

nnoremap <leader>f :YcmCompleter FixIt<CR>
map <C-f> :YcmCompleter FixIt<CR>



set hlsearch

set mouse=a

set smartindent

set fdm=marker

set number

set tabstop=4

set softtabstop=4

set shiftwidth=4

set backspace=2
set expandtab
syntax on

"map keys

let mapleader=','

imap jj <esc>
imap <C-s> <esc>:w!<CR>i
map <C-s> :w!<CR>
"map <C-X> :!make<CR>
map <C-J> :sh<CR>

map <F8> : ! xcodebuild <CR>

map <F12> : ! subl ./% <CR>

map <F2> : ! python3 % <CR>
map <C-k> :bp<CR>
map <C-l> :bn<CR>
imap kk /*
imap ;; */


colors desert

" latex
command! -nargs=+ Silent
\   execute 'silent ! <args>'
\ | redraw!

map <C-X> :Silent pdflatex % && open -a Preview && open -a iTerm


" ycm configure
let g:airline_powerline_fonts = 1
let g:ycm_server_python_interpreter='python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:syntastic_always_populate_loc_list = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>n :NERDTree<CR>:wincmd p<CR>
nnoremap <leader>jf :NERDTreeFind<CR>
imap <C-d> <esc>:YcmCompleter GoToDefinitionElseDeclaration<CR>i

" OpenCL
au BufWinEnter,BufNewFile,BufRead *.cl        setf opencl

set exrc
set secure

let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/path/to/yaml/server/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   },
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'ra_lsp_server' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \    }
  \ ]


