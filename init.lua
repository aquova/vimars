-- Vimars init.lua
-- Austin Bricker, 2017-2022

require("toggleterm").setup{
    direction = 'float'
}

require("lualine").setup{
    options = {
        icons_enabled = true,
        theme = 'onedark',
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'diff'},
        lualine_x = {'progress', 'location'},
        lualine_y = {'fileformat', 'encoding'},
        lualine_z = {'filetype', 'filename'},
    },
    tabline = {},
    extensions = {},
}

local set = vim.opt
set.background = "dark"
set.backspace = "2"
set.breakindent = true
set.cursorline = true
set.conceallevel = 0
set.diffopt = "vertical"
set.encoding = "utf-8"
set.expandtab = true
set.foldlevel = 99
set.foldmethod = "indent"
set.hidden = true
set.hlsearch = true
set.incsearch = true
set.lazyredraw = true
set.mouse = "a"
set.number = true
set.shiftwidth = 4
set.showcmd = true
set.showmatch = true
set.splitbelow = true
set.splitright = true
set.softtabstop = 4
set.startofline = false
set.tabstop = 4
set.timeout = false
set.wildmenu = true

vim.g.mapleader = ","

vim.cmd([[
syntax enable
colorscheme onedark
filetype indent on
]])

function map(mode, shortcut, cmd)
    vim.api.nvim_set_keymap(mode, shortcut, cmd, { noremap = true, silent = true })
end

function nnomap(shortcut, cmd)
    map('n', shortcut, cmd)
end

function inomap(shortcut, cmd)
    map('i', shortcut, cmd)
end

function vnomap(shortcut, cmd)
    map('v', shortcut, cmd)
end

function tnomap(shortcut, cmd)
    map('t', shortcut, cmd)
end

nnomap("<space>", "za")
nnomap("j", "gj")
nnomap("k", "gk")

nnomap("B", "^")
vnomap("B", "^")
nnomap("E", "$")
vnomap("E", "$")

nnomap("J", ":bp<CR>")
nnomap("K", ":bn<CR>")
nnomap("gJ", "J<CR>")
inomap("jk", "<esc>")

nnomap("L", "L<bar>zz<CR>")
vnomap("L", "L<bar>zz<CR>")
nnomap("H", "H<bar>zz<CR>")
vnomap("H", "H<bar>zz<CR>")

nnomap("<leader><space>", ":noh<CR>")

nnomap("<tab>", "%")
vnomap("<tab>", "%")

nnomap("Y", "y$")
vnomap("Y", "y$")

nnomap("<leader>g", ":SignifyHunkUndo<CR>")

nnomap("<C-t>", ":ToggleTerm<CR>")
tnomap("<C-t>", "<C-\\><C-N>:ToggleTerm<CR>")

nnomap("[a", ":ALEPrevious<CR>")
nnomap("]a", ":ALENext<CR>")

vim.g.fzf_layout = "{ 'down': '~40%' }"
vim.g.signify_sign_delete = '-'
vim.g.closetag_filetypes = 'html, xhtml, phtml, php'

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
