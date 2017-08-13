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

##
generic_zsh_actions()
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
    ## Define user's zsh configuration file
    zshrc="${HOME}//.zshrc"
    case $2 in
        1)
            ## Replace contents on current user's zsh config file
            cat $1 > $zshrc
            return 0
            ;;
        2)
            dir=`pwd` ## Get the present working directory
            echo "Working directory $dir"
            mkdir "$dir//tmp" ## Define a temporary directory here
            conf="$dir//tmp//zshrc.diff" ## Define temporary confile path
            ## Write difference between our zshrc file and present user's confile to temporary file
            diff $1 "$zshrc" | grep "<" | sed 's/^<//g' > "$conf"
            cat $conf
            ## Append the difference to current users zshrc
            cat $conf >> $zshrc
            ## Removing tmp directory
            rm -Rfv "$dir//tmp"
            return 5
            ;;
        3)
            ## Append contents of our zshrc file to current user's
            cat $1 >> $zshrc
            return 6
            ;;
        *)
            return 4
            ;;
    esac
}
