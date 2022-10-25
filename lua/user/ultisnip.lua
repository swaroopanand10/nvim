-- vim.cmd[[let g:UltiSnipsExpandTrigger=",,"]] --old
vim.cmd[[let g:UltiSnipsExpandTrigger=".."]]

require("cmp_nvim_ultisnips").setup {
  filetype_source = "treesitter",
  show_snippets = "all",
  documentation = function(snippet)
    return snippet.description
  end
}
