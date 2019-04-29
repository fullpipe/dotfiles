if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Install some plugins
call plug#begin('~/.config/nvim/plugged')
    " How it looks
    Plug 'joshdick/onedark.vim'
    Plug 'vim-scripts/xoria256.vim'
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
	Plug 'tpope/vim-sensible'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'sickill/vim-pasta'
    Plug 'lumiliet/vim-twig'
    Plug 'w0rp/ale'

    Plug 'ciaranm/detectindent'
    Plug 'scrooloose/nerdtree'

    """ Completion
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'

    Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
    Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
    Plug 'ludovicchabant/vim-gutentags'

	Plug 'HerringtonDarkholme/yats.vim'
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    Plug 'ncm2/nvim-typescript', {'do': './install.sh'}
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'vim-scripts/taglist.vim'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'ncm2/ncm2-go'
    " LanguageServer client for NeoVim.
    "Plug 'autozimu/LanguageClient-neovim', {
    "  \ 'branch': 'next',
    "  \ 'do': 'bash install.sh',
    "  \ }
"    Plug 'ncm2/ncm2-go'
" Initialize plugin system
call plug#end()

let mapleader=","

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

if (has("termguicolors"))
  set termguicolors
endif

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

""" FZF
"Hide FZF statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

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
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
autocmd FileType php setlocal omnifunc=phpactor#Complete

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" parameter expansion for selected entry via Enter
"inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
  \}
let g:ale_linters = {
\   'php': ['phpstan'],
\   'typescript': ['tslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_enabled = 1

colorscheme onedark

set textwidth=80
set colorcolumn=+1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

noremap <leader>t :FZF<cr>

" tabs
nnoremap H gT
nnoremap L gt
