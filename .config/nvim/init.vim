no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  " theme
  call dein#add('joshdick/onedark.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vim-airline/vim-airline')

  " syntax
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})

  " tools
  call dein#add('scrooloose/nerdtree')

  " Typescript
  call dein#add('mhartington/nvim-typescript')
  call dein#add('HerringtonDarkholme/yats.vim')

  call dein#add('ciaranm/detectindent')
  "call dein#add('tpope/vim-sleuth')

  " PHP
  call dein#add('padawan-php/deoplete-padawan', {'on_ft': 'php', 'build': 'composer install' })
"  call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': 'bash install.sh'})
  call dein#add('roxma/LanguageServer-php-neovim', {'build': 'composer install && composer run-script parse-stubs', 'on_ft': 'php'})
  call dein#add('StanAngeloff/php.vim', {'on_ft': 'php'})

  " FZF
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
" }}}

if (has("termguicolors"))
  set termguicolors
endif
set clipboard+=unnamedplus
"set noshowmode
"set noswapfile
set number
set wildmenu

set expandtab
set tabstop=4

set hlsearch
set incsearch

"add some space when scrolling
set scrolloff=3

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set list

" Auto complete
"let g:LanguageClient_serverCommands = {
"    \ 'php': ['php', '$HOME/.config/nvim/repos/github.com/roxma/LanguageServer-php-neovim/vendor/bin/php-language-server.php'],
"    \ }
"let g:LanguageClient_diagnosticsEnable = 1
 let g:deoplete#sources#padawan#add_parentheses = 1
" needed for echodoc to work if add_parentheses is 1
let g:deoplete#skip_chars = ['$']

 let g:deoplete#sources = {}
 let g:deoplete#sources.php = ['padawan', 'ultisnips', 'tags', 'buffer']

" cycle through menu items with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" PHP setup

" fix performance issue
let php_html_load=0
let php_html_in_heredoc=0
let php_html_in_nowdoc=0

let php_sql_query=0
let php_sql_heredoc=0
let php_sql_nowdoc=0


" Nerdtree
map <C-Bslash> :NERDTreeToggle<CR>

" FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_tags_command = 'ctags --extra=+f -R'

" indent
autocmd FileReadPre * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" Hide autocomplete preview
autocmd CompleteDone * pclose

colorscheme onedark
