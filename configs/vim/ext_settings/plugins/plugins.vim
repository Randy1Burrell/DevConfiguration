" Contains vim plugins and installation methods
" plugins {{{

" Set vundle repository manager
set rtp+=~/.vim/bundle/Vundle.vim
" Set call for plugin to be installed
call vundle#begin()

" Set plugins for installation
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'
Plugin 't9md/vim-choosewin'
Plugin 'Shougo/vimproc.vim'
Plugin 'thoughtbot/vim-rspec'

" Ctags
Plugin 'majutsushi/tagbar'
Plugin 'kberov/ctags'
Plugin 'vim-php/tagbar-phpctags.vim'

" Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'

" General Programming
Plugin 'jiangmiao/auto-pairs'
Plugin 'bkad/CamelCaseMotion'

" Angular
Plugin 'bdauria/angular-cli.vim'

" Java
Plugin 'artur-shaik/vim-javacomplete2'

" TypeScript
Plugin 'leafgarland/typescript-vim'

" JavaScript
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Vue
Plugin 'posva/vim-vue'

" End pluing installation with vundle here
call vundle#end()

" Set execution for pathogen
execute pathogen#infect()
filetype plugin indent on
call pathogen#helptags()

" }}}

