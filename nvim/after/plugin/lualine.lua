require('lualine').setup({
    options = {
        theme = 'vscode',
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = string.lower }
        }
    }
})
