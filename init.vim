" ViMars init.vim
" Austin Bricker, 2021

" Import shared Vim/Neovim settings
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Bind floating terminal to key shortcut
nnoremap <silent><C-t> :ToggleTerm direction=float<CR>
tnoremap <silent><C-t> <C-\><C-N>:ToggleTerm direction=float<CR>

