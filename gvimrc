colorscheme vividchalk
set guifont=Menlo\ Regular:h11
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
end
