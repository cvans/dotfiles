return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.o.background = "dark"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_enable_italic = true
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
