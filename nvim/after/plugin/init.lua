print("huh")
require('nvim_comment').setup()
require('lualine').setup{
  options = {
    theme = 'tokyonight'
  }
}
-- g['deoplete#enable_at_startup'] = 1
vim.cmd('highlight GitGutterAdd    guifg=#00ff00 guibg=NONE')
vim.cmd('highlight GitGutterChange guifg=#ffff00 guibg=NONE')
vim.cmd('highlight GitGutterDelete guifg=#ff0000 guibg=NONE')
vim.cmd('highlight GitGutterChangeDelete guifg=#ffa500 guibg=NONE')
