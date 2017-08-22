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
. ./scripts/zsh/zsh_functions.sh
. ./scripts/tmux/tmux_functions.sh
. ./scripts/generic/generic_functions.sh
. ./menu.sh

main()
{
  ## Initialize variables
  init_var
  ## Show main menu
  main_selection_menu
  ## Give the user a fairwell message
  fairwell_greeting
}

## Invoke main function
main
