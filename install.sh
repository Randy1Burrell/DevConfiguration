#!/bin/sh

############################################################
## Author: Randy Burrell                                  ##
## Date Created: 2017/11/08                               ##
##                                                        ##
## Description: This file is used to install a            ##
##              development environment for the linux     ##
##              terminal which includes: zsh shell, tmux, ##
##              tmuxinator, rvm, omyzh. It also changes   ##
##              vi's/vim's, tmux and zsh confiuration to  ##
##              match the config included with this       ##
##              repository.                               ##
##                                                        ##
## Usage: Change mode of file to be executable and run as ##
##        root.                                           ##
############################################################
## Import function file
. ./scripts/vim/vim_functions.sh
. ./scripts/vim/vim_menu.sh
. ./scripts/zsh/zsh_functions.sh
. ./scripts/zsh/zsh_menu.sh

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

    if [ ! -d "${HOME}//.vim//colors" ]
    then
      if [ exists_vim_colorschemes -eq 0 ]
      then
        link_vim_colors
      else
        link_vim_colors
        get_vim_colorschemes
      fi
    fi
    vim_replace $vimrc
    vim_op_mesg $?
    zsh_config $zsh_conf_file
    install tmux
}

main_menu()
{
    while :
    do
        clear
        echo "Welcome to development configuration's interactive shell"
        echo "Please select from the options below"
        echo "1 -- install and configure all programs for developement"
        echo "2 -- install and configure vim"
        echo "3 -- install and configure zsh"
        echo "4 -- install and configure tmux"
        echo "5 -- Quit"
        read main_menu_option

        case $main_menu_option in
            1)
                configure_all
                ;;
            2)
                vim_menu
                ;;
            3)
                zsh_menu
                ;;
            4)
                tmux_menu
                ;;
            5)
                echo "Good Bye!!"
                sleep 2
                clear
                return 0
                ;;
            *)
                echo "Options are 1-5"
                sleep 1
                ;;
        esac
    done
}

main()
{
    ## Initialize variables
    init_var
    ## Show main menu
    main_menu
}

main
