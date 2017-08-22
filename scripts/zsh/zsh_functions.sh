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
    ## print message to user's screen
    zsh_op_mesg $?
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
