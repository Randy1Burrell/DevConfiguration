## Author: Randy Burrell
## Date Created: 2017/08/13
##
## Desc: this file contains functions that can
##        be used to help configure zsh.
##
## Usage: To call any function within this file
##         import this script in your main shell
##         script and call any function defined
##         below.

## Name: zsh_replace
## Desc: replaces .zshrc with the one given
## Param: ---
## Return: integer
zsh_replace()
{
  cat "$zsh_conf" > "${HOME}//.zshrc"
  return $?
}

## Name: zsh_merge
## Desc: merge zshrc included in configd/zsh
##       directory with current user's zshrc
## Param: ---
## Return: integer
zsh_merge()
{
  cat "$zsh_conf" "${HOME}//.zshrc" | uniq -ui > "${HOME}//.zshrc"
  return $?
}

## Name: zsh alias
## Desc: creates alias file in user's home directory
## Param: string -- path to alias file
## Return: integer
zsh_alias()
{
  ## Give action command to generic_zsh_actions
  generic_zsh_actions $1 6
  ## Return exit value of generic_zsh_actions
  return $?
}

## Name: oh_my_zsh
## Desc: Install and configures oh my zsh
## Return: integer
oh_my_zsh()
{
  echo "No password" | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  return $?
}

## Name: zsh_config
## Desc: installs and configures zsh to our likings
## Param: string -- path to new zshrc
## Return: integer -- error/success code
zsh_config()
{
  ## Create zshrc file in home directory
  zsh_replace $1
  ## Call generic zsh actions and return its return value
  generic_zsh_actions $1 4
  ## configure zsh_alias
  dir=`pwd`
  alias_file="${dir}//configs//zsh/alias//alias.zsh"
  zsh_alias $alias_file
  zsh_op_mesg $?
  ## Configure oh my zsh
  oh_my_zsh $1
  ## Returns exit code
  return $?
}

## Name: change_to_zsh
## Desc: Changes default login shell to z shell
## Params: ---
## Return: integer
change_to_zsh()
{
  is_package_installed "zsh"
  res=$?
  if [ $res -ne 0 ]; then
    user_message "Zsh is not installed on this system\nPlease install zsh if you want ot use it"
    return $res
  fi
  if [ $SHELL = "/usr/bin/zsh" ]; then
    user_message "Zsh is already your default login shell"
    return 2
  fi

  if (whiptail --title "Confirmation" --yesno "Are you sure you would like change your default login shell to zsh?" 8 60) then
    password=$(whiptail --title "Password Dialog" --passwordbox "Please enter your correct password" 10 80 \
               3>&1 1>&2 2>&3)
    echo $password | chsh -s $(which zsh)
  fi
  return $?
}

## Name: install_zsh
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
