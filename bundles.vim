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
Plugin 'git@github.com:tpope/vim-rails.git'
Plugin 'git://github.com/tpope/vim-haml.git'
Plugin 'git@github.com:kchmck/vim-coffee-script.git'
Plugin 'git@github.com:othree/html5.vim.git'
Plugin 'git@github.com:hail2u/vim-css3-syntax.git'

"formating text
Plugin 'git@github.com:godlygeek/tabular.git'
Plugin 'git@github.com:tpope/vim-surround.git'

"extract part of files with different syntax
Plugin 'git@github.com:vim-scripts/SyntaxRange.git'

" Commenting lines
Plugin 'git@github.com:tomtom/tcomment_vim.git'

" Snipmate and all its dependencies
Plugin 'git@github.com:MarcWeber/vim-addon-mw-utils.git'
Plugin 'git@github.com:tomtom/tlib_vim.git'
Plugin 'git@github.com:garbas/vim-snipmate.git'
Plugin 'git@github.com:honza/vim-snippets.git'

" Syntax check
Plugin 'git@github.com:scrooloose/syntastic.git'

" File explorer
Plugin 'git@github.com:Shougo/unite.vim.git'
Plugin 'git@github.com:Shougo/neomru.vim.git'
Plugin 'git@github.com:Shougo/vimproc.vim.git'

" Colorscheme
Plugin 'git@github.com:altercation/vim-colors-solarized.git'

" Autoclose
Plugin 'git@github.com:Raimondi/delimitMate.git'

" Markdown support
Plugin 'git@github.com:tpope/vim-markdown.git'

" Better status line
Plugin 'git@github.com:itchyny/lightline.vim.git'

" Git support
Plugin 'git@github.com:tpope/vim-fugitive.git'

" Undo branching
Plugin 'git@github.com:sjl/gundo.vim.git'

" ctags ruby
Plugin 'git@github.com:tpope/vim-bundler.git'

" Multiple cursors
Plugin 'git@github.com:terryma/vim-multiple-cursors.git'

" Grep
Plugin 'git@github.com:rking/ag.vim.git'

" Indentation lines
Plugin 'git@github.com:nathanaelkane/vim-indent-guides.git'

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
" NOTE: comments after Plugin command are not allowed..
