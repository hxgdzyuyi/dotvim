runtime! debian.vim
set t_Co=256
syntax on
source ~/.vim/vimrc_vundle
set nocompatible
set noswapfile
set fileencodings=ucs-bom,utf-8,chinese,cp936
set isk+=-
set list
set listchars=tab:\ \ ,trail:·

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

colorscheme pablo

filetype plugin indent on
set rnu
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

map ,n :NERDTreeToggle<CR>
map ,l :TagbarToggle<CR>

if !exists("g:completekey")
  let g:completekey = "<C-j>" " hotkey
endif

" Laravel-Specific Mapping {
  nmap ,lr :CtrlP<CR>routes/api_v2.php<CR>
" }

" Key Mapping {
  let mapleader = ","
  let maplocalleader = "\\"
  inoremap ( ()<left>
  inoremap { {}<left>
  inoremap [ []<left>
  inoremap " ""<left>
  inoremap ' ''<left>
  inoreabbrev rt return
  inoremap <c-j> <down>
  inoremap <c-k> <up>
  inoremap <c-l> <right>
  inoremap <c-c> <esc>
  map ,<space> :update<CR>
  nnoremap <LocalLeader>i2 :setl ts=2 sw=2 sts=2<CR>
  nnoremap <LocalLeader>i4 :setl ts=4 sw=4 sts=4<CR>
  nnoremap <LocalLeader>et :setl et!<CR>
  inoremap ,4 function() {}<left><enter><esc>O
  inoremap ,5 () => {}<left><enter><esc>O
  inoremap cl<Tab> console.log()<left>
  nmap ,f /<c-r><c-w>:<enter>
  nnoremap <leader>q :close<CR>
  set pastetoggle=<leader>p
" }


let g:SuperTabDefaultCompletionType="<C-X><C-N>"
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start

let tlist_mako_settings = 'mako;f:function'
let tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set colorcolumn=80
let b:jslint_disabled=1
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.|dist|node_modules|bower_components|^build'
  \ }
hi ColorColumn ctermbg=gray guibg=gray
set incsearch


" 通过 xclip 复制粘贴
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>
map <c-p> :tabprevious<enter>
map <c-n> :tabnext<enter>

let g:tagbar_type_mako = {
    \ 'ctagstype' : 'mako',
    \ 'kinds'     : [
        \ 'f:function',
    \ ]
\ }

" Toggle comment highlighting {
  nnoremap <leader>hc :call ToggleCommentHighlight()<cr>
  let s:comment_highlighting = 0
  function! ToggleCommentHighlight()
    if s:comment_highlighting
      let s:comment_highlighting = 0
      colorscheme pablo
      hi ColorColumn ctermbg=lightgrey
      return
    endif

    let s:comment_highlighting = 1
    hi Comment guifg=#bcbcbc gui=none
    hi Comment ctermfg=250 cterm=none
  endfunction
" }

autocmd BufNewFile,BufRead *.html set filetype=mako
autocmd BufNewFile,BufRead *.wxml set filetype=html
autocmd BufNewFile,BufRead *.wxss set filetype=css
autocmd BufNewFile,BufRead *.inc set filetype=html
autocmd BufNewFile,BufRead *.hds set filetype=html
autocmd BufNewFile,BufRead *.ftl set filetype=ftl
autocmd BufNewFile,BufRead *.handlebars set filetype=html
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.pug set filetype=jade
autocmd BufNewFile,BufRead .php_cs set filetype=php
autocmd BufNewFile,BufRead *.stub set filetype=php
autocmd FileType html,js EmmetInstall
autocmd FileType go set listchars=tab:\ \ ,trail:·
autocmd Filetype crontab setlocal nobackup nowritebackup


" Custom Autocmd {
"  autocmd GUIEnter * simalt ~x
"  autocmd BufWritePost vimrc source ~/.vimrc
"  autocmd BufWritePost *.js
"    \  if expand("%:p:h") =~ 'public/js/\(publish\|mobile\|reader\|mod\)'
"    \  | execute "silent !grunt >/dev/null 2>&1 &"
"    \  | endif
" }

let g:shirevim#app="waymeet"

set laststatus=2
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\
set ffs=unix,dos
set clipboard=unnamed

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


cabbrev gm tabnew<space>~/.commit-for-git

"-------------  pdv --------------"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

"------------- Functions --------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

set tags+=tags,tags.vendors
let g:loaded_sql_completion = 0

au BufRead,BufNewFile *.vue set ft=javascript.jsx
au BufRead,BufNewFile *.wxa set ft=javascript.jsx
au BufRead,BufNewFile *.wxp set ft=javascript.jsx
au BufRead,BufNewFile *.wxc set ft=javascript.jsx

let g:vim_markdown_folding_disabled = 1
