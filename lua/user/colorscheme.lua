vim.cmd [[
try
  " colorscheme tokyonight-night
  " colorscheme aurora
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd[[hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg ]] -- this is for disappearing tilde sign


-- this colorscheme was throwing error in normal way, that is why it is declared here
vim.cmd([[
let g:aurora_italic = 1     
let g:aurora_transparent = 1     
let g:aurora_bold = 1     
let g:aurora_darker = 1     
colorscheme aurora
hi! EndOfBuffer guibg=#000000 guifg=#000000 ctermbg=0 ctermfg=0
]])

