-- future project: rewrite in lua

-- install plug-vim
--vim.cmd ([[
--if ! filereadable('~\AppData\Local\nvim\autoload\plug.vim')
--    echo "Downloading junegunn/vim-plug to manage plugins..."
--    silent !mkdir -p ~/AppData/Local/nvim/autoload
--    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/AppData/Local/nvim/autoload/plug.vim
--    autocmd VimEnter * PlugInstall
--endif
--]])

-- plugins
vim.cmd ([[
    call plug#begin('~\AppData\Local\nvim\plugged')
    Plug 'ap/vim-css-color'
    Plug 'lunarvim/synthwave84.nvim'
    Plug 'm4xshen/autoclose.nvim'
    Plug 'mbbill/undotree'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vimwiki/vimwiki'
    call plug#end()
]])

-- other plugins not actively used
--Plug 'rose-pine/neovim'
--Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

---------------------------------------------------

-- future project: rewrite the following in lua
-- autocmd functions are easy -- I already know the syntax
-- nvim_create_autocmd({event}, {*opts})

-- perform dot commands over visual blocks:
vim.cmd ([[
    vnoremap . :normal .<CR>
]])

-- Ensure files are read as what I want:
vim.cmd ([[
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    map <leader>v :VimwikiIndex<CR>
    let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
]])

-- function for automatically deleting all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.cmd ([[
    autocmd BufWritePre * let currPos = getpos(".")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
    autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
    autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]])

-- function for toggling the bottom status bar:
vim.cmd ([[
    let s:hidden_all = 0
    function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
    endfunction
    nnoremap <leader>h :call ToggleHiddenAll()<CR>
]])
