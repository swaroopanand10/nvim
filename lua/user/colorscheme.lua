vim.cmd [[
try
  colorscheme glowbeamdark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()
