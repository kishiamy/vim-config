" Base .vimrc file
" Installation Instructions
"	1. Place file in home directory as .vimrc
"	2. Run the following command in terminal
"		mkdir .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo; git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
"	3. Launch Vim and Run
"		:BundleInstall
"	5. Restart Vim


set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"languages
Bundle 'tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-haml.git'
Bundle 'vim-coffee-script'
Bundle 'git://github.com/groenewege/vim-less.git'
Bundle 'git@github.com:othree/html5.vim.git'
Bundle 'git@github.com:hail2u/vim-css3-syntax.git'
Bundle 'git@github.com:nono/vim-handlebars.git'

"formating text
Bundle 'godlygeek/tabular'
Bundle 'surround.vim'

"extrat parto of files with diferent sintax
Bundle 'git@github.com:vim-scripts/SyntaxRange.git'

"comenting lines
Bundle "tComment"

" Snipmate an d all its dependencies
Bundle "git@github.com:MarcWeber/vim-addon-mw-utils.git"
Bundle "git@github.com:tomtom/tlib_vim.git"
Bundle "git@github.com:garbas/vim-snipmate.git"
Bundle "git@github.com:honza/vim-snippets.git"

"sintax check
Bundle 'scrooloose/syntastic'

"file explorer
Bundle 'git@github.com:kien/ctrlp.vim.git'
let mapleader = ","
noremap <NL> :CtrlP<Cr>
"colorscheme
Bundle 'git@github.com:altercation/vim-colors-solarized.git'
"autoclouse
Bundle 'HTML-AutoCloseTag'
Bundle 'delimitMate.vim'
"markdown
Bundle 'https://github.com/tpope/vim-markdown'

"Better satatus line
Bundle "git@github.com:itchyny/lightline.vim.git"

" Git suppert
Bundle "git@github.com:tpope/vim-fugitive.git"

" Gundo
Bundle "git@github.com:sjl/gundo.vim.git"

"ctags ruby
Bundle "git@github.com:tpope/vim-bundler.git"

" multiple cursors
Bundle "git@github.com:terryma/vim-multiple-cursors.git"

"grep
Bundle "git@github.com:dkprice/vim-easygrep.git"

" indentation lines
Bundle "git@github.com:nathanaelkane/vim-indent-guides.git"

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set t_Co=256
syntax enable
set background=light
:com -range JS <line1>,<line2>SyntaxInclude javascript
:com -range CSS <line1>,<line2>SyntaxInclude css
set colorcolumn=80
" I like 2 spaces for indenting
set shiftwidth=2

" I like 2 stops
set tabstop=2

" Spaces instead of tabs
set expandtab
" Indentation grid

" EAsyGrep config
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepJumpToMatch=1

au BufRead,BufNewFile *.hjs set filetype=handlebars

" lightline config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

" set color scheme
colorscheme solarized

" Gundo map
nnoremap ,u :GundoToggle<CR>
" highlight search
set hlsearch
" highlight existing trailing whitespace and also strip trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWinEnter * :IndentGuidesEnable

autocmd BufWritePre * :%s/\s\+$//e