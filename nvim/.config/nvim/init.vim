" General settings
syntax on
filetype plugin indent on

" Colors
    colorscheme slate
    set background=dark
    
" Environment
    set mouse=a
    set nu
    set relativenumber
    set path+=**
    set noerrorbells
    set autoread
    set spelllang=en_us
    set wildmenu
    set encoding=UTF-8
    set backspace=indent,eol,start  " Make sure backspace works
    set nowrap
    set noswapfile
    set nobackup
    set undodir=~/.cache/vim/undo
    set undofile
    set incsearch
    set noruler
    set confirm
    set smartindent
    set ic
    set fdm=syntax                  " Folding on Syntax

    set colorcolumn=80

    " Popup Menu Theme
    highlight Pmenu ctermbg=black ctermfg=yellow
    highlight PmenuSel ctermbg=yellow ctermfg=black
    highlight PmenuSbar ctermbg=yellow ctermfg=white
    highlight PmenuThumb ctermbg=black ctermfg=white

    " Tabs
        set tabstop=4
        set expandtab
        set shiftwidth=4
        set softtabstop=4

    " Highlighting
        set showmatch
        set hlsearch is
        
        highlight ColorColumn ctermbg=8
        " highlight ColorColumn ctermbg=red
        nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

    " Global Keybindings
        nnoremap H 0
        nnoremap L $
        nnoremap J G
        nnoremap K gg
        map <C-s> :w<CR>:source ~/.config/nvim/init.vim<CR>
        tnoremap <Esc> <C-\><C-n>

    " Status-Line
        set statusline=             " Initialize Status Line
        set statusline+=\ %M        " Modified Flag
        set statusline+=\ %y        " Type of File
        set statusline+=\ %r        " Read Only Flag [RO]
        set statusline+=\ %F        " Full Path to file
        set statusline+=%=          " Right side settings
        set statusline+=\ %c:%l/%L  " Column, Line, Total Lines
        set statusline+=\ [%n]      " Buffer Number

" Plugins
call plug#begin('~/.local/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:ctrlp_use_caching = 0

" COC Syntax highlighting for JSON Config File
" autocmd FileType json syntax match Comment +\/\/.\+$+

" Python Configurations
autocmd FileType python source $XDG_CONFIG_HOME/nvim/python.vim
autocmd FileType markdown set spell

" Yaml Configurations
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Netrw Configurations
    " File Explorer
    let g:netrw_banner=0        " disable annoying banner
    let g:netrw_browse_split=2  " open in prior window
    let g:netrw_winsize = 25
    let g:netrw_altv=1          " open splits to the right
    let g:netrw_liststyle=3     " tree view
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
    " :edit "a folder"
    " h = horizontal split
    " v = vertial split
    " t = tab

" Misc
    " Return to the same line you left off at
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \       execute 'normal! g`"zvzz' |
            \ endif
    augroup END

" Remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<cr>
nnoremap <silent> <leader>- :vertical resize -5<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fp <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Neovim LSP Custom Settings
lua  require('lua_config')
let g:completion_enable_fuzzy_match = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
source $XDG_CONFIG_HOME/nvim/diagnostics.vim
