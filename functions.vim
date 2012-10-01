map <leader>S :!./bin/rspec % --format documentation<CR>

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

" from http://vim.wikia.com/wiki/Remove_unwanted_spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" expand existing tabs
function TabToSpaces()
    retab
:endfunction
