" set column marker at the 76th character
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" spell check
setlocal spell spelllang=en_us
map <F5> :setlocal spell! spelllang=en_us<CR>

" highlight search
set hlsearch

" highlight trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" new line without insert mode
nmap <CR> o<Esc>
nmap \ O<Esc>

" wrap around when moving the cursor
set whichwrap+=>,l
set whichwrap+=<,h

" set line numbers
map <F2> :setlocal number!<CR>
