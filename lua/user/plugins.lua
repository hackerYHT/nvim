local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "akinsho/bufferline.nvim"  -- 酷炫顶部栏
  use "windwp/windline.nvim"  -- 酷炫状态栏
  use "kyazdani42/nvim-tree.lua"  -- 文件目录插件
  use "lukas-reineke/indent-blankline.nvim"  -- 自动换行空位制表符
  use "Pocco81/AutoSave.nvim"   -- 自动保存插件
  use "ethanholz/nvim-lastplace"  -- 退出重进后自动恢复光标位置
  use 'davidgranstrom/nvim-markdown-preview' -- markdown 预览插件
  use "akinsho/toggleterm.nvim" -- 内置终端

  -- LSP
  use "neovim/nvim-lspconfig" -- LSP 基础服务
  use "williamboman/nvim-lsp-installer" -- 自动安装 LSP
  use "tami5/lspsaga.nvim" -- LSP UI 美化-- LSP 基础服务
  use "ray-x/lsp_signature.nvim" -- LSP 插入模式下代码传参提示
  -- cmp plugins 代码补全核心插件
  -- 自动代码补全系列插件
  use {
      "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
      requires = {
          {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
          {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
          {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
          {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
          {"hrsh7th/cmp-path"}, -- 路径补全
          {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
          {"hrsh7th/cmp-cmdline"}, -- 命令补全
          {"f3fora/cmp-spell"}, -- 拼写建议
          {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
          {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
          {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
      }
    }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

 -- Telescope
  use "nvim-telescope/telescope.nvim"  -- 模糊查找插件(很厉害！必须装！)

  -- 代码注释
  use {
      "numToStr/Comment.nvim",
      requires = "JoosepAlviste/nvim-ts-context-commentstring"
    }
-- Debug
  -- 代码调试基础插件
  use "mfussenegger/nvim-dap"
  -- 为代码调试提供内联文本
use {
    "theHamsta/nvim-dap-virtual-text",
    requires = "mfussenegger/nvim-dap"
  }
  -- 为代码调试提供 UI 界面
use {
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap"
  }

  use "liuchengxu/vista.vim"  -- view tree 大纲预览

 -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)






