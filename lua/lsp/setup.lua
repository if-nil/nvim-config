-- local lsp_installer = require("nvim-lsp-installer")
local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}



-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
}



-- 自动安装 Language Servers
for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- config file must implement on_setup method
    config.on_setup(lspconfig[name])
  else
    -- or else use default params
    lspconfig[name].setup({})
  end
end


