return {
  -- cyberdream
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = { purple = '#bde5ff', bg = '#bde5ff' },
    },
  },
  -- catppuccin
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- Status bar (configuration!!!)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end,
  },
}
