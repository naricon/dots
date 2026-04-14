vim.g.mapleader = " "

vim.opt.incsearch = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--vim.keymap.set('n', '<C-h>', '<C-w>h')
--vim.keymap.set('n', '<C-l>', '<C-w>l')
--vim.keymap.set('n', '<C-j>', '<C-w>j')
--vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.pack.add({
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/uZer/pywal16.nvim',
    'https://github.com/vague-theme/vague.nvim',
--    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/romgrk/barbar.nvim',
    'https://github.com/folke/flash.nvim',
})

-- Flash config
require('flash').setup() 
vim.keymap.set({'n','x','o'}, '<leader>f', function() require('flash').jump() end)

-- Color highlight config
vim.opt.termguicolors = true
require('colorizer').setup({ "*" },{
	RGB = true,
	RRGGBB = true,
	names = false,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
})

-- Nvim tree config
--require('nvim-tree').setup()
--vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')

--Telescope config
require('telescope')
vim.keymap.set('n', '<leader>o', function() require('telescope.builtin').find_files() end)

-- Tabs config
require('barbar').setup()
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>')

vim.cmd.colorscheme 'vague'

