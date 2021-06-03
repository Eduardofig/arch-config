"Sets
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set noshowmode
set mouse=a
set clipboard=unnamedplus

"Lets
let mapleader=" "
let g:airline_theme = 'nord_minimal'
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

"Fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Imaps
imap <C-f> <Plug>(coc-snippets-expand)
imap <C-l> <Esc>viw~ea
imap <C-o> <Esc>A;<CR>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

"Nmaps
nmap <leader>; A;<Esc>
nmap <leader>rr :source ~/.config/nvim/init.vim<CR>
nmap <leader>t :tabnew <CR>
nmap <leader> gd <Plug>(coc-definition)
nmap <leader> gy <Plug>(coc-type-definition)
nmap <leader> gi <Plug>(coc-implementation)
nmap <leader> gr <Plug>(coc-references) 
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>T <Plug>(coc-terminal-toggle)
nmap <CR> o<Esc>
nmap J gt
nmap K gT
nmap <leader>gd :call CocAction('jumpDefinition', 'split')<CR>
nmap <leader>gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>ff :Files<CR>
nmap <leader>fr :Rg<CR>
nmap <leader>fb :BLines<CR>
nmap <leader>fa :Ag<CR>
nmap <leader>fi :History:<CR>
nmap <leader>fl :Lines<CR>
nnoremap <leader>do :call CocAction('doHover')<CR>
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>

"Maps
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

"Plugins
call plug#begin('~/.vim/plugged')
"Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/seoul256.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()

"Appearance
colorscheme nord
highlight Normal guibg=none
hi CocErrorSign ctermfg=160
hi CocErrorHighlight ctermfg=160 cterm=underline
hi CocWarningHighlight ctermfg=Brown cterm=underline
hi CocInfoSign ctermfg=Brown
hi CocInfoHighlight ctermfg=Brown cterm=underline
highlight clear SignColumn
highlight clear TabLineFill
highlight clear VertSplit
highlight clear Tabline

"Coc
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-python',
      \'coc-json',
      \'coc-clangd',
      \'coc-terminal',
      \'coc-snippets',
      \'coc-explorer'
      \]

