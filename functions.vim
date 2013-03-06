if !exists("*ShowRoutes")
  function! ShowRoutes()
    " Requires 'scratch' plugin
    :topleft 100 :split __Routes__
    " Make sure Vim doesn't write __Routes__ as a file
    :set buftype=nofile
    " Delete everything
    :normal 1GdG
    " Put routes output in buffer
    :0r! rake -s routes
    " Size window to number of lines (1 plus rake output length)
    :exec ":normal " . line("$") . "_ "
    " Move cursor to bottom
    :normal 1GG
    " Delete empty trailing line
    :normal dd
  endfunction
endif

" expand existing tabs
if !exists("*TabToSpaces")
  function TabToSpaces()
      retab
  :endfunction
endif

" from http://vim.wikia.com/wiki/Remove_unwanted_spaces
if !exists("*TrimWhiteSpace")
  function TrimWhiteSpace()
    %s/\s*$//
    ''
  :endfunction
endif

" map <leader>9 :!hash_syntax --to-19 %
nmap <leader>9 :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>

" rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:command = "zeus rspec " . @% . " -f documentation --no-color"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:command = "zeus rspec " . @% . " -l " . line(".") . " -f documentation --no-color"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunLastSpec()
  if exists("t:last_spec_command")
    call RunSpecs(t:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction

function! RunSpecs(command)
  execute ":w\|!" . a:command
endfunction
