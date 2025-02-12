-- LazyVim global options
vim.g.lazyvim_python_lsp = "basedpyright" -- switch to `basedpyright`
vim.g.lazyvim_eslint_auto_format = false -- disable eslint autoformat
vim.g.lazyvim_picker = "fzf" -- try using fzf-lua
vim.g.lazyvim_cmp = "blink.cmp" -- completion engine
vim.g.lazyvim_blink_main = false -- try not using main branch

-- user's options
local opt = vim.opt

opt.conceallevel = 1 -- hide * markup for bold and italic
opt.encoding = "utf-8" -- encoding for buffer
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.showcmd = false -- don't show cmd
opt.swapfile = false -- do not use swapfile
opt.foldenable = false -- disable fold on startup

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
