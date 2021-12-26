" ViMars vimrc
" Austin Bricker, 2017-2021

set background=dark
" Neovim doesn't support 'term' and will throw an error
if !has('nvim')
    set term=screen-256color
endif
colorscheme onedark

""" Vim settings """
syntax enable           " Turn on syntax highlighting
set encoding=utf-8

set tabstop=4           " Num of spaces in tab
set softtabstop=4       " Num of spaces in tab when editing
set shiftwidth=4        " Indenting with '>'
set expandtab           " Tabs are spaces
set breakindent         " Word wrap indents to prior indent spot

set number              " Shows line numbers
set showcmd             " Shows most recent command

set cursorline          " Highlights current line
filetype indent on      " Load filetype-specific indent files

set wildmenu            " Visual autocomplete for command menu
set lazyredraw          " Only redraw when needed

set showmatch           " Highlight matching [{()}]

set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

set hidden              " Allows switching buffers without saving
set nostartofline       " Keeps cursor in same column when switching buffers

set mouse=a             " Enables the mouse in terminal Vim
set backspace=2         " Makes backspace behave as expected
set conceallevel=0      " All text is shown
set notimeout           " Removes timeout on leader key

set splitright          " Opens new vertical splits on the right
set splitbelow          " Opens new horizontal splits below

set guioptions=         " Removes all scrollbars

set diffopt=vertical    " Open Vimdiff operations in vertical windows

set foldmethod=indent   " Enable folding
set foldlevel=99

" Disable error beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

""" Custom keybindings """
" Toggle folding with space
nnoremap <space> za

" Moves vertically by visual line, not literal
nnoremap j gj
nnoremap k gk

" Remaps beginning/end of line
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

" J/K changes tabs
nnoremap J :bp<CR>
nnoremap K :bn<CR>

" Now remap gJ to the old J function
nnoremap gJ J <CR>

" jk is escape
inoremap jk <esc>

" Set leader to ,
let mapleader=","

" Loads vimrc bindings
nnoremap <leader>sv :source $MYVIMRC<CR>

" Center text after jumping to beginning/end of window
nnoremap L L<bar>zz <CR>
vnoremap L L<bar>zz <CR>
nnoremap H H<bar>zz <CR>
vnoremap H H<bar>zz <CR>

" Center text after jumping to functions
nnoremap [[ [[<bar>zz <CR>
nnoremap ]] ]]<bar>zz <CR>
nnoremap [] []<bar>zz <CR>
nnoremap ][ ][<bar>zz <CR>
vnoremap [[ [[<bar>zz <CR>
vnoremap ]] ]]<bar>zz <CR>
vnoremap [] []<bar>zz <CR>
vnoremap ][ ][<bar>zz <CR>

" Replace typing :noh
nnoremap <leader><space> :noh<CR>

" % is annoying
nnoremap <tab> %
vnoremap <tab> %

" Set Y to be the same as y$
nnoremap Y y$
vnoremap Y y$

" Modified version of bd that doesn't delete window splits
command! Bd bp|bd #

""" Custom functions """
" Create function that removes trailing whitespace
fun! RemoveWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Can remove whitespace by calling ':RemoveWhitespace'
command! RemoveWhitespace call RemoveWhitespace

" Can call RemoveWhitespace with Leader-w
:noremap <Leader>w :call RemoveWhitespace()<CR>

" Calls RemoveWhitespace when buffer is written
autocmd BufWritePre * :call RemoveWhitespace()

""" Cosmetics """
" Change cursor type in different modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
else
    let &t_SI = "\e[6 q" " Insert mode
    let &t_EI = "\e[1 q" " Normal mode
    let &t_SR = "\e[4 q" " Replace mode
endif

" Optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

""" Vim plugin configs """
" Lightline
set laststatus=2        " Allows status bar to be displayed
set showtabline=2       " Allows tab bar to be displayed
set noshowmode          " Don't display default mode info
" General config
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
\       'right': [ [ ] ]
\   },
\   'component_function': {
\       'gitbranch' : 'Current_git_branch',
\       'time' : 'Current_time'
\   },
\   'component_expand': {
\       'buffers': 'lightline#bufferline#buffers'
\   },
\   'component_type': {
\       'buffers': 'tabsel'
\   }
\ }

" Function to format git branch name
function! Current_git_branch()
    let l:branch = split(fugitive#statusline(), '[()]')
    if len(l:branch) > 1
        return remove(l:branch, 1)
    endif
    return ""
endfunction

" Function to format current time as DOW DD MM YYYY HH:MM:SS PM TZ
function! Current_time()
    return strftime("%c")
endfunction

" Open fzf info in split rather than floating window
let g:fzf_layout = { 'down': '~40%' }

" Commenting codes for commentary.vim:
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType vim setlocal commentstring=\"\ %s
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

" Set syntax highlighting for unknown file extension
autocmd BufNewFile,BufRead *.p8 set syntax=lua
autocmd BufNewFile,BufRead *.tic set syntax=lua
autocmd BufNewFile,BufRead *.command set syntax=sh
autocmd BufNewFile,BufRead *.cr set syntax=ruby

" Different tab behavior for different filetype
autocmd FileType nim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType pico8 setlocal shiftwidth=1 tabstop=1 softtabstop=1
autocmd FileType make setlocal noexpandtab

" Turn off indentLine for markdown and json as it overrides conceallevel
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType json let g:indentLine_enabled=0
