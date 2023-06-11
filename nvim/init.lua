require('stm')
vim.cmd [[packadd termdebug]]
vim.cmd('autocmd FileType javascript,vue setlocal shiftwidth=2 softtabstop=2 expandtab')
vim.cmd('autocmd FileType javascript,vue setlocal expandtab')
vim.cmd('autocmd FileType javascript,jsx,vue nnoremap <leader>f :Prettier<CR>')
vim.cmd('autocmd FileType c,cpp nnoremap <leader>f :w<CR> :%!clang-format<CR>')
vim.cmd('autocmd FileType rust nnoremap <leader>f :w<CR> :!cargo fmt<CR>')
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.api.nvim_set_keymap('n', '<leader>b', 'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rnw', ':CocCommand document.renameCurrentWord<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rnf', ':CocCommand workspace.renameCurrentFile<CR>', { silent = true })

-- Define the highlight groups
vim.cmd([[
  hi StatusLine ctermfg=Cyan ctermbg=Grey gui=bold
  hi StatusLineNC ctermfg=Cyan ctermbg=Grey
]])
-- Set the status line with color, brightness, and boldness
vim.o.statusline = [[ - %#StatusLine#%<%f %h%m%r%=%-14.(%l,%c%V%)\ %P%#StatusLineNC#]]

-- vim.o.statusline = [[ - %<%f %h%m%r%=%-14.(%l,%c%V%)\ %P]]
vim.g.termdebugger = "rust-gdb"
-- export PATH=$PATH:/home/stm/go/bin

-- Define function to switch to buffer tab by index
function switch_to_buffer_tab(index)
    vim.cmd('tabnext ' .. index)
end
-- Set up keybindings for "Alt" + number keys
for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<M-' .. i .. '>', '<cmd>lua switch_to_buffer_tab(' .. i .. ')<CR>', { noremap = true, silent = true })
end


-- Define function to create a new buffer tab
function create_buffer_tab()
    vim.cmd('tabnew')
end
-- Set up keybinding to create a new buffer tab
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua create_buffer_tab()<CR>', { noremap = true, silent = true })

-- Copy The whole file buffer to system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', ':%y+<CR>', {noremap = true, silent = true})

-- Create a Lua function to format PHP files
function format_php()
  local fixer = "php-cs-fixer"
  local file = vim.fn.expand("%:p")
  local command = fixer .. " fix " .. file
  vim.cmd("! " .. command)
  print(fixer .. " has been run on the current file.")
end

-- Create a command to call the format_php function
vim.cmd("command! FormatPHP lua format_php()")

_G.php_formatter = {
    format_php = format_php
}
-- Map F5 to the FormatPHP command for PHP files
vim.api.nvim_exec([[
  autocmd FileType php nnoremap <buffer> <silent> <F5> :FormatPHP<CR>
]], false)

-- indent 2-space for tsx
vim.api.nvim_exec([[
  augroup tsx_settings
    autocmd!
    autocmd FileType typescript.tsx,typescript setlocal shiftwidth=2 tabstop=2 expandtab
  augroup END
]], false)


local function setup_harpoon_keybinds()
    local opts = { noremap = true, silent = true }

    -- UI Toggle
    vim.api.nvim_set_keymap('n', '<Leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

    -- Mark the current file
    vim.api.nvim_set_keymap('n', '<Leader>hm', ':lua require("harpoon.mark").add_file()<CR>', opts)

    -- Unmark the current file
    vim.api.nvim_set_keymap('n', '<Leader>hu', ':lua require("harpoon.mark").rm_file()<CR>', opts)

    -- Navigate to the marked files
    -- You can change the numbers to adjust the navigation keys
    for i = 1, 5 do
        vim.api.nvim_set_keymap('n', '<Leader>h' .. i, ':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>', opts)
    end
end
setup_harpoon_keybinds()
-- 
