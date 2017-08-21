#!/bin/bash

main_selection_menu()
{
  res=$(whiptail --title "Development Environment" \
        --clear --cancel-button "Exit" \
        --backtitle "Created by Randy Burrell" \
        --menu "Please choose an option" 25 60 15 \
        "all" "Install All Pre-configured Environment" \
        "vim" "Install and Configure" \
        "zsh" "Install and configure" \
        "tmux" "Install and configure" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
      all)
        configure_all
        ;;
      vim)
        vim_menu
        ;;
      zsh)
        zsh_menu
        ;;
      tmux)
        tmux_menu
        ;;
      *)
        echo "Incorrect Selection!!!"
        ;;
    esac
  fi
}

## Name: vim_menu
## Desc: Displays an interactive menu for installing
##       and configuring vi/vim
## Params: ---
## Return: ---
vim_menu()
{
  res=$(whiptail --title "Vim Configuration" \
        --clear --cancel-button "Exit" \
        --backtitle "vim Editor"\
        --menu "Select an option" 25 60 15 \
        "replace" "your current .vimrc with ours" \
        "merge" "your current .vimrc with ours" \
        "install" "and configure a different vi" \
        "configure" "vi however I like" \
        "Go back" "to the previus menu" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
      replace)
        vim_replace
        ;;
      merge)
        vim_merg
        ;;
      install)
        install_vim_menu
        ;;
      configure)
        configure_vim
        ;;
      "Go back")
        main_selection_menu
        ;;
      *)
        ;;
    esac
  fi
}
