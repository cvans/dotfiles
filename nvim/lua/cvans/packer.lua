return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use {
        'Mofiqul/vscode.nvim',
        as = 'vscode'
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = 'nvim-lua/plenary.nvim' 
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

end)

