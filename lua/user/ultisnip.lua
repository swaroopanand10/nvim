--vim.cmd[[let g:UltiSnipsExpandTrigger=",,"]] --old

require("cmp_nvim_ultisnips").setup {
  filetype_source = "treesitter",
  show_snippets = "all",
  documentation = function(snippet)
    return snippet.description
  end
}
vim.cmd[[let g:UltiSnipsExpandTrigger=".."]]
