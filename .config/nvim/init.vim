if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Install some plugins
call plug#begin('~/.config/nvim/plugged')
    " How it looks
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'

    " Hot it feels
    Plug 'sickill/vim-pasta'

    " Syntax
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
    Plug 'jparise/vim-graphql'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'lumiliet/vim-twig'
    Plug 'stephpy/vim-yaml'

    " Fuzzy finder
    Plug 'airblade/vim-rooter'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Langs
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Format and code style
    Plug 'stephpy/vim-php-cs-fixer'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()


let mapleader="\<Space>"
"map <space> <leader>

" disable arrow keys
noremap <down> <Nop>
noremap <up> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

"ino <down> <Nop>
"ino <up> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>

" setup python env
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'


" Color settings and look
if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

set noshowmode


" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>



set clipboard+=unnamedplus
set number

" Indention, space vs tab
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

" stop linebreaking, but keep wraping
set tw=0

set hlsearch

set nobackup
set noswapfile

" try to detect indention on file open
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
autocmd FileReadPre * :DetectIndent

"add some space when scrolling
set scrolloff=3

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set list

" fix php performance issue
let php_html_load=0
let php_html_in_heredoc=0
let php_html_in_nowdoc=0

let php_sql_query=0
let php_sql_heredoc=0
let php_sql_nowdoc=0


" Nerdtree
map <C-Bslash> :NERDTreeToggle<CR>

" ctrlspace config
"let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"set hidden

""" FZF
"Hide FZF statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match your color scheme
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


""" Completition

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""" Snippets
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" PHP7
let g:ultisnips_php_scalar_types = 1

" GOLANG

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 0
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='.phpcs'
"let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_php_phpstan_level = '1'
let g:ale_typescript_tslint_use_global=1
let g:ale_typescript_tslint_executable='tslint'
let g:ale_typescript_tslint_config_path='tslint.json'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['php_cs_fixer', 'phpcbf', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'typescript': ['tslint', 'prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'html': ['prettier']
  \}
let g:ale_linters = {
\   'php': ['phpstan'],
\   'typescript': ['prettier', 'tslint'],
\   'javascript': ['prettier', 'eslint'],
\   'html': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_enabled = 1

colorscheme onedark

set textwidth=80
set colorcolumn=+1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

" Search files within the project
noremap <leader>t :FZF<cr>

" Look up for buffers
noremap <leader>b :Buffers<cr>

" Look up for tags in buffer
" autocmd FileType go nnoremap <buffer> <leader>r :GoDecls<cr> " not works
noremap <leader>r :GoDecls<cr>
autocmd FileType php nnoremap <buffer> <leader>r :BTags<cr>

noremap <leader><space> :b#<cr>
" tabs
nnoremap H gT
nnoremap L gt
