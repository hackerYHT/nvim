-- https://github.com/neovim/nvim-lspconfig
-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require "user.lsp.lspsaga"
require "user.lsp.lsp-signature"

-- 指定代码片段存储路径，这个目录我们在第二章节的时候已经创建好了
vim.g.vsnip_snippet_dir = "~/.config/nvim/user/snippet/"

-- 诊断样式定制
vim.diagnostic.config(
    {
        -- 诊断的虚拟文本
        virtual_text = {
            -- 显示的前缀，可选项：'●', '▎', 'x'
            -- 默认是一个小方块，不是很好看，所以这里改了
            prefix = "●",
            -- 是否总是显示前缀？是的
            source = "always"
        },
        float = {
            -- 是否显示诊断来源？是的
            source = "always"
        },
        -- 在插入模式下是否显示诊断？不要
        update_in_insert = false
  }
)
