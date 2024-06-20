-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- COLOR STUFF 
function color_stuff(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

-- See the kickstart.nvim README for more information
return {
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
}
