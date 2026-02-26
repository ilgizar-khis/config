call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'manasthakur/vim-commentor'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
call plug#end()

function! CheckBackspace() abort
	let col = col(".") - 1
	return !col || getline(".")[col - 1] =~# "\s"
endfunction

inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

colorscheme retrobox
set number relativenumber
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set signcolumn=yes
set mouse=a
set scrolloff=4

set laststatus=2
set statusline=
set statusline+=%{expand('%:h')}/%{expand('%:F')}\ 
set statusline+=%m\ 
set statusline+=%{FugitiveHead()}
set statusline+=%=
set statusline+=%{&filetype}\ 
set statusline+=lin:%l/%L\ 
set statusline+=col:%c\ 
set statusline+=%p%%
set nowrap
set showtabline=2

function! MyTabLine()
  let s = ''
  " Loop through each tab page
  for i in range(1, tabpagenr('$'))
    " Select highlighting (TabLineSel for current, TabLine for others)
    if i == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " Set the tab page number for mouse clicks
    let s .= '%' . i . 'T'

    " Add tab number
    let s .= ' ' . i . ' '

    " Get buffer name in current window of the tab
    let buflist = tabpagebuflist(i)
    let bufnr = buflist[tabpagewinnr(i) - 1]
    let file = bufname(bufnr)

    " Customize the file display (e.g., shorten path, handle special buffers)
    if file == ''
      let file = '[No Name]'
    else
      let file = fnamemodify(file, ':t') " Show only the filename
    endif

    " Add modified flag if buffer is modified
    if getbufvar(bufnr, '&modified')
      let file .= ' +'
    endif

    let s .= file . ' '
  endfor

  " After the last tab, fill with TabLineFill and reset tab page number
  let s .= '%#TabLineFill#%T'

  " Right-align a label to close the current tab if more than one tab exists
  if tabpagenr('$') > 1
    let s .= '%='
    let s .= '%#TabLine#%999Xclose'
  endif

  return s
endfunction

set tabline=%!MyTabLine()

function! NERDTreeCustomOpen()
    let current_node = g:NERDTreeFileNode.GetSelected()
    if !empty(current_node) && !current_node.path.isDirectory
        call current_node.open({"where": "t"})
    else
        call g:NERDTreeCreator._createAndOpenTargetWindow()
        call current_node.activate()
    endif
endfunction

augroup nerdtree_custom_mappings
    autocmd!
    autocmd FileType nerdtree nnoremap <buffer> l :call NERDTreeCustomOpen()<CR>
    autocmd FileType nerdtree nnoremap <buffer> e :wincmd l<CR>
augroup END

let g:floaterm_width = 0.6
let g:floaterm_height = 0.6

nnoremap <S-e> <cmd>NERDTreeToggle<CR>
nnoremap e :NERDTreeFocus<CR>
nnoremap <PageUp> <C-y>
nnoremap <PageDown> <C-e>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>
nnoremap <M-1> :tabnext 1<CR>
nnoremap <M-2> :tabnext 2<CR>
nnoremap <M-3> :tabnext 3<CR>
nnoremap <M-4> :tabnext 4<CR>
nnoremap <M-5> :tabnext 5<CR>
nnoremap <M-6> :tabnext 6<CR>
nnoremap <M-7> :tabnext 7<CR>
nnoremap <M-8> :tabnext 8<CR>
nnoremap <M-9> :tabnext 9<CR>
nnoremap tt :FloatermToggle<CR>
nnoremap \\ :vsplit<CR>
tnoremap <ESC> <CMD>FloatermToggle<CR>
