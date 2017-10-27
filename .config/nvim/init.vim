no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

  " theme
  call dein#add('joshdick/onedark.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vim-airline/vim-airline')

  " syntax
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})

  call dein#add('ciaranm/detectindent')
  "call dein#add('tpope/vim-sleuth')
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
" }}}

if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set clipboard+=unnamedplus
"set noshowmode
"set noswapfile
set number
set wildmenu

set expandtab
set tabstop=4

set hlsearch
set incsearch

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set list

" indent
autocmd FileReadPre * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

colorscheme onedark
