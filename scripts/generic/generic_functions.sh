## Author: Randy Burrell
## Date Created: 2017/08/16
##
## Desc: this file contains generic functions
##       used as helper functions in other
##       areas of this program
##
## Usage: To call any function within this file
##         import this script in your main shell
##         script and call any function defined

## Name: is_package_installed
## Desc: Checks is a package has already been installed
## Params: string -- package name
## Return: integer
is_package_installed()
{
    dpkg -s $1 &> /dev/null

    if [ $? -eq 0 ]; then
      return 0
    else
      return 1
    fi
}

install()
{
    if [ `is_package_installed $1` -eq 1 ]
    then
      sudo apt install $1
    else
      echo "Will not install $1"
      echo "$1 is already installed"
    fi
}

init_var()
{
    dir=`pwd`
    vimrc="${dir}//configs//vim//vimrc"
    zsh_conf_file="${dir}//configs//zsh//zshrc"
}

configure_all()
{
    ## Get vundle
    get_vim_vundle
    ## Get pathogen
    get_vim_pathogen
    ## Get vim colors
    do_colors
    ## Replace .vimrc for curren user
    vim_replace $vimrc
    vim_op_mesg $?
    ## Configure zsh for current user
    zsh_config $zsh_conf_file
    ## Install tmux
    tmux_install
}

