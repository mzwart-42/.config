-- NOTE: find keymap collisions with :checkhealth which-key

-------------------- quickfix ----------------------
-- mnemonic for keymap: <leader> fix (what to fix)

vim.keymap.set('n', '<leader>qm', ':make<cr>', { remap = false })
vim.keymap.set('n', '<leader>qn', ':Norminette<cr><esc><C-W>k', { remap = false })

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

-------------------- clipboard ----------------------

-- C-S-V = copy to clipboard
-- C-S-V = paste from clipboard

-------------------- create new files ----------------------
-- By default new files created with :e are created in the root directory
-- which is the directory where vim was started in. This autocmd changes
-- the file path to be relative to the current buffer using the 'lcd' command
-- Remap :e to :e %:h/
vim.cmd [[command! E e %:h/]]

-- TODO: make this work for all cmd-line commands

-- example of <cmd>, a way to execute a command from normal fode
vim.keymap.set('n', '<leader>rf', '<Cmd>echo "current mode is  mode(1)"<cr>')

-- spell checking in MARKDOWN FILES?
vim.cmd 'au BufRead,BufNewFile *.md setlocal spell textwidth=80'

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
