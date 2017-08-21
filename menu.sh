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
        configure
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
  else
    echo "Good Bye"
    sleep 2
    clear
    return 0
  fi
}

