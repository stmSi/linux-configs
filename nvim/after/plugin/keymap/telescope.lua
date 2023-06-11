local Remap = require("stm.keymap")
local nnoremap = Remap.nnoremap

-- golang
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', '<C-Space>', '<C-X><C-O>')


nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({
        search = vim.fn.input("Grep For > "),
        -- file_ignore_patterns = { "tools/.*" }
    })
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files({
        -- file_ignore_patterns = { "tools/.*" }
    })
end)

nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files({
        -- file_ignore_patterns = { "tools/.*" }
    })
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- TODO: Fix this immediately
nnoremap("<leader>vwh", function()
    require('telescope.builtin').help_tags()
end)

nnoremap("<leader>vrc", function()
    require('stm.telescope').search_dotfiles({ hidden = true })
end)
nnoremap("<leader>va", function()
    require('stm.telescope').anime_selector()
end)
nnoremap("<leader>vc", function()
    require('stm.telescope').chat_selector()
end)
nnoremap("<leader>gc", function()
    require('stm.telescope').git_branches()
end)
nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)
nnoremap("<leader>td", function()
    require('stm.telescope').dev()
end)

