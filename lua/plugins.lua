local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        -- 你的插件列表...
        --------------------- colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        -------------------------------------------------------
        -- nvim-tree (新增)
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline (新增)
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
        -- lualine (新增)
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- 快速查找
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- dashboard-nvim (新增)
        use({"glepnir/dashboard-nvim", requires = {"nvim-tree/nvim-web-devicons"}})
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter （新增）
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        --------------------- LSP --------------------
        -- use("williamboman/nvim-lsp-installer")
        -- Lspconfig
        use {
            "williamboman/mason.nvim",
                run = ":MasonUpdate", -- :MasonUpdate updates registry contents
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }
        use({ "neovim/nvim-lspconfig" })
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)


