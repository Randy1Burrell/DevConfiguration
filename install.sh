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

directory=`pwd`

install_vim()
{
  apt install vim
}

main_menu()
{
    while :
    do
        clear
        echo "Welcome to development configuration's interactive shell"
        echo "Please select from the options below"
        echo "1 -- install all configuration"
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
                return 0
        esac
    done
}

main()
{
    main_menu
}

main
