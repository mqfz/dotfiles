vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    local set = function(mode, lhs, rhs, opts)
      opts.buffer = event.buf
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
    set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
    set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
    set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
    set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
    set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    set({"n", "x"}, "<Leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens"})
    set({"n", "x"}, "<Leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
    set("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
    set("n", "<Leader>ce", function() vim.diagnostic.open_float({ scope = "cursor" }) end, { desc = "Diagnostic (Cursor)" })
    set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic Goto Prev" })
    set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic Goto Next" })
    set({"n", "v"}, "<Leader>cf", vim.lsp.buf.format, { desc = "Format" })
  end
})
