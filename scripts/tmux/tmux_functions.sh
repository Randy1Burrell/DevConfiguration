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
  install tmux
}

## Name: config_tmuxinator
## Desc: Configures installs and configures tmuxinator
## Params: ---
## Return: ---
config_tmuxinator()
{
  rvm_manager
  gem install tmuxinator
}

## Name: replace_tmux_conf
## Desc: Replaces current user's .tmux.conf with conf
##       in configs/tmux/tmux.conf
## Params: ---
## Return: ---
replace_tmux_conf()
{
  cat "${dir}//configs//tmux//tmux.conf" \
  > "${HOME}//.tmux.conf"
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
