--vim.cmd.colorscheme 'habamax'
--vim.cmd.colorscheme 'murphy'
vim.cmd.colorscheme 'elflord'
--vim.cmd.colorscheme 'ron'
--vim.cmd.colorscheme 'vim'

vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 15

--Keymaps

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
