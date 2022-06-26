-- Vimars init.lua
-- Austin Bricker, 2017-2022

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
set.laststatus = 2
set.lazyredraw = true
set.mouse = "a"
set.number = true
set.shiftwidth = 4
set.showcmd = true
set.showmatch = true
set.showtabline = 2
set.showmode = false
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

vim.cmd([[
let g:lightline = {
\   'colorscheme': 'one',
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\                 [ 'time' ],
\                 [ 'readonly', 'filename', 'modified'] ],
\       'right': [ [ 'percent', 'lineinfo' ],
\                  [ 'gitbranch' ],
\                  [ 'fileformat', 'fileencoding', 'filetype' ] ],
\   },
\   'tabline': {
\       'left': [ [ 'buffers' ] ],
\       'right': [ [ 'sym' ] ]
\   },
\   'component_function': {
\       'gitbranch' : 'Current_git_branch',
\       'time' : 'Current_time',
\       'sym' : 'Hostname_symbol'
\   },
\   'component_expand': {
\       'buffers': 'lightline#bufferline#buffers'
\   },
\   'component_type': {
\       'buffers': 'tabsel'
\   }
\ }

function! Current_git_branch()
    let l:branch = split(fugitive#statusline(), '[()]')
    if len(l:branch) > 1
        return remove(l:branch, 1)
    endif
    return ""
endfunction

function! Current_time()
    return strftime("%a %d %b %Y %T %Z")
endfunction

function! Hostname_symbol()
    if !exists("g:HostnameSymbol")
        let hostname = hostname()
        if hostname is "mercury"
            let g:HostnameSymbol = "☿"
        elseif hostname is "venus"
            let g:HostnameSymbol = "♀"
        elseif hostname is "earth"
            let g:HostnameSymbol = "🜨"
        elseif hostname is "mars"
            let g:HostnameSymbol = "♂"
        elseif hostname is "jupiter"
            let g:HostnameSymbol = "♃"
        elseif hostname is "saturn"
            let g:HostnameSymbol = "♄"
        elseif hostname is "uranus"
            let g:HostnameSymbol = "⛢"
        elseif hostname is "neptune"
            let g:HostnameSymbol = "♆"
        elseif hostname is "pluto"
            let g:HostnameSymbol = "♇"
        else
            let g:HostnameSymbol = ""
        endif
    endif
    return g:HostnameSymbol
endfunction
]])
