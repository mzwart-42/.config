return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>p',
      mode = { 'n', 'v' },
      function()
        require('spectre').toggle()
      end,
      { desc = 'Toggle Spectre' },
    },
    --{'<leader>r', mode = { 'n', 'v' }, function() require("spectre").open_visual({select_word=true}) end, { desc = "Toggle Spectre" } },
  },
}
