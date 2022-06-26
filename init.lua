-- Vimars init.lua
-- Austin Bricker, 2017-2022

vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
]])

vim.cmd([[
set background=dark
colorscheme onedark
syntax enable           
set encoding=utf-8

set tabstop=4           
set softtabstop=4       
set shiftwidth=4        
set expandtab           
set breakindent         

set number              
set showcmd             

set cursorline          
filetype indent on      

set wildmenu            
set lazyredraw          

set showmatch           

set incsearch           
set hlsearch            

set hidden              
set nostartofline       

set mouse=a             
set backspace=2         
set conceallevel=0      
set notimeout           

set splitright          
set splitbelow          

set guioptions=         

set diffopt=vertical    

set foldmethod=indent   
set foldlevel=99

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

nnoremap <space> za

nnoremap j gj
nnoremap k gk

nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

nnoremap J :bp<CR>
nnoremap K :bn<CR>

nnoremap gJ J <CR>

inoremap jk <esc>

let mapleader=","

nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap L L<bar>zz <CR>
vnoremap L L<bar>zz <CR>
nnoremap H H<bar>zz <CR>
vnoremap H H<bar>zz <CR>

nnoremap <leader><space> :noh<CR>

nnoremap <tab> %
vnoremap <tab> %

nnoremap Y y$
vnoremap Y y$

command! Bd bp|bd #

fun! RemoveWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call RemoveWhitespace()

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
else
    let &t_SI = "\e[6 q" 
    let &t_EI = "\e[1 q" 
    let &t_SR = "\e[4 q" 
endif

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

set laststatus=2        
set showtabline=2       
set noshowmode          
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

let g:indentLine_setConceal = 0

let g:fzf_layout = { 'down': '~40%' }

let g:signify_sign_delete = '-'
nnoremap <leader>g :SignifyHunkUndo<CR>

let g:closetag_filetypes = 'html, xhtml, phtml, php'

nnoremap [a :ALEPrevious<CR>
nnoremap ]a :ALENext<CR>

autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType vim setlocal commentstring=\--\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType htmldjango setlocal commentstring=<!--\ %s\ -->
autocmd FileType pico8 setlocal commentstring=--\ %s
autocmd FileType lua setlocal commentstring=--\ %s
autocmd FileType arduino setlocal commentstring=//\ %s
autocmd FileType make setlocal commentstring=#\ %s
autocmd FileType coffee setlocal commentstring=#\ %s
autocmd FileType asm setlocal commentstring=;\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType applescript setlocal commentstring=--\ %s
autocmd FileType rust setlocal commentstring=//\ %s
autocmd FileType nim setlocal commentstring=#\ %s

autocmd BufNewFile,BufRead *.p8 set syntax=lua
autocmd BufNewFile,BufRead *.tic set syntax=lua
autocmd BufNewFile,BufRead *.command set syntax=sh
autocmd BufNewFile,BufRead *.cr set syntax=ruby

autocmd FileType nim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType pico8 setlocal shiftwidth=1 tabstop=1 softtabstop=1
autocmd FileType make setlocal noexpandtab

autocmd FileType dockerfile let g:indentLine_enabled=0
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType json let g:indentLine_enabled=0
]])
