" Base .vimrc file
" Installation Instructions
"	1. Place file in home directory as .vimrc
"	2. Run the following command in terminal
"		mkdir .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo; curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"	3. Launch Vim and Run
"		:PlugInstall
" Or from shell vim +PlugInstall +qall
"	4. Restart Vim

call plug#begin('~/.vim/bundle')

"Languages
Plug 'git://github.com/tpope/vim-rails.git', { 'for': [ 'ruby', 'eruby' ] }
Plug 'git://github.com/tpope/vim-haml.git', { 'for': 'haml' }
Plug 'git://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }
Plug 'git://github.com/othree/html5.vim.git', { 'for': [ 'html', 'eruby', 'haml' ] }
Plug 'git://github.com/hail2u/vim-css3-syntax.git', { 'for': [ 'css', 'scss' ] }
Plug 'git://github.com/JulesWang/css.vim.git', { 'for': [ 'css', 'scss' ] }
Plug 'git://github.com/cakebaker/scss-syntax.vim.git', { 'for': [ 'css', 'scss' ] }
Plug 'git://github.com/tpope/vim-markdown.git', { 'for': 'markdown' }

"Syntax check
Plug 'git://github.com/scrooloose/syntastic.git'

"File explorer
Plug 'git://github.com/scrooloose/nerdtree.git'

"Colorscheme
Plug 'git://github.com/altercation/vim-colors-solarized.git'

"Better status line
"Plug 'git://github.com/itchyny/lightline.vim.git'

"Git support
Plug 'git://github.com/tpope/vim-fugitive.git'

"Grep
Plug 'git://github.com/rking/ag.vim.git', { 'on': 'Ag' }

call plug#end()

"
" Brief help
"
" :PlugInstall [name ...] - intall Plugins
" :PlugUpdate [name ...]  - update Plugins
" :PlugClean[!]           - Remove unused directories (bang version will clean
"                           without prompt)
"
" NOTE: comments after Plug command are not allowed..
