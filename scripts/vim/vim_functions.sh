## Author: Randy Burrell
## Date Created: 2017/08/12
##
## Desc: this file contains functions that can
##        be used to help configure vim.
##
## Usage: To call any function within this file
##         import this script in your main shell
##         script and call any function defined
##         below.

## Name: vim_replace
## Desc: replaces .vimrc with the one given
## Param: string -- path to new vimrc
## Return: integer
vim_replace()
{
    if [ $# -lt 1 ]
    then
        echo "Usage:"
        echo "vim_replace {path to .vimrc to replace with old .vimrc with}"
        sleep 3
        return 1
    fi

    if [ ! -f $1 ]
    then
        echo "File supplied does not exists"
        echo "Please give path to a real file"
        sleep 2
        return 2
    else
        cat $1 > "${HOME}//.vimrc"
    fi
    return 0
}

## Name: vim_append
## Desc: append vimrc to old vimrc
## Param: path to vimrc to append
## Return: integer
vim_append()
{
    return 0
}

## Name: select_vim_install
## Desc: Gives a menu with different vim editors
##       to select from for installation
## Param: ---
## Return: integer
select_vim_install()
{
    return 0
}

## Name: configure_vim
## Desc: Configures vim based on script definitions
## Params: ---
## Return: integer
configure_vim()
{
    return 0
}
