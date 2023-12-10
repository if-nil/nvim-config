-- neovim 配置文件
--
-- 基础配置
require('basic')
-- 快捷键绑定
require('keybindings')
-- Packer 插件管理
require("plugins")
-- 主题设置 （新增）
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
-- tap 设置
require("plugin-config.bufferline")

require("plugin-config.lualine")

require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")

-- 内置LSP
require("lsp.setup")

