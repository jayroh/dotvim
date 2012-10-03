runtime! autoload/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

set t_Co=256
set splitbelow
set splitright
set shell=/bin/zsh
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Section: configuration

  let g:Powerline_symbols = 'fancy'


  nnoremap // :TComment<CR>
  vnoremap // :TComment<CR>

  set pastetoggle=<F6>
  set colorcolumn=80
  set encoding=utf-8

  scriptencoding utf-8

  " I like pretty colors
  colorscheme vividchalk

  " These two enable syntax highlighting
  set nocompatible          " We're running Vim, not Vi
  syntax on                 " Enable syntax highlighting

  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  " show the `best match so far' as search strings are typed
  set incsearch

  " Highlight search results once found:
  set hlsearch

  " highlight the current line the cursor is on
  set cursorline
  " highlight the current column the cursor is on
  "set cursorcolumn

  "sm:    flashes matching brackets or parentheses
  set showmatch

  "sta:   helps with backspacing because of expandtab
  set smarttab

  " Change <Leader>
  let mapleader = ","

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " enable line numbers
  set number
  setlocal numberwidth=5
  nnoremap <F5> :set nonumber!<CR>

  " Enable tab complete for commands.
  " first tab shows all matches. next tab starts cycling through the matches
  " Maps autocomplete to tab
  set wildmenu
  set wildmode=list:longest,list:full
  set complete=.,w,t

  " don't complete from included files, on account of slow
  set complete-=i

  " Display extra whitespace
  set list listchars=tab:»·,trail:·

  " don't make it look like there are line breaks where there aren't:
  "set nowrap

  " assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title
  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " can has foldin plz?
  set foldenable
  " set foldmethod=syntax
  " set foldlevel=999 " make it really high, so they're not displayed by default

  set tags=./tags;

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen = 0
  " colored NERD Tree
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowHidden = 1
  " map enter to activating a node
  let NERDTreeMapActivateNode='<CR>'
  let NERDTreeIgnore=['\.git','\.DS_Store','\.sass\-cache','\.pdf','\.bundle']
  map <F2> :NERDTreeToggle<CR>
  " Toggle NERDTree with <leader>d
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

  let g:browser = 'open '

  " have some fun with bufexplorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" Section: mappings

  if exists(":CoffeeMake")
    nmap <leader>cc :silent CoffeeMake<CR>
    nmap <leader>cv :CoffeeCompile watch vert<CR>
  endif

  " Tabularize
  if exists(":Tabularize")
    nmap <leader>a\| :Tab /\|<CR>
    vmap <leader>a\| :Tab /\|<CR>
    nmap <leader>a= :Tab /=<CR>
    vmap <leader>a= :Tab /=<CR>
    nmap <leader>a: :Tab /:\zs<CR>
    vmap <leader>a: :Tab /:\zs<CR>
  endif

  " Tab navigation
  nmap <leader>tl :tabnext<CR>
  nmap <leader>th :tabprevious<CR>
  nmap <leader>te :tabedit

  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>

  " insert hashrocket, =>, with control-l
  imap <C-l> <Space>=><Space>

  " remap tab in insert mode to autocomplete
  imap <Tab> <C-p>


  " <leader>F to begin searching with ack
  map <leader>F :Ack<space>

  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>nh :nohls <CR>

  " toggle Quickfix window with <leader>q
  map <silent> <leader>q :QFix<CR>

  nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

  map <C-c>n :cnext<CR>
  map <C-c>p :cprevious<CR>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

map <leader>w :call TrimWhiteSpace()<cr>
map! <leader>w :call TrimWhiteSpace()<cr>

map <leader>bv :EasyBufferVerticalRight<cr>
map <leader>bs :EasyBufferHorizontalBelow<cr>
map <leader>be :EasyBuffer<cr>


source $HOME/.vim/autocmd.vim
source $HOME/.vim/functions.vim
