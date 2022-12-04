local function lsp_overloads_signature()
  local lsp_clients = vim.lsp.get_active_clients()

  local clients = {}
  if #lsp_clients < 1 then
    return
  end

  for _, client in ipairs(lsp_clients) do
    if client.server_capabilities.signatureHelpProvider then
      table.insert(clients, client)
    end
  end
  require("lsp-overloads.handlers").open_signature(clients, true)
end

vim.api.nvim_create_user_command("LspOverloadsSignature", lsp_overloads_signature, {
  desc = "Triggers the lspoverloads signature request",
  nargs = 0,
})
