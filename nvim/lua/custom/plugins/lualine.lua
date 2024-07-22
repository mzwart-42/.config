return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    require("lualine").setup({
        -- ... other config
        options = {
            theme = "auto", -- "auto" will set the theme dynamically based on the colorscheme
        },
        -- ... other config
    })
  end,
}
--
--     return {
--       options = {
--         component_separators = { left = ' ', right = ' ' },
--         section_separators = { left = ' ', right = ' ' },
--         theme = 'auto',
--         globalstatus = true,
--         disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
--       },
--       sections = {
--         lualine_a = { { 'mode', icon = '' } },
--         lualine_b = { { 'branch', icon = '' } },
--         lualine_c = {
--           {
--             'diagnostics',
--             symbols = {
--               error = ' ',
--               warn = ' ',
--               info = ' ',
--               hint = '󰝶 ',
--             },
--           },
--           { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
--           { 'filename', padding = { left = 1, right = 0 } },
--           {
--             function()
--               local tab_count = vim.fn.tabpagenr '$'
--               if tab_count > 1 then
--                 return vim.fn.tabpagenr() .. ' of ' .. tab_count
--               end
--             end,
--             cond = function()
--               return vim.fn.tabpagenr '$' > 1
--             end,
--             icon = '󰓩',
--             color = utils.get_hlgroup('Special', nil),
--           },
--           {
--             function()
--               return require('nvim-navic').get_location()
--             end,
--             cond = function()
--               return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
--             end,
--             color = utils.get_hlgroup('Comment', nil),
--           },
--         },
--         lualine_x = {
--           {
--             require('lazy.status').updates,
--             cond = require('lazy.status').has_updates,
--             color = utils.get_hlgroup 'String',
--           },

--           { 'diff' },
--         },
--         lualine_y = {
--           {
--             'progress',
--           },
--           {
--             'location',
--             color = utils.get_hlgroup 'Boolean',
--           },
--         },
--         lualine_z = {
--           {
--             'datetime',
--             style = '  %X',
--           },
--         },
--       },
--
--       extensions = { 'lazy', 'toggleterm', 'mason', 'neo-tree', 'trouble' },
--     }
--   end,
-- }
