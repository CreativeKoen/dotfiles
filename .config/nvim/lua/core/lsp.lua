vim.g.diagnostic_show_sign = 1
vim.g.diagnostic_enable_ale = 0
vim.g.diagnostic_insert_delay = 0
vim.g.diagnostic_enable_virtual_text = 1

vim.g.completion_confirm_key = ""
vim.g.completion_trigger_character = {'.'}
vim.g.completion_enable_auto_paren = 1 -- Complete parentheses for functions
vim.g.completion_trigger_keyword_length = 2
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config({
  indicator_errors = 'E',
  indicator_warnings = 'W',
  indicator_info = 'i',
  indicator_hint = '?',
  indicator_ok = 'Ok',
})

local mapper = function(mode, key, action)
  local command = string.format("<cmd>lua %s()<cr>", action)
  vim.api.nvim_buf_set_keymap(0, mode, key, command, {noremap=true, silent=true})
end

-- lsp saga
vim.lsp.handlers["textDocument/hover"] = require('lspsaga.hover').handler

local on_attach = function(client)
  require('completion').on_attach(client)
  lsp_status.on_attach(client)

  mapper('n', 'gD',  'vim.lsp.buf.declaration')
  mapper('n', 'gd',  'vim.lsp.buf.definition')
  --mapper('n', '<c-]>',  'vim.lsp.buf.definition')

  mapper('n', 'gi',  'vim.lsp.buf.implementation')
  --mapper('n', 'gr',  'vim.lsp.buf.references')

  mapper('n', 'gds', 'vim.lsp.buf.document_symbol')
  mapper('n', 'gW', 'vim.lsp.buf.workspace_symbol')

  -- lsp saga
  mapper('n', '<c-k>', 'vim.lsp.buf.hover')
  mapper('n', '<leader>ca',  "require('lspsaga.codeaction').code_action")
  mapper('i', '<leader>ca',  "require('lspsaga.codeaction').code_action")
  mapper('i', 'gs',  "require('lspsaga.signaturehelp').signature_help")
  mapper('n', 'gr', "require('lspsaga.rename').rename")

  mapper('n', '<leader>sd', "require('lspsaga.diagnostic').show_line_diagnostics")
  mapper('n', '[e', "require('lspsaga.diagnostic').lsp_jump_diagnostic_prev")
  mapper('n', ']e', "require('lspsaga.diagnostic').lsp_jump_diagnostic_next")
end

-- The langauges servers
local servers = {'vimls', 'tsserver', 'html', 'yamlls', 'graphql', 'cssls', 'terraformls', 'gopls'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
  }
end

--require('nlua.lsp.nvim').setup(lspconfig, {
  --on_attach = on_attach,
  --capabilities = lsp_status.capabilities
--})

