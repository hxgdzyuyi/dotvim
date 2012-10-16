runtime! debian.vim
set t_Co=256
syntax on
source ~/.vim/vimrc_vundle
set nocompatible
set noswapfile
set fileencodings=ucs-bom,utf-8,chinese,cp936
set isk+=-
set list
set listchars=tab:▸\ ,trail:·

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif
au BufNewFile,BufRead *.jsm set filetype=javascript
au BufNewFile,BufRead *.php set filetype=php
au BufNewFile,BufRead *.html set filetype=mako
au BufNewFile,BufRead *.rb set filetype=ruby
colorscheme pablo

filetype plugin indent on
autocmd FileType javascript set dictionary+=~/.vim/dict/javascript.dict
autocmd FileType javascript set dictionary+=~/.vim/dict/backbone.dict
autocmd FileType javascript set dictionary+=~/.vim/dict/jquery.dict
autocmd FileType css set dictionary=~/.vim/dict/css.dict
autocmd FileType php set dictionary=~/.vim/dict/php.dict
set autoindent
set cindent
set rnu


set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
map ,n :NERDTreeToggle<CR>
map ,l :TlistToggle<CR>
if !exists("g:completekey")
let g:completekey = "<C-j>"   "hotkey
endif
"<leader>
let mapleader = ","
let maplocalleader = "\\"
au GUIEnter * simalt ~x
let g:SuperTabDefaultCompletionType="<C-X><C-K>"
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
map ,<space> :w<enter>
nnoremap <LocalLeader>i2 :setl ts=2 sw=2 sts=2<CR>
nnoremap <LocalLeader>i4 :setl ts=4 sw=4 sts=4<CR>
nnoremap <LocalLeader>et :setl et!<CR>
inoremap ,4 function(){}<left><enter><esc>O
inoremap ,,4 ,function(){}<left><enter><esc>O
inoremap ,v ,function(){}<left><enter><esc>O
nmap ,f /<c-r><c-w>:<enter>
autocmd InsertLeave * write
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start

let tlist_mako_settings = 'mako;n:name'
au BufNewFile,BufRead *.php set filetype=php
let tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set colorcolumn=80
let b:jslint_disabled=1
let g:ctrlp_map = '<Leader>t'
hi ColorColumn ctermbg=gray guibg=gray
set incsearch
" 通过 xclip 复制粘贴
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>
map <c-p> :tabprevious<enter>
map <c-n> :tabnext<enter>