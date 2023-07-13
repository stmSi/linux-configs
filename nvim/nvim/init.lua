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
vim.api.nvim_set_option('ttimeoutlen', 10)
vim.api.nvim_set_keymap('n', '<leader>b', 'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rnw', ':CocCommand document.renameCurrentWord<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rnf', ':CocCommand workspace.renameCurrentFile<CR>', { silent = true })

-- Swap Lines Up/Down with Alt + j/k (normal, insert, visual modes)
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-Up>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-Down>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})

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
local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

vim.api.nvim_exec([[
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[2 q"
]], false)

-- Change the Cursor according to the mode
vim.api.nvim_set_option('guicursor', 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175')
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC>l', {noremap = true})

-- These autocommands give the effect of changing the cursor 
-- when you switch between normal mode and insert mode.
--
vim.api.nvim_exec([[
    augroup MyCursorLine
        autocmd!
        autocmd InsertEnter * silent! lua vim.api.nvim_win_set_option(0, 'cursorline', true)
        autocmd InsertLeave * silent! lua vim.api.nvim_win_set_option(0, 'cursorline', false)
    augroup END
]], false)
-- 
