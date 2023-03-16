local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- To install a language server, run :LspInstall while editing a file. 
