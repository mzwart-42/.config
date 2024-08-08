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

local autocmd = vim.api.nvim_create_autocmd

-- because this don't work vim.opt.formatoptions:remove('o')
autocmd({ 'FileType' }, {
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

autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    save()
  end,
  pattern = '*',
  group = 'AutoSave',
})

-- local function numbertoggle()
--   -- Create an autocommand group named 'numbertoggle', clearing any existing autocommands in the group
--   local group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
--
--   -- Define the autocommands
--   local buf_enter_focus_gained_insert_leave_win_enter = {
--     callback = function()
--       if vim.o.number == 1 and vim.fn.mode() ~= "i" then
--         vim.cmd("set rnu")
--       end
--     end,
--   }
--
--   local buf_leave_focus_lost_insert_enter_win_leave = {
--     callback = function()
--       if vim.o.number == 1 then
--         vim.cmd("set nornu")
--       end
--     end,
--   }
--
--   -- Add the defined autocommands to the group
--   autocmd({'BufEnter','FocusGained','InsertLeave','WinEnter' },buf_enter_focus_gained_insert_leave_win_enter)
--   autocmd( {'BufLeave','FocusLost','InsertEnter','WinLeave' }, buf_leave_focus_lost_insert_enter_win_leave)
-- end

-- Call the numbertoggle function to apply the configuration
-- numbertoggle()

