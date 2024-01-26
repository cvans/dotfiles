return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c_sharp", "css", "html", "javascript", "lua", "python", "ruby", "rust", "vim" }, 
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
