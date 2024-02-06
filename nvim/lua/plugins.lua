-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"craftzdog/solarized-osaka.nvim",
	"rose-pine/neovim", name = "rose-pine",
	-- increase white text intensity of this colorscheme
	lazy = false,
	priority = 1000,
	opts = {},

	"smoka7/hop.nvim",
	version = "*",
	opts = {},

	--[LSP SERVERs]
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
}
opts = {}

require("lazy").setup(plugins, opts)

-- OTHER STUFF
vim.opt.title = true
