## Author: Randy Burrell
## Date Created: 2017/08/12
##
## Desc: this file contains functions that can
##        be used to help configure vim.
##
## Usage: To call any function within this file
##         import this script in your main shell
##         script and call any function defined
##         below.

## Name: vim_replace
## Desc: replaces .vimrc with the one given
## Param: string -- path to new vimrc
## Return: integer
vim_replace()
{
  cat "$vimrc" > "${HOME}//.vimrc"
  return $?
}

## Name: vim_merge
## Desc: merge your current .vimrc with our .vimrc
## Param: ---
## Return: integer
vim_merge()
{
  ## Call generic vim actions and return its return value
  cat "$vimrc" "${HOME}//.vimrc" | uniq -ui > "${HOME}//.vimrc"
  return $?
}

## Name: configure_vim
## Desc: Configures vim based on script definitions
## Params: ---
## Return: integer
configure_vim()
{
  get_vim_vundle
  res=$?
  if [ $res -ne 0 ]; then
    return $res
  fi
  get_vim_pathogen
  res=$?
  if [ $res -ne 0 ]; then
    return $res
  fi
  do_colors
  return $?
}

## Name: get_vim_vundle
## Desc: Clone Vundle.vim to current user's
##       .vim/bundle/Vundle.vim directory
## Params: ---
## Return: integer
get_vim_vundle()
{
  if [ ! -d "${HOME}//.vim//bundle//Vundle.vim" ]
  then
    vundle=`git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}//.vim//bundle//Vundle.vim`
  fi
  return $?
}

## Name: get_vim_pathogen
## Desc: Creates autoload and bundle director
##       in current user's .vim directory if
##       it doesn't already exists and downloads
##       pathogen.vim in autoload directory
## Params: ---
## Return: integer
get_vim_pathogen()
{
  if [ ! -d "${HOME}//.vim//autoload" ]
  then
    if [ ! -d "${HOME}//.vim//bundle" ]
    then
      mkdir -p "${HOME}//.vim/bundle"
    fi
    mkdir -p "${HOME}//.vim//autoload"
    `curl -LSso ${HOME}//.vim//autoload//pathogen.vim https://tpo.pe/pathogen.vim`
  fi
  return $?
}

## Name: get_vim_colorschemes
## Desc: Clones vim-colorschemes for current vim user
## Params: ---
## Return: integer
get_vim_colorschemes()
{
    `git clone https://github.com/flazz/vim-colorschemes.git\
    ${HOME}//.vim//bundle//Vundle.vim/vim-colorschemes`
    return $?
}

## Name: exists_vim_colorschemes
## Desc: Checks if vim-colorschemes already exists
## Params: ---
## Return: integer
exists_vim_colorschemes()
{
    if [ -d "${HOME}//.vim/bundle/vim-colorschemes/colors" ]; then
      return 0
    else
      return 1
    fi
}

## Name: link_vim_colors
## Desc: links vim colorschemes/colors to current
##       user's .vim/colors directory
## Params: ---
## return: integer
link_vim_colors()
{
    ln -s \
    "${HOME}//.vim//bundle//Vundle.vim//vim-colorschemes//colors" \
    "${HOME}//.vim//colors"
  return $?
}

## Name: do_colors
## Desc: get and link colorschemes for vim users
## Params: ---
## Return: integer
do_colors()
{
  if [ ! -d "${HOME}//.vim//colors" ]
  then
    exists_vim_colorschemes
    res="$?"
    if [ "$res" -eq 0 ]
    then
      link_vim_colors
    else
      get_vim_colorschemes
      link_vim_colors
    fi
  fi
  return $?
}
