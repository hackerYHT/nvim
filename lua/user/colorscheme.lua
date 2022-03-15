vim.g.transparent_background = true      -- 设置colorscheme背景为windows terminal背景
vim.cmd [[
try
  colorscheme lunar 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


