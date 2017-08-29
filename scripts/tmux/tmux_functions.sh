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
      install "tmux"
      res="$?"
    else
      return $res
    fi
  fi
  if [ $res -eq 0 ]; then
    if (whiptail --title "Confirmation" --yesno "tmux has been successfully installed\nWould you like to configure you tmux.conf" 8 60) then
      replace_conf
    fi
  fi
}

## Name: config_tmuxinator
## Desc: Configures installs and configures tmuxinator
## Params: ---
## Return: ---
config_tmuxinator()
{
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
