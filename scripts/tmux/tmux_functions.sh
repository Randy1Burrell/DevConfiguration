## Author: Randy Burrell
## Date Created: 2017/08/16
##
## Desc: this file contains functions that can
##        be used to help configure tmux and
##        tmuxinator.
##
## Usage: To call any function within this file
##         import this script in your main shell
##         script and call any function defined
##         below.

## Name: tmux_install
## Description: installs tmux if it has not been
##              already been installed
## Params: ---
## Return: ---
tmux_install()
{
  ## Confirm that the user want to install tmux
  if (whiptail --title "Confirmation" --yesno "Are you sure you would like to install $res?" 8 60) then
    ## Get the user's password
    password=$(whiptail --title "Password Dialog" --passwordbox "Please enter your correct password" 10 60 \
        3>&1 1>&2 2>&3)
    res="$?"
    if [ $res -eq 0 ]; then
      #install "tmux"
      res="$?"
    else
      return $res
    fi
  fi
  if [ $res -eq 0 ]; then
    if (whiptail --title "Confirmation" --yesno "tmux has been successfully installed\nWould you like to configure you tmux.conf" 8 60) then
      tmux_rm_menu
    fi

    if (whiptail --title "Confirmation" --yesno "Would you like to install and configure you tmuxinator" 8 60) then
      config_tmuxinator
    fi
  fi
}

## Name: config_tmuxinator
## Desc: Configures installs and configures tmuxinator
## Params: ---
## Return: ---
config_tmuxinator()
{
  res=`ruby -v`
  res="$?"
  if [ $res -ne 0 ]; then
    if (whiptail --title "Confirmation" --yesno "tmuxinator requires ruby and gems\nWould you like to install these packages?" 8 60) then
      password=$(whiptail --title "Password Dialog" --passwordbox "Please enter your correct password" 10 60 \
        3>&1 1>&2 2>&3)
      rvm_manager
      res="$?"
      if [ $res -eq 0 ]; then
        rvm install ruby
      fi
    fi
  fi
  gem install tmuxinator
}

## Name: replace_conf
## Desc: Replaces current user's .tmux.conf with conf
##       in configs/tmux/tmux.conf
## Params: ---
## Return: ---
replace_conf()
{
  tm_conf="${HOME}//.tmux.conf"
  cat "$tmux_conf" > "$tm_conf"
  res="$?"
  if [ $res -eq 0 ]; then
    user_message "Your .tmux.conf has been replaced"
  else
    user_message "Something went wrong while trying to\nreplace your .tmux.conf\nSorry!!! :-("
  fi
}

## Name: merge_conf
## Desc: Merges current user's .tmux.conf with conf
##       located in configs/tmux/tmux.conf
## Params: ---
## Return: ---
merge_conf()
{
  tm_conf="${HOME}//.tmux.conf"
  cat "$tmux_conf" "$tm_conf" | uniq -ui  > "$tm_conf"
  res="$?"
  if [ $res -eq 0 ]; then
    user_message "We've merged your tmux.conf file with ours!!!"
  else
    user_message "Something went wrong while trying to merge our tmux conf files"
  fi
}

## Name: tmux_config_all
## Desc: configures tmux's and tmuxinator's options
## Params: ---
## Return: ---
tmux_config_all()
{
  tmux_install
  config_tmuxinator
  replace_tmux_conf
  if [ $? -eq 0 ]; then
    echo "tmux has been installed and configured"
  fi
}

## Name: tmux_rm_menu
## Desc: gives user option to replace or merge
##       their tmux confile with ours
##       r in function name = replace
##       m in function name = merge
## Params: ---
## Return: ---
tmux_rm_menu()
{
  res=$(whiptail --title "Tmux Configuration" \
        --clear --cancel-button "None" \
        --backtitle "Tmux"\
        --menu "Select an option" 25 60 15 \
        "replace" "your current .tmux.conf" \
        "merge" "your current .tmux.conf with ours" \
        "none" "I changed my mind" 3>&1 1>&2 2>&3)
  ## Determine if the user selected ok or exit
  if [ $? -eq 0 ]; then
    ## Do the user's selection
    case $res in
      "replace")
        replace_conf
        ;;
      "merge")
        merge_conf
        ;;
      "none")
        ;;
    esac
  fi
}
