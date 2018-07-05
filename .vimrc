" set column marker at the 80th character
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" spell check
setlocal spell spelllang=en_us
map <F5> :setlocal spell! spelllang=en_us<CR>
imap <F5> <C-O>:setlocal spell! spelllang=en_us<CR>

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
imap <F2> <C-O>:setlocal number!<CR>

" aliases
command OpenPDF !mupdf %:r.pdf &
command LatexInit w | !pdflatex % && mupdf %:r.pdf &
command Latex w | !pdflatex % && kill -SIGHUP $(pgrep -u $USER mupdf)

" clipboard support
" Linux:
set clipboard=unnamedplus
autocmd VimLeave * call system('echo -n ' . shellescape(getreg('+')) . ' | xclip -selection c')
" Windows:
"set clipboard=unnamed

" insert single character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" enable syntax highlighting
syntax enable

" enable file searching
filetype plugin on
set path+=**
set wildmenu
