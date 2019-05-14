" set column marker at the 80th character
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" spell check
setlocal spell spelllang=en_us
map <F6> :setlocal spell! spelllang=en_us<CR>
imap <F6> <C-O>:setlocal spell! spelllang=en_us<CR>

" highlight search
set hlsearch

highlight BadSpacing ctermbg=red guibg=red
"let m = matchadd('BadSpacing', '  * ')
" multiple spaces
call matchadd('BadSpacing', '  * ')
" no space between for, if, while, switch and (
call matchadd('BadSpacing', '\W\(fo\zsr\|i\zsf\|whil\zse\|switc\zsh\)(')
" no space between do and {
call matchadd('BadSpacing', 'do{')
" whitespace after (
call matchadd('BadSpacing', '(\s')
" whitespace before )
call matchadd('BadSpacing', '\s)')
" non space before {
call matchadd('BadSpacing', '\S{')
" non space, comma or ; after }
call matchadd('BadSpacing', '}[^ ,;]')
" no else or while after }
call matchadd('BadSpacing', '} \(else\|while\|catch\)\@!')
" whitespace before ,
call matchadd('BadSpacing', '\s,')
" non space after ,
call matchadd('BadSpacing', ',\S')
" space before ;
call matchadd('BadSpacing', '\s\ze;')
" non space after ;
call matchadd('BadSpacing', ';\S')

" space before but not after assignment operator
call matchadd('BadSpacing', '\s\(\|[*+-/%&|^]\|<<\|>>\)\?=\ze[^ =]')
" space after but not before assignment operator
call matchadd('BadSpacing', '[^ =!<>*+-/%&|^]\zs\([*+-/%&|^]\|<<\|>>\)\?=\s')
" non space before and after assignment operators
call matchadd('BadSpacing', '[^ =!<>*+-/%&|^]\(operator\)\@<!\zs\([*+-/%&|^]\|<<\|>>\)\?=\ze[^ =>]')
" non space before assignment operators
"call matchadd('BadSpacing', '[^ =!<>*+-/%&|^]\zs\([*+-/%&|^]\|<<\|>>\)\?=\ze[^=]')
" non space after assignment operators
"call matchadd('BadSpacing', '[^=!<>]\zs\([*+-/%&|^]\|<<\|>>\)\?=\ze[^ =>]')

" space before but not after comparison operator
call matchadd('BadSpacing', '\(include\s*\)\@<!\s\([<>]\|[=!<>]=\|<=>\)\ze[^ =<>]')
" space after but not before comparison operator
call matchadd('BadSpacing', '\(<\w*\)\@<![^ <>=]\zs\([<>]\|[=!<>]=\|<=>\)\s')

" empty lines at beginning of the file with optional whitespace
call matchadd('BadSpacing', '\%^\(\n\s*\)\+')
" consecutive empty lines with optional whitespace
call matchadd('BadSpacing', '\n\zs\s*\(\n\s*\)\{2,\}')
" empty lines at the end of the file with optional whitespace
" WARNING: doesn't match the very last line
call matchadd('BadSpacing', '^\(\n\s*\)\+\%$')

" clear all matches
map <F4> :call clearmatches()<CR>
imap <F4> <C-O>:call clearmatches()<CR>

highlight SpaceAfterTab ctermbg=blue guibg=blue
call matchadd('SpaceAfterTab', '\t\+\zs \+')
" tab at a non-starting place
highlight RandomTab ctermbg=cyan guibg=cyan
call matchadd('RandomTab', '^\s*\S\+[^\t]*\zs\t')

highlight IndentSpace ctermbg=green guibg=green
call matchadd('IndentSpace', '^ \+')

highlight BadWhitespace ctermbg=red guibg=red
call matchadd('BadWhitespace', '\s\+$')

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

" propper indentation of a new line
set autoindent
filetype plugin indent on
imap <C-Return> <CR><CR><C-o>k<Tab>

" switch files
map <F8> <C-^>

" set show tabs as ^I
map <F3> :setlocal list!<CR>
imap <F3> <C-O>:setlocal list!<CR>

" refresh vim config
map <F5> :so $MYVIMRC<CR>
imap <F5> <C-O>:so $MYVIMRC<CR>
