" Base .vimrc file
" Installation Instructions
"	1. Place file in home directory as .vimrc
"	2. Run the following command in terminal
"		mkdir .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo; git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"	3. Launch Vim and Run
"		:PluginInstall
" Or from shell vim +PluginInstall +qall
"	4. Restart Vim


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"languages
Bundle 'git@github.com:tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-haml.git'
Bundle 'git@github.com:kchmck/vim-coffee-script.git'
Bundle 'git@github.com:othree/html5.vim.git'
Bundle 'git@github.com:hail2u/vim-css3-syntax.git'

"formating text
Bundle 'git@github.com:godlygeek/tabular.git'
Bundle 'git@github.com:tpope/vim-surround.git'

"extract part of files with different syntax
Bundle 'git@github.com:vim-scripts/SyntaxRange.git'

" Commenting lines
Bundle 'git@github.com:tomtom/tcomment_vim.git'

" Snipmate and all its dependencies
Bundle "git@github.com:MarcWeber/vim-addon-mw-utils.git"
Bundle "git@github.com:tomtom/tlib_vim.git"
Bundle "git@github.com:garbas/vim-snipmate.git"
Bundle "git@github.com:honza/vim-snippets.git"

" Syntax check
Bundle 'git@github.com:scrooloose/syntastic.git'

" File explorer
Bundle 'git@github.com:Shougo/unite.vim.git'
Bundle 'git@github.com:Shougo/neomru.vim.git'
Bundle 'git@github.com:Shougo/vimproc.vim.git'

" Colorscheme
Bundle 'git@github.com:altercation/vim-colors-solarized.git'

" Autoclose
Bundle 'git@github.com:Raimondi/delimitMate.git'

" Markdown support
Bundle 'git@github.com:tpope/vim-markdown.git'

" Better status line
Bundle "git@github.com:itchyny/lightline.vim.git"

" Git support
Bundle "git@github.com:tpope/vim-fugitive.git"

" Undo branching
Bundle "git@github.com:sjl/gundo.vim.git"

" ctags ruby
Bundle "git@github.com:tpope/vim-bundler.git"

" Multiple cursors
Bundle "git@github.com:terryma/vim-multiple-cursors.git"

" Grep
Bundle "git@github.com:rking/ag.vim.git"

" Indentation lines
Bundle "git@github.com:nathanaelkane/vim-indent-guides.git"

call vundle#end()             " required
filetype plugin indent on     " required!
"
" Brief help
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set t_Co=256
syntax enable
set background=dark
:com -range JS <line1>,<line2>SyntaxInclude javascript
:com -range CSS <line1>,<line2>SyntaxInclude css
set colorcolumn=80
" I like 2 spaces for indenting
set shiftwidth=2

" I like 2 stops
set tabstop=2

" Spaces instead of tabs
set expandtab

" Ignore files
set wildignore+=*/bower_vendor_libs/**
set wildignore+=*/vendor/**

" Unite config
let mapleader = ","
noremap <NL> :Unite -start-insert file_rec/async:!<cr>
noremap <space>/ :Unite grep:.<cr>
let g:unite_prompt='» '
let g:unite_source_grep_command = 'ag'
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command= 'ag -p ~/.agignore --nocolor --nogroup -g ""'
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
call unite#set_profile('files', 'context.smartcase', 1)
call unite#set_profile('files', 'context.ignorecase', 1)
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async', 'matchers',
            \ ['converter_relative_word', 'matcher_default',
            \  'sorter_default', 'converter_relative_abbr'])
call unite#custom_source('file_rec,file_rec/async', 'converters', ['sorter_rank', 'sorter_word'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs',
    \ split(&wildignore, ','))

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-v>   <Tab>vsplit<CR>
endfunction

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
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\ue0a2" : ''
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
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? "\ue0a0".fugitive#head() : ''
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
set t_Co=256
set background=dark
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