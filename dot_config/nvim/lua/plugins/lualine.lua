return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        -- globalstatus = true,
        component_separators = "",
        -- section_separators = { left = "", right = "" },
        section_separators = "",
      },
    })
  end,
}
