" Mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

" Clear search buffer
":nnoremap § :nohlsearch<cr>
"
" Command to use sudo when needed
nmap <leader>! %!sudo tee > /dev/null %<CR>

" File System Explorer (in horizontal split)
map <leader>. :Sexplore<cr>

" Buffers
map <leader>yt :ls<cr>

" Buffers (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows

" Moving around windows quickly
map <leader>] <C-W>l " Move to right window
map <leader>[ <C-W>h " Move to left window
map <leader><CR> <C-W>j " Move to left window
map <leader>= <C-W>k " Move to left window

" Source vimrc
map <leader>v :source ~/.vimrc<CR>
map <leader>m :PluginInstall<CR>

" Open ~/.vimrc
map <leader>" :e ~/.vimrc<CR>

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" Running Tests...
" See also <https://gist.github.com/8114940>

" Run currently open RSpec test file
map <Leader>rf :w<cr>:!rspec % --format nested<cr>

" Run current RSpec test
" RSpec is clever enough to work out the test to run if the cursor is on any line within the test
map <Leader>rl :w<cr>:exe "!rspec %" . ":" . line(".")<cr>

" Run all RSpec tests
map <Leader>rt :w<cr>:!rspec --format nested<cr>

" Run currently open cucumber feature file
map <Leader>cf :w<cr>:!cucumber %<cr>

" Run current cucumber scenario
map <Leader>cl :w<cr>:exe "!cucumber %" . ":" . line(".")<cr>

" Run all cucumber feature files
map <Leader>ct :w<cr>:!cucumber<cr>

" Tmux style window selection
map <Leader>ws :ChooseWin<cr>

" Set command to help save file that need root privilage
cmap w!! :w !sudo tee >/dev/null %
:au FileChangedShell * e!

" Key maps for git
noremap <leader><F3> :Git add %<CR>
noremap <leader><F4> :Gcommit<CR>i
noremap <leader><F5> :wq<CR>:Gpush<CR>
noremap <leader><F6> :Gstatus<CR>
noremap <leader><F7> :Gpull<CR>
noremap <leader><F8> :Git diff %<CR>
noremap <leader><F9> :Git add %<CR>:Gcommit<CR>i
noremap <leader><F10> :wq<CR>:Gpush<CR><CR>

" Key maps for tabNext
noremap <leader><F12> :tabNext<CR>

" Key maps for saving and exiting vim
map <leader>s :w<CR>
map <leader>x :q<CR>

" Paste from system buffer
map <leader>i "*p

" Buffer navigation key maps
map <leader>n :bn<CR>
map <leader>p :bp<CR>
map <leader>b :b
map <leader>l <C-^>

" Maps ToggleRelativeOn function to \\ key call
noremap <silent><leader>\ :call ToggleRelativeOn()<CR>

" Searching the file system
map <leader>' :NERDTreeToggle<cr>

" Tabularize
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>

" Camel Case Motion (for dealing with programming code)
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" Settings for vim-autoformat
" Maps F3 function key to autoformat
noremap <leader><SPACE> :Autoformat<CR>

" Map key to autoformat files
map <leader>- gg=G``zz

" F2 toggles paste mode
nmap <PasteStart>  <nop>
nmap <PasteEnd>    <nop>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" CtrlP
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>

" Settings for tagbar plugin
nmap <F8> :TagbarToggle<CR>

" Map for pangloss/vim-javascript plugin
map <leader><TAB> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
" }}}

