let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/colorschemes/glowbeamdark.nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +1 ~/Desktop/cf/out.txt
badd +15 ~/Desktop/cf/cpp.cpp
badd +1 ~/Desktop/cf/in.txt
argglobal
%argdel
edit ~/Desktop/cf/cpp.cpp
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 72 + 72) / 144)
exe '2resize ' . ((&lines * 16 + 17) / 35)
exe 'vert 2resize ' . ((&columns * 71 + 72) / 144)
exe '3resize ' . ((&lines * 15 + 17) / 35)
exe 'vert 3resize ' . ((&columns * 71 + 72) / 144)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 15 - ((14 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 02|
lcd ~/Desktop/cf
wincmd w
argglobal
if bufexists(fnamemodify("~/Desktop/cf/in.txt", ":p")) | buffer ~/Desktop/cf/in.txt | else | edit ~/Desktop/cf/in.txt | endif
if &buftype ==# 'terminal'
  silent file ~/Desktop/cf/in.txt
endif
balt ~/Desktop/cf/cpp.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Desktop/cf
wincmd w
argglobal
if bufexists(fnamemodify("~/Desktop/cf/out.txt", ":p")) | buffer ~/Desktop/cf/out.txt | else | edit ~/Desktop/cf/out.txt | endif
if &buftype ==# 'terminal'
  silent file ~/Desktop/cf/out.txt
endif
balt ~/Desktop/cf/in.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Desktop/cf
wincmd w
exe 'vert 1resize ' . ((&columns * 72 + 72) / 144)
exe '2resize ' . ((&lines * 16 + 17) / 35)
exe 'vert 2resize ' . ((&columns * 71 + 72) / 144)
exe '3resize ' . ((&lines * 15 + 17) / 35)
exe 'vert 3resize ' . ((&columns * 71 + 72) / 144)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
