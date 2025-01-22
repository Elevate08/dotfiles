local lsp = require('lspconfig')
local completion = require('completion')

local custom_attach = function()
    completion.on_attach()
    -- Python specifically isn't setting omnifunc correctly, ftplugin conflict
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

end

lsp.pylsp.setup{on_attach=custom_attach,
                handlers = {
                  ["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, {
                      -- Disable virtual_text
                      virtual_text = false
                    }
                    ),
                }
            }
lsp.jsonls.setup{on_attach=custom_attach}
lsp.bashls.setup{on_attach=custom_attach}
lsp.yamlls.setup{on_attach=custom_attach}
