" basic config
syntax on
filetype indent on
set clipboard=unnamedplus
set nocompatible
set showmode
set showcmd
set encoding=utf-8
set t_Co=256
set foldenable

" indent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" appearance
set number
set relativenumber
set textwidth=120
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5

" search
set showmatch
set hlsearch
set incsearch
set ignorecase

" edit
set nobackup
set noswapfile
set undofile
set autochdir
set history=1000
set autoread
set listchars=tab:»■,trail:■
set list
set wildmenu
set wildmode=longest:list,full

" keybindings
let mapleader = " "
inoremap jj <Esc>
map J 5j
map K 5k
" Edit existing file under cursor in split window, gf current window
map gF <C-w>f
" windows
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l
map <Leader>wh <C-w>h
map <Leader>wJ <C-w>J
map <Leader>wK <C-w>K
map <Leader>wL <C-w>L
map <Leader>wH <C-w>H
map <Leader>wd :close<CR>
map <Leader>w1 :only<CR>
map <Leader><Tab> <C-w><C-w>
map <Leader>w= <C-w>=
" split
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
" quit
map <Leader>qq :quit<CR>
map <Leader>qQ :qa!<CR>
map <Leader>fS :x<CR>
map <Leader>fs :w<CR>
" switch buffers
map <Leader>bp :bp<CR>
map <Leader>bn :bn<CR>
" tab
map <Space>tn :tabnew<CR>
map <Space>tk :tabp<CR>
map <Space>tj :tabn<CR>
" tab jump
map <Space>tt gt
map <Space>t1 1gt
map <Space>t2 2gt
map <Space>t3 3gt
map <Space>t4 4gt
map <Space>t5 5gt
map <Space>t6 6gt
map <Space>t7 7gt
map <Space>t8 8gt
map <Space>t9 9gt
map <Space>t0 10gt
" cope
map <Leader>ee :botright cope<CR>
map <Leader>en :cn<CR>
map <Leader>ep :cp<CR>
" zoom
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose
        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction
nmap <leader>z :call Zoom()<CR>

nnoremap <leader>fer :source $MYVIMRC<CR>
nnoremap <leader>fed :e $MYVIMRC<CR>

nnoremap <LEADER>fo :!emacsclient -a emacs --no-wait %<CR>q
" Plug
call plug#begin('~/.vim/plugged')
nnoremap <Leader>pp :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pU :PlugUpgrade<CR>
nnoremap <Leader>ps :PlugStatus<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pd :PlugDiff<CR>

Plug 'tpope/vim-sensible'

"CTRL-T/CTRL-X/CTRL-V open up a file in a new tab, a new horizontal split, or in a new vertical split.
"Pressing yw in Ranger will emit Ranger's cwd to Neovim's, gw will jump to Neovim's cwd.
"Using :RnvimrResize to cycle the preset layouts.
Plug 'kevinhwang91/rnvimr'
nnoremap <Leader>ff :RnvimrToggle<CR>
let g:rnvimr_enable_ex  =  1
let g:rnvimr_enable_picker  =  1

"<c-z> to mark/unmark multiple files and <c-o> to open them.
"<c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"<c-y> to create a new file and its parent directories.
"<c-n>, <c-p> to select the next/previous string in the prompt's history.
"<c-r> to switch to regexp mode.
"Press <c-f> and <c-b> to cycle between modes.
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <Leader>fp :CtrlP<CR>
nnoremap <Leader>bb :CtrlPBuffer<CR>

" be normal open
" bt toggle open / close
" bs force horizontal split open
" bv force vertical split open
Plug 'jlanzarotta/bufexplorer'

Plug 'felikz/ctrlp-py-matcher'

" ? a quick summary of these keys, repeat to close
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
nnoremap <LEADER>sd :Ack
nnoremap <LEADER>sf :AckFile
nnoremap <Leader>ss :Ack  %<Left><Left>

Plug 'mbbill/undotree'
nnoremap <Leader>au :UndotreeToggle<CR>

"在后台运行 shell 命令，并将结果实时显示到 Vim 的 Quickfix 窗口中
Plug 'skywind3000/asyncrun.vim'
nnoremap <Leader>ar :AsyncRun
let g:asyncrun_open = 8

Plug 'airblade/vim-gitgutter'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gp :GitGutterPrevHunk<CR>
nnoremap <LEADER>gn :GitGutterNextHunk<CR>

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
"<M-n> : Jump to next closed pair
Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1

map  <Leader>jj <Plug>(easymotion-bd-f)
nmap <Leader>jj <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)

map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

"Tab for completions
Plug 'ervandew/supertab'

Plug 'terryma/vim-expand-region'
map <Leader>v <Plug>(expand_region_expand)
map <Leader>V <Plug>(expand_region_shrink)

"c-n, c-p, c-x, A-n, esc + c/s/I/A
Plug 'terryma/vim-multiple-cursors'

Plug 'voldikss/vim-floaterm'
nnoremap <LEADER>at :FloatermToggle<CR>
nnoremap <LEADER>gs :FloatermNew lazygit<CR>

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger="<tab>"
"" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"let g:UltiSnipsEditSplit="vertical"

" za	打开/关闭当前的折叠
" zc	关闭当前打开的折叠
" zC    关闭当前打开的折叠及其嵌套的折叠
" zo	打开当前的折叠
" zO    打开当前打开的折叠及其嵌套的折叠
" zm	关闭所有折叠
" zM	关闭所有折叠及其嵌套的折叠
" zr	打开所有折叠
" zR	打开所有折叠及其嵌套的折叠
" zd	删除当前折叠
" zE	删除所有折叠
" zj	移动至下一个折叠
" zk	移动至上一个折叠
Plug 'tmhedberg/simpylfold'

Plug 'hotoo/pangu.vim'
autocmd BufWritePre *.markdown,*.org, *.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1

Plug 'voldikss/vim-translator'
nmap <silent> <Leader>at <Plug>TranslateW
vmap <silent> <Leader>at <Plug>TranslateWV
let g:translator_default_engines = ['google']

Plug 'zxqfl/tabnine-vim'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'
nnoremap <LEADER>fr :Startify<CR>

Plug 'dracula/vim', { 'as': 'dracula' }

" Making background transparent
" let g:dracula_colorterm = 0

" Plug 'liuchengxu/vim-which-key'
" set timeoutlen=100
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call plug#end()

colorscheme dracula
