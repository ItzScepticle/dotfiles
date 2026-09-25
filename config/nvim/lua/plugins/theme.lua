return {
    --{'catppuccin/nvim',config=function()vim.cmd.colorscheme('catppuccin-mocha')end},
    --{'folke/tokyonight.nvim',config=function()vim.cmd.colorscheme('tokyonight-storm')end},
    --{'EdenEast/nightfox.nvim',config=function()vim.cmd.colorscheme('nightfox')end},
    --{'navarasu/onedark.nvim',config = function ()require('onedark').load()end},
    --{"drewtempelmeyer/palenight.vim",config = function()vim.cmd.colorscheme("palenight")end},
    {'rebelot/kanagawa.nvim', config=function ()vim.cmd.colorscheme("kanagawa")end},
    --{'tiagovla/tokyodark.nvim', config=function ()vim.cmd.colorscheme('tokyodark')end},
    {
        'nvim-lualine/lualine.nvim', requires={'nvim-tree/nvim-web-devicons'},
        config=function()
            require('lualine').setup({
                options={theme='codedark'}
            })
        end
    }
}
