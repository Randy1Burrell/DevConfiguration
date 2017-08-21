#!/bin/bash
## Name: main_selection_menu
## Desc: Desplays an interactive menu used to install
##       and configure a development environment for
##       vi/vim, zsh, and tmux
## Params: ---
## Return: ---
main_selection_menu()
{
  ## Displays a menu and store user's selection in variable res
  res=$(whiptail --title "Development Environment" \
        --clear --cancel-button "Exit" \
        --backtitle "Created by Randy Burrell" \
        --menu "Please choose an option" 25 60 15 \
        "all" "Install All Pre-configured Environment" \
        "vim" "Install and Configure" \
        "zsh" "Install and configure" \
        "tmux" "Install and configure" 3>&1 1>&2 2>&3)
  ## Determine if the user selected ok or exit
  if [ $? -eq 0 ]; then
    ## Do the user's selection
    case $res in
      "all")
        configure_all
        ;;
      "vim")
        vim_menu
        ;;
      "zsh")
        zsh_menu
        ;;
      "tmux")
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
  ## Displays a menu and store user's selection in variable res
  res=$(whiptail --title "Vim Configuration" \
        --clear --cancel-button "Exit" \
        --backtitle "vim Editor"\
        --menu "Select an option" 25 60 15 \
        "replace" "your current .vimrc with ours" \
        "merge" "your current .vimrc with ours" \
        "install" "and configure a different vi" \
        "configure" "vi however I like" \
        "Go back" "to the previus menu" 3>&1 1>&2 2>&3)
  ## Determine if the user selected ok or exit
  if [ $? -eq 0 ]; then
    ## Do the user's selection
    case $res in
      "replace")
        vim_replace
        ;;
      "merge")
        vim_merg
        ;;
      "install")
        install_vim_menu
        ;;
      "configure")
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

## Name: zsh_menu
## Desc: Displays an interactive menu for installing and configuring
##       zsh
## Params: ---
## Return: ---
zsh_menu()
{
  res=$(whiptail --title "Zsh Configuration" \
        --clear --cancel-button "Exit" \
        --backtitle "z shell" \
        --menu "Select an option" 25 60 15 \
        "replace" "your current .zshrc with ours" \
        "merge" "your current .zshrc with ours" \
        "install" "zsh and change your shel to zsh" \
        "zsh_themes" "install and configure OH_MY_ZSH" \
        "change" "your shell to zsh" \
        "Go back" "to the previous menu" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
      "replace")
        ;;
      "merge")
        ;;
      "install")
        ;;
      "zsh_themes")
        ;;
      "change")
        ;;
      "Go back")
        main_selection_menu
        ;;
      *)
        ;;
    esac
  fi
}
