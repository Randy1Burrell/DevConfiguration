" Setting for plugins {{{

" Settings for .editorconfig plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Show lines above 80 character long
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
au BufRead,BufNewFile *.py match OverLength /\%81v.\+/
au BufRead,BufNewFile *.{py,php,js,rb} setlocal textwidth=120

" Settings for syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntax checker settings
let g:syntastic_javascipt_checkers = ['eslint', 'jslint', 'closure compiler']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_java_checkers = []

let g:syntastic_html_tidy_ignore_errors=[
      \   'attribute name',
      \   'is not recognized',
      \   'discarding unexpected'
      \ ]
let g:syntastic_html_tidy_ignore_warnings=['discarding unexpected']

" Set syntax highlight for conf files
au BufNewFile,BufRead *.conf*,/etc/* setfiletype conf

" configure nurdtree
let g:nerdtreedirarrowexpandable = '▸'
let g:nerdtreedirarrowcollapsible = '▾'

" Configure git indicators for nerdtree
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

" Theme
set background=light

" Ctrl settings
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" CtrlP -> use Ag for searching instead of VimScript
" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" NORMAL mode Ctrl+y then , <C-y,>

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" Sets airline defaults
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" Airline (status line)
let g:airline_powerline_fonts = 1
" Ailine theme
let g:airline_theme='dark'

" powerline setting
" set laststatus=2

" Autoformat files upon saving
" au BufWrite * :Autoformat

" Set vim-autoformat to run in verbose mode
"let g:autoformat_verbosemode=1

" Vue file syntax highlighting
autocmd FileType vue syntax sync fromstart

" Java completion configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Typescript-vim comfiguration
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Vim-js-pretty-template configuration
autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" angular_cli configuration
autocmd FileType typescript,html call angular_cli#init()

" Settings for you complete me plugin
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_rust_src_path = '~/.cargo/registry/src/'
let g:EclimFileTypeValidate = 0

" Configuration for php tags plugin
let g:tagbar_phpctags_bin = '~/.vim/bundle/tagbar-phpctags.vim/bin'
let g:tagbar_phpctags_memory_limit = '128M'

" Configuration for pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" Configuration for MXW/vim-jsx
let g:jsx_ext_required = 0

" }}}
