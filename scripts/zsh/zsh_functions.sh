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
