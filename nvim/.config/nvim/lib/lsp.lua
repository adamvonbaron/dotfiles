vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      client.server_capabilities.semanticTokenProvider = nil

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = event.buf,
        callback = function ()
          vim.lsp.buf.format({
            async = false,
            filter = function(c)
              return c.id == client.id
            end
          })
        end
      })
    end,
})
