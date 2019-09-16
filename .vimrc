set nowrap

" Theme
syntax on
colorscheme onedark

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeToggle<Enter>
nmap <Home> :NERDTreeToggle<Enter>

nnoremap <PageUp> <c-w>w
nnoremap <PageDown> <c-w>W

" Terminal key mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Surround
map <Leader>" ysiw"
map <Leader>' ysiw'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1


" Tagbar
nmap <F8> :TagbarToggle<CR>

" Elite mode
let g:elite_mode=1

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
 nnoremap <Up>    :resize +2<CR>
 nnoremap <Down>  :resize -2<CR>
 nnoremap <Left>  :vertical resize +2<CR>
 nnoremap <Right> :vertical resize -2<CR>
endif

" jest test
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:test#strategy = 'neomake'

" Coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" PRETTIER
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" fugitive gitlab integration
let g:fugitive_gitlab_domains = ['https://git.nmlv.nml.com']
" Ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = "\uf05e"
let g:airline#extensions#ale#warning_symbol = "\uf071"
let g:airline#extensions#ale#checking_symbol = "\uf110"
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{PencilMode()}'
let g:airline_theme='onedark'


" DevIcons
set encoding=UTF-8
set guifont=Hack\ Regular\ Nerd\ Font\ Complete

" Spelling
set spell spelllang=en_us

" Split below
set splitbelow

" Line Numbers
set number

" Folding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

" incremental search
set incsearch

" high light search
set hlsearch

" Javascript library syntax
let g:used_javascript_libs='react,underscore,requirejs,jasmine'

" ALE 
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" Terminal
" Create a terminal in a new tab
tnoremap <Leader>c <C-\><C-n>:tab new<CR>:terminal<CR>i
noremap <Leader>c :tab new<CR>:terminal<CR>i

" Create a terminal in a new vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR><C-w><C-w>:terminal<CR>i
noremap <Leader>% :vsp<CR><C-w><C-w>:terminal<CR>i

" Create a terminal in a new horizontal split
tnoremap <Leader>^ <C-\><C-n>:sp<CR>:terminal<CR>i
noremap <Leader>^ :sp<CR>:terminal<CR>i

" COC Tab Completion
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css'
      \ ]

hi! link CocErrorHighlight SpellBad
hi! CocFloating ctermbg=236 guibg=#292c3a

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <F5> :CocRebuild<CR>
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> gR <Plug>(coc-refactor)
nmap <silent> gs <Plug>(coc-fix-current)
nmap <silent> gS <Plug>(coc-codeaction)
nmap <silent> [g <Plug>(coc-diagnostic-next)
nmap <silent> ]g <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K         :call CocAction('doHover')<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ----  Plugins  ----
call plug#begin('~/.vim/plugged')

" Test
Plug 'janko/vim-test'

" Coverage
Plug 'ruanyl/coverage.vim'

" Git Gutters
Plug 'airblade/vim-gitgutter'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" Status Line configuration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" ALE - Linting
Plug 'w0rp/ale'

" Comments
Plug 'scrooloose/nerdcommenter'

" On-demand loading
"  Nerd Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"  Nerd Tree GIT
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nerd Tree syntax highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Surround
Plug 'tpope/vim-surround'

" Eunuch
Plug 'tpope/vim-eunuch'

" Fuzzy Filter Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git Commands
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'idanarye/vim-merginal'

" Hacker News
Plug 'adelarsq/vim-hackernews'

" CSS Color
Plug 'ap/vim-css-color'

" Jest
Plug 'neomake/neomake'

" NPM
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Javascript
Plug 'sheerun/vim-polyglot'

" Startify
Plug 'mhinz/vim-startify'

" Rooter
Plug 'airblade/vim-rooter'

" Emmet
Plug 'mattn/emmet-vim'

" Postgres
Plug 'lifepillar/pgsql.vim'

" Tag Bar
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Package json
Plug 'meain/vim-package-info', { 'do': 'npm install' }


" Pencil
Plug 'reedes/vim-pencil'

" Commentary
Plug 'tpope/vim-commentary'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Theme
Plug 'joshdick/onedark.vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()
