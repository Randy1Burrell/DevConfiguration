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
        res=$?
        if [ "$res" -eq 0 ]; then
          user_message "Your .vimrc file has been replaced\nEnjoy!!\n:-)"
        else
          user_messege "Something went wrong"
        fi
        ;;
      "merge")
        vim_merge
        res=$?
        if [ "$res" -eq 0 ]; then
          user_message "Your .vimrc has been merged with ours\nEnjoy!!"
        else
          user_message "Something went wrong"
        fi
        ;;
      "install")
        install_vim_menu
        ;;
      "configure")
        configure_vim
        res=$?
        if [ "$res" -eq 0 ]; then
          user_message "Vi has been configured"
        else
          user_message "Something went wrong"
        fi
        ;;
      "Go back")
        main_selection_menu
        ;;
      *)
        ;;
    esac
    vim_menu
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
        "install" "zsh and change your shell to zsh" \
        "zsh_themes" "install and configure OH_MY_ZSH" \
        "change" "your shell to zsh" \
        "Go back" "to the previous menu" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
      "replace")
        zsh_replace
        if [ $? -eq 0 ]; then
          user_message ".zshrc has been replaced"
        else
          user_message "Sorry!!\nSomething went wrong. :-("
        fi
        ;;
      "merge")
        zsh_merge
        if [ $? -eq 0 ]; then
          user_message ".zshrc has been merged with ours"
        else
          user_message "Sorry!!\nSomething went wrong. :-("
        fi
        ;;
      "install")
        install_zsh
        ;;
      "zsh_themes")
        oh_my_zsh
        if [ $? -eq 0 ]; then
          user_message "OH_MY_ZSH has been installed"
        else
          user_message "Sorry!!\nSomething went wrong. :-("
        fi
        ;;
      "change")
        change_to_zsh
        if [ $? -eq 0 ]; then
          user_message "Your default login shell has been changed to zsh"
        elif [ $? -eq 1 ]; then
          user_message "Zsh is not installed on this system\nPlease install zsh if you want ot use it"
        else
          user message "Something went wrong! Sorry!!! :-("
        fi
        ;;
      "Go back")
        main_selection_menu
        ;;
      *)
        ;;
    esac
    zsh_menu
  fi
}

## Name: tmux_menu
## Desc: Displays interactive menu for installing and
##       configuring tmux and its plugins
## Params: ---
## Return: ---
tmux_menu()
{
  res=$(whiptail --title "Tmux Configuration" \
        --clear --cancel-button "Exit" \
        --backtitle "Tmux" \
        --menu "Select an option" 25 60 15 \
        "replace" "your current tmux.conf with ours" \
        "merge" "your current tmux.conf with ours" \
        "install" "and configure tmux" \
        "tmuxinator" "install and configure tmuxinator" \
        "Go back" "to the previous menu" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
      "replace")
        ;;
      "merge")
        ;;
      "install")
        ;;
      "tmuxinator")
        ;;
      "Go back")
        main_selection_menu
        ;;
      *)
    esac
    tmux_menu
  fi
  fairwell_greeting
}

## Name: user_message
## Desc: Displays message to user
## Params: string -- message to be displayed to the user
## Return: ---
user_message()
{
  if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    whiptail --title "Error" --msgbox "One message required" 12 60
  fi

  whiptail --title "Message" --msgbox "$1" 12 60
  return $?
}

## Name: install_vim_menu
## Desc: Displays an interactive menu with different vi
##       for users to choose from
## Params: ---
## Return: ---
install_vim_menu()
{
  res=$(whiptail --title "Install Vi" \
        --clear --cancel-button "Exit" \
        --backtitle "Vi Installation Menu"\
        --menu "Choose a vim to be installed" 25 60 15 \
        "vim" ""\
        "vim-gnome" "" \
        "vim-tiny" "" \
        "vim-athena" "" \
        "vim-gtk" "" \
        "vim-nox" ""\
        "Go back" "to vi menu" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    case $res in
     "Go back")
        vim_menu
        ;;
     *)
      if (whiptail --title "Confirmation" --yesno "Are you sure you would like to install $res?" 8 60) then
         password=$(whiptail --title "Password Dialog" --passwordbox "Please enter your correct password" 10 60 \
        3>&1 1>&2 2>&3)
        install $res
        if [ $? -eq 0 ]; then
          user_message "$res was installed!!"
        elif [ $? -eq 1 ]; then
          install_vim_menu
        else
          user_message "Soemthing went wrong"
        fi
        install_vim_menu
      fi
      ;;
    esac
  fi
  exit
}

## Name: install_zsh_menu
## Desc: interactive menu for installing zsh and its dependencies
## Params: ---
## Return: ---
install_zsh()
{
  if (whiptail --title "Confirmation" --yesno "Are you sure would like to install Z-Shell?" 8 60) then
    password=$(whiptail --title "Password Dialog" --passwordbox "Please enter your correct password" 10 60 \
               3>&1 1>&2 2>&3)
    res=$?
    if [ $res -eq 0 ]; then
      ## install Z-Shell
      install "zsh"
      ## Channge default login shell to Z-Shell if user give permission
      if (whiptail --title "Confirmation" --yesno "Would you like to change your default shell to Z-Shell?" 8 60) then
        change_to_zsh
      fi
    fi
  fi
}
