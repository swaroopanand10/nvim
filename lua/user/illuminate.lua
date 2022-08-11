local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

 -- vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
 -- vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
 -- vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
