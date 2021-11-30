" ViMars ginit.vim
" Austin Bricker, 2021
" Configuration file for GUI Vim-based programs, like Neovim

set mouse=a

if exists(':GuiTabline')
	GuiTabline 0
endif

if exists(':GuiPopupmenu')
	GuiPopupmenu 0
endif

if exists (':GuiScrollBar')
	GuiScrollBar 1
endif

if exists (':GuiTreeviewToggle')
    nnoremap <leader>t :GuiTreeviewToggle<CR>
endif

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
