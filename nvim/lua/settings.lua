-- local M = {
--     theme = {
--       name = "cyberdream",
--       style = "dark",
--       transparent = true,
--     },
-- }
--
-- function M.activate_theme()
--     local theme = M.theme
--
--     -- local themes = require("theming.themes")
--     -- themes.activate_theme(theme.name, theme.style, theme.transparent)
-- end
--
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- soft wrapping at the edge of the window
vim.opt.linebreak = true
-- can be used to format all to 80 lines with gQ
vim.opt.textwidth = 80

-- make diffs always vertical split
vim.opt.diffopt = 'vertical'

-- make files search with :e not case sensitive
vim.opt.wildignorecase = true

-- because this don't work vim.opt.formatoptions:remove('o')
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove { 'o' }
  end,
})

-------------------- autosave ----------------------

-- TODO: Dont autosave if a file is empty, or does not exist?

-- autosave
local function save()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_call(buf, function()
    vim.cmd 'silent! write'
  end)
end

--TODO:     Need augroup ?
vim.api.nvim_create_augroup('AutoSave', {
  clear = true,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    save()
  end,
  pattern = '*',
  group = 'AutoSave',
})
