set nowrap
set encoding=UTF-8
syntax enable 
filetype plugin indent on
set splitbelow
set splitright
set number
set incsearch
set hlsearch

" Folding
set foldmethod=syntax
let javaScript_fold=1
set foldlevelstart=99

" -------- Theme
" One Dark
let g:onedark_terminal_italics=1
let g:javascript_plugin_jsdoc = 1
colorscheme onedark
hi Conditional cterm=italic
hi Repeat cterm=italic
hi Label  cterm=italic
hi Exception cterm=italic
hi Define cterm=italic
hi Macro cterm=italic
hi Todo cterm=italic
hi jsExport cterm=italic
hi jsImport cterm=italic
hi jsFrom cterm=italic
hi jsStorageClass cterm=italic
hi jsFunction cterm=italic

" Startup create terminal
autocmd VimEnter * :execute "normal :vsp\<CR>:terminal\<CR>\<c-w>w"

nnoremap <PageUp> <c-w>w
nnoremap <PageDown> <c-w>W

" Terminal key mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Surround
nnoremap <Leader>" ysiw"
nnoremap <Leader>' ysiw'

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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

" Airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{PencilMode()}'
let g:airline_theme='onedark'


" Spelunker
set nospell
noremap ]s  :call spelunker#jump_next()<CR>
noremap [s  :call spelunker#jump_prev()<CR>
noremap z=  :call spelunker#correct_from_list()<CR>
noremap zg  :call spelunker#execute_with_target_word('spellgood')<CR> :call spelunker#check()<CR>


" Terminal
" Create a terminal in a new tab
tnoremap <Leader>c <C-\><C-n>:tab new<CR>:terminal<CR>i
noremap <Leader>c :tab new<CR>:terminal<CR>i

" Create a terminal in a new vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR>:terminal<CR>i
noremap <Leader>% :vsp<CR>:terminal<CR>i

" Create a terminal in a new horizontal split
tnoremap <Leader>^ <C-\><C-n>:sp<CR>:terminal<CR>i
noremap <Leader>^ :sp<CR>:terminal<CR>i

" COC Tab Completion
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-eslint'
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
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

" DB 
let g:bsint = 'postgres://$INT_PG_USER_BANKSERVICES:$INT_PG_PASS_BANKSERVICES@$INT_PG_HOST_BANKSERVICES/bankservices'
let g:bsqa = 'postgres://$QA_PG_USER_BANKSERVICES:$QA_PG_PASS_BANKSERVICES@$QA_PG_HOST_BANKSERVICES/bankservices'
let g:bsprod = 'postgres://$PROD_PG_USER_BANKSERVICES:$PROD_PG_PASS_BANKSERVICES@$PROD_PG_HOST_BANKSERVICES/bankservices'

let g:achtest = 'jdbc:sqlserver://$TEST_MS_HOST_ACHTRANSACTION:1433;user=$TEST_MS_USER_ACHTRANSACTION;password=$TEST_MS_PASS_ACHTRANSACTION;database=$TEST_MS_DB_ACHTRANSACTION'
let g:achstage = 'jdbc:sqlserver://$STAGE_MS_HOST_ACHTRANSACTION:1433;user=$STAGE_MS_USER_ACHTRANSACTION;password=$STAGE_MS_PASS_ACHTRANSACTION;database=$STAGE_MS_DB_ACHTRANSACTION'
let g:achprod = 'jdbc:sqlserver://$PROD_MS_HOST_ACHTRANSACTION:1433;user=$PROD_MS_USER_ACHTRANSACTION;password=$PROD_MS_PASS_ACHTRANSACTION;database=$PROD_MS_DB_ACHTRANSACTION'

nnoremap <leader>ri :% DB g:bsint<CR>
nnoremap <leader>rq :% DB g:bsqa<CR>
nnoremap <leader>rp :% DB g:bsprod<CR>

nnoremap <leader>rat :% DB g:achtest<CR>
nnoremap <leader>ras :% DB g:achstage<CR>
nnoremap <leader>rap :% DB g:achprod<CR>

" Disable Mouse
set mouse=a
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>
imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>
vmap <ScrollWheelUp> <nop>
vmap <S-ScrollWheelUp> <nop>
vmap <C-ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>
vmap <S-ScrollWheelDown> <nop>
vmap <C-ScrollWheelDown> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

" Explore
nnoremap <Leader>v :Vex<CR>
nnoremap <Leader>s :Sex<CR>

"CtrlP
set wildignore+=*/package-lock.json,*/coverage/*,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.a,*.o     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/][\.(git|hg|svn)|node_modules|coverage]$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ----  Plugins  ----
call plug#begin('~/.vim/plugged')

" Test
Plug 'janko/vim-test'

" Coverage
Plug 'ruanyl/coverage.vim'

" Git Gutters
Plug 'airblade/vim-gitgutter'

" Status Line configuration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript','jsx', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

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


" Javascript Syntax
Plug 'sheerun/vim-polyglot'
Plug 'hartalex/javascript-ex.vim'

" Startify
Plug 'mhinz/vim-startify'

" Rooter
Plug 'airblade/vim-rooter'

" Postgres
Plug 'lifepillar/pgsql.vim'

" Package json
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" Pencil
Plug 'reedes/vim-pencil'

" Commentary
Plug 'tpope/vim-commentary'

" CtrlP - What is this
Plug 'ctrlpvim/ctrlp.vim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'hartalex/onedark-ex.vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" DB
Plug 'tpope/vim-dadbod'

" Vinegar 
Plug 'tpope/vim-vinegar'

" Spelling
Plug 'kamykn/spelunker.vim'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
