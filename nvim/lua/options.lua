-------------------- quickfix ----------------------
-- mnemonic for keymap: <leader> fix (what to fix)

vim.keymap.set('n', '<leader>fm', ':make<cr>', { remap = false })
vim.keymap.set('n', '<leader>fn', ':Norminette<cr><esc><C-W>k', { remap = false })

-- mnemonic for repeating fixes in other files?
-- repeat the last command in the Command-line history ' @: ', in the next or previous buffer
-- STILL NEEDS WORK!
-- vim.keymap.set('n', '<leader>fp', ':prev@:<cr>')
-- vim.keymap.set('n', '<leader>fn', ':next@:<cr>')

-- make command line always open with history, needs refining
--vim.keymap.set('c', '<esc>', '<esc>:q');
--vim.keymap.set('n', ':', 'q:i');
--vim.keymap.set('n', '/', 'q/i');

vim.keymap.set('n', '[q', ':cprev<cr>zz')
vim.keymap.set('n', ']q', ':cnext<cr>zz')
vim.keymap.set('n', '[b', ':bprev<cr>zz')
vim.keymap.set('n', ']b', ':bnext<cr>zz')

vim.keymap.set('n', '[Q', ':colder<cr>')
vim.keymap.set('n', ']Q', ':cnewer<cr>')

-- toggle quickfix window
local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win['quickfix'] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set('n', '<Leader>ft', toggle_quickfix, { desc = 'Toggle Quickfix Window' })
--------------------------------------------------------------------------------

-- NOTE:  simple options

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- soft wrapping at the edge of the window ????????
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

-------------------- clipboard ----------------------

-------------------- create new files ----------------------
-- By default new files created with :e are created in the root directory
-- which is the directory where vim was started in. This autocmd changes
-- the file path to be relative to the current buffer using the 'lcd' command
-- Remap :e to :e %:h/
vim.cmd [[command! E e %:h/]]

vim.keymap.set('n', '<leader>rf', '<Cmd>echo "current mode is: mode(1)"<cr>')
-------------------- autosave ----------------------

-- TODO: Dont autosave if a file is empty, or does not exist?

-- autosave
local function save()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_call(buf, function()
    vim.cmd 'silent! write'
  end)
end

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
