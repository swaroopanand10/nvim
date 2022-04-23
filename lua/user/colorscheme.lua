vim.cmd [[
try
  colorscheme monovibrantdark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
-- require('onedark').setup {
--     style = 'cool'
-- }
-- require('onedark').load()
