require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"clangd", "lua_ls"},
}

-- LSP SETUP
--  GET GENERATE A COMPILE_COMMANDS FILE TO HIGHTLIGHT/DIM UNUSED VARS
require('lspconfig').clangd.setup {
    -- on_attach = keybinds.on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        -- "--compile-commands-dir=/home/localuser/test/build",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- DISABLE SEMANTIC HIGHLIGHTING
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
 vim.api.nvim_set_hl(0, group, {})
end

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").clangd.setup {}
require("lspconfig").lua_ls.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
	vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--NEODIM
--
vim.diagnostic.config({
	update_in_insert = true -- live dim updates as you type
})

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
