-- https://github.com/ethanholz/nvim-lastplace
-- Setup nvim-cmp.
local status_ok, lastplace = pcall(require, "nvim-lastplace")
if not status_ok then
  return
end

lastplace.setup { 
  -- 那些 buffer 类型不记录光标位置
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  -- 那些文件类型不记录光标位置
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
}

