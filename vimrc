source $HOME/.vim/bundles.vim

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

au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-
