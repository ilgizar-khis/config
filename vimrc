call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
call plug#end()

function! CheckBackspace() abort
	let col = col(".") - 1
	return !col || getline(".")[col - 1] =~# "\s"
endfunction

inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pumprev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

colorscheme retrobox
set number relativenumber
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set signcolumn=yes

