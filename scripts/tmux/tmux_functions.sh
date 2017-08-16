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
  install ruby
}
