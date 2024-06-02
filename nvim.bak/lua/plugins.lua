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

	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	-- stylua: ignore
	keys = {
	{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},

	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	--[LSP SERVERs]
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
}
opts = {}

require("lazy").setup(plugins, opts)
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.6,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- OTHER STUFF
vim.opt.title = true

-- LUA LINE
require('lualine').setup {
	options = { theme = 'catppuccin' }
}