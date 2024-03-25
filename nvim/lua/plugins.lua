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
	-- COLOR THEMES --
	"craftzdog/solarized-osaka.nvim",
	-- TODO: increase white text intensity of this colorscheme
	lazy = false,
	priority = 1000,
	opts = {},

	"rose-pine/neovim", name = "rose-pine",

	"catppuccin/nvim", name = "catppuccin", priority = 1000,

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
