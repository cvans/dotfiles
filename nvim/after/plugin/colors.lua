function SetupColors(color)
    color = color or "vscode"
    vim.cmd.colorscheme(color)
end

SetupColors()
