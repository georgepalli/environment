"
" key mappings
"

map <F5> :make<CR>
map <F6> :call Alternate()<CR>
map <F8> :make clean<CR>

imap <C-space> <C-N>

"
" Enable spell checker
"
map <F9> :source ~/.vim/engspchk.vim<CR>
map <C-P> \ep
map <C-N> \en

"
" Winmanager bindings
"
map <C-a>t :WMToggle<cr> 
map <C-a>f :FirstExplorerWindow<cr>
map <C-a>b :BottomExplorerWindow<cr>


" TO-DO: 
" space bar scrolls one page at a time


" shifted function keys
map <esc>[23~ <s-f1>
map <esc>[24~ <s-f2>
map <esc>[25~ <s-f3>
map <esc>[26~ <s-f4>
map <esc>[28~ <s-f5>
map <esc>[29~ <s-f6>
map <esc>[31~ <s-f7>
map <esc>[32~ <s-f8>
map <esc>[33~ <s-f9>
map <esc>[34~ <s-f10>
map <esc>[23$ <s-f11>
map <esc>[24$ <s-f12>

