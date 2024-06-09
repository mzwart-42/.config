-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


--colorscheme is not lazy loaded :( increase boot up time
vim.cmd("colorscheme catppuccin")
