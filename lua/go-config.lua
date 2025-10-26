-- Enable gopls LSP for Go files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({'go.mod', '.git'}, { upward = true })[1])
    vim.lsp.start({
      name = 'gopls',
      cmd = {'gopls'},
      root_dir = root_dir,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })
  end,
})

-- Auto format and organize imports on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        end
      end
    end
    vim.lsp.buf.format()
  end,
})
