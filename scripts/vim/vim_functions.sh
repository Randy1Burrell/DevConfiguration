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

## Generic error function
vim_op_mesg()
{
    case $1 in
        0)
            echo ".vimrc has been replaced!!!"
            sleep 1
            return
            ;;
        1)
            echo "New .vimrc file was not supplied"
            sleep 1
            return
            ;;
        2)
            echo "Something went wrong!!!"
            echo "Please ensure that the configs folder is present"
            echo "Also ensure configs folder contains a vim folder"
            echo "And vim folder includes a vimrc file within it"
            sleep 10
            return
            ;;
        3)
            echo "Invalid action!!!"
            sleep 1
            return
            ;;
        4)
            echo "No proper action supplied"
            sleep 1
            return
            ;;
        5)
            echo "Files have been merged!! :-)"
            sleep 1
            return
            ;;
        6)
            echo "File appended!!! :-)"
            sleep 1
            return
            ;;
        *)
            echo "Something went wrong!!!"
            echo "Wait a minute then try again"
            sleep 2
            return
            ;;
    esac
}

## Name: generic_vim_actions
## Desc: Does an action based on parameters passed
## Param: string -- path to new vimrc
##        integer -- what action to perform
##        1 -- replace vimrc
##        2 -- merge vimrc
##        3 -- append vimrc
## Return: integer
generic_vim_actions()
{
    if [ "$#" -lt "2" ]
    then
        ## Enough arguments not supplied
        return 1
    fi
    if [ ! -f "$1" ]
    then
        ## File not found
        return 2
    fi
    if [ "$2" -gt "3" ]
    then
        ## Action is invalid
        return 3
    fi
    ## Define user's vim configuration file
    vimrc="${HOME}//.vimrc"
    case $2 in
        1)
            ## Replace contents on current user's vim config file
            cat $1 > $vimrc
            return 0
            ;;
        2)
            dir=`pwd` ## Get the present working directory
            echo "Working directory $dir"
            mkdir "${dir}//tmp" ## Define a temporary directory here
            conf="${dir}//tmp//vimrc.diff" ## Define temporary confile path
            ## Write difference between our vimrc file and present user's confile to temporary file
            diff $1 "$vimrc" | grep "<" | sed 's/^<//g' > "$conf"
            cat $conf
            ## Append the difference to current users vimrc
            cat $conf >> $vimrc
            ## Removing tmp directory
            rm -Rfv "${dir}//tmp"
            return 5
            ;;
        3)
            ## Append contents of our vimrc file to current user's
            cat $1 >> $vimrc
            return 6
            ;;
        *)
            return 4
            ;;
    esac
}

## Name: vim_replace
## Desc: replaces .vimrc with the one given
## Param: string -- path to new vimrc
## Return: integer
vim_replace()
{
    ## Call generic vim actions and return its return value
    generic_vim_actions $1 1
    return $?
}

## Name: vim_append
## Desc: append vimrc to old vimrc
## Param: path to vimrc to append
## Return: integer
vim_append()
{
    ## Call generic vim actions and return its return value
    generic_vim_actions $1 2
    return $?
}

## Name: select_vim_install
## Desc: Gives a menu with different vim editors
##       to select from for installation
## Param: ---
## Return: integer
select_vim_install()
{
    ## Does nothing yet
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
