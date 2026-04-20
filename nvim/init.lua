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

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
--vim.keymap.set('n', '<C-j>', '<C-w>j')
--vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.pack.add({
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/uZer/pywal16.nvim',
    'https://github.com/vague-theme/vague.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/romgrk/barbar.nvim',
    'https://github.com/folke/flash.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
})

-- LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
})

vim.lsp.config('pyright', {
    capabilities = capabilities
})

vim.lsp.enable({'pyright','lua_ls'})
vim.diagnostic.config({
    -- Set to false if hover
    virtual_text = true
})

-- Hover diagnostic
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

--CMP
local cmp = require('cmp')

cmp.setup({
    completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i' }),
    }),

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
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
require('nvim-tree').setup()
vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')

--Telescope config
require('telescope')
vim.keymap.set('n', '<leader>i', function() require('telescope.builtin').find_files() end)

-- Tabs config
require('barbar').setup()
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<CR>')

-- Colorscheme config
require('vague').setup({
    italic = false
})
vim.cmd.colorscheme 'vague'

