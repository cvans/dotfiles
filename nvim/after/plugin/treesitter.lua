require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "help", "query", "javascript", "typescript", "python", "ruby", "html", "css", "embedded_template" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}


-- Added for ERB, EJS support
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.embedded_template = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = {"src/parser.c"},
    requires_generate_from_grammar = false,
  },
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.ejs = "embedded_template"

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ejs",
  command = "set filetype=ejs"
})
