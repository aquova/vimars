-- Vimars init.lua
-- Austin Bricker, 2017-2023

require("dapui").setup()
require("diffview").setup()
require("gitsigns").setup()
require("hop").setup()
require("nvim-tree").setup()

require("bufferline").setup{
    auto_hide = true,
    insert_at_end = true,
}

local dap = require("dap")
dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
    options = {
        source_filetype = "python",
    },
}
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = "/usr/bin/python"
    },
}

require("lualine").setup{
    options = {
        icons_enabled = true,
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

local lsp = require("lsp-zero").preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})
lsp.setup()

require("marks").setup{
    builtin_marks = { ".", "<", ">", "^", "'" }
}

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require("toggleterm").setup{
    direction = 'float'
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
nnomap("gK", "K<CR>")
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

nnomap("[<space>", "O<esc>j")
nnomap("]<space>", "o<esc>k")

nnomap("<leader>b", ":Gitsigns toggle_current_line_blame<CR>")
nnomap("<leader>g", ":Gitsigns reset_hunk<CR>")

nnomap("]c", ":Gitsigns next_hunk<CR>")
nnomap("[c", ":Gitsigns prev_hunk<CR>")

nnomap("<C-t>", ":ToggleTerm<CR>")
tnomap("<C-t>", "<C-\\><C-N>:ToggleTerm<CR>")

nnomap("<leader>t", ":NvimTreeToggle<CR>")

nnomap("<C-f>",     ":Telescope live_grep<CR>")
nnomap("<C-p>",     ":Telescope find_files<CR>")
nnomap("<leader>d", ":lua DiffviewToggle()<CR>")
nnomap("<leader>z", ":Telescope spell_suggest<CR>")
nnomap("<leader>m", ":Telescope man_pages<CR>")
nnomap("<leader>x", ":lua require('dapui').toggle()<CR>")
nnomap("<leader>p", ":lua require('dap').toggle_breakpoint()<CR>")

nnomap("<leader><leader>w", ":HopWordAC<CR>")
nnomap("<leader><leader>b", ":HopWordBC<CR>")
nnomap("<leader><leader>e", ":lua HopEndWord()<CR>")
nnomap("<leader><leader>f", ":HopChar1<CR>")
nnomap("<leader><leader>j", ":HopLineStartAC<CR>")
nnomap("<leader><leader>k", ":HopLineStartBC<CR>")
nnomap("<leader><leader>/", ":HopPattern<CR>")

vim.g.closetag_filetypes = 'html, xhtml, phtml, php'

-- Strip trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- TODO: Figure out if this can be done with just Lua
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua require'vim.highlight'.on_yank({hlgroup="IncSearch", timeout=1000})
augroup END
]])

-- Custom function to add toggle functionality to diffview.nvim
local last_tabpage = vim.api.nvim_get_current_tabpage()
function DiffviewToggle()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()
    if view then
        vim.cmd(":DiffviewClose")
    else
        vim.cmd(":DiffviewOpen")
    end
end

-- Custom function to allow jumping to ends of words
function HopEndWord()
    local hop = require("hop")
    local hint = require("hop.hint")
    hop.hint_words({direction = hint.HintDirection.AFTER_CURSOR, hint_position = hint.HintPosition.END})
end

-- Set vim-commentary values
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "nim" },
    command = "setlocal commentstring=#\\ %s"
})
