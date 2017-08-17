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

## Name: install
## Desc: Install packages
## Params: string -- package name
## Return: ---
install()
{
    if [ `is_package_installed $1` -eq 1 ]
    then
      'Y' | sudo apt install $1
    else
      echo "Will not install $1"
      echo "$1 is already installed"
    fi
}

## Name: init_var
## Desc: initializes variables
## Params: ---
## Return: ---
init_var()
{
    dir=`pwd`
    vimrc="${dir}//configs//vim//vimrc"
    zsh_conf_file="${dir}//configs//zsh//zshrc"
}

## Name: check_ppa
## Desc: Checks if ppa has already been added to the
##       source list
## Params: string -- ppa name
## return: integer - 0 on success
check_ppa()
{
  grep $1 /etc/apt/sources.list /etc/apt/sources.list.d/*
  return $?
}

## Name: rvm_gpg
## Desc: Adds rvm gpg key and install rvm
## Params: ---
## Returns: ---
rvm_gpg()
{
  ## Check if gpg keys already exist and add them
  ## if they don't
  res=`gpg -k 409B6B1796C275462A1703113804BB82D39DC0E3`
  res=$?
  if [ $res -ne 0 ]; then
    res=`gpg -k 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
    res=$?
    if [ $res -ne 0 ]; then
      gpg --keyserver hkp://keys.gnupg.net \
      --recv-keys \
      409B6B1796C275462A1703113804BB82D39DC0E3 \
      7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi
  fi
  ## Check if rvm is already installed
  res=`rvm`
  res=$?
  if [ $res -ne 0 ]; then
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
  fi
}

## Name: rvm_manager
## Desc: Manages rvm installation process depending
##       on OS type. Example if OS is ubuntu use
##       apt package manager
## Params: ---
## Return: ---
rvm_manager()
{
  ## If OS is Ubuntu the install rvm from ppa
  ## else install rvm for other OSes
  res=`uname -a | grep -i ubuntu`
  res=$?
  if [ $res -eq 0 ]; then
    ## If software-properties-common has not been
    ## installed; then install it
    is_package_installed "software-properties-common"
    res=$?
    if [ $res -ne 0 ]; then
      install software-properties-common
    fi
    ## If ppa:rael-gc/rvm was not added; add it
    if [ check_ppa -ne 0 ]; then
      sudo apt-add-repository -y ppa:rael-gc/rvm
      sudo apt update
    fi
    ## If rvm is not installed; install it
    res=is_package_installed "rvm"
    if [ $res -ne 0 ]; then
      install rvm
    fi
  else
    rvm_gpg
  fi
}

## Name: Configure_all
## Desc: Completely comfigures you dev env
## Params: ---
## Return: ---
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
    ## Install rvm
    rvm_manager
    ## Install and configure tmux and tmuxinator
    tmux_config_all
}

