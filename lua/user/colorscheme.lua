vim.cmd [[
try
  colorscheme monovibrant
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
