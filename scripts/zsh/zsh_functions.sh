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
zsh_op_mesg()
{
    case $1 in
        0)
            echo ".zshrc has been replaced!!!"
            sleep 1
            return
            ;;
        1)
            echo "New .zshrc file was not supplied"
            sleep 1
            return
            ;;
        2)
            echo "Something went wrong!!!"
            echo "Please ensure that the configs folder is present"
            echo "Also ensure configs folder contains a zsh folder"
            echo "And zsh folder includes a zshrc file within it"
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
        7)
            echo "7"
            sleep 3
            ;;
        8)
            echo "Oh my zsh has been installed"
            sleep 3
            ;;
        9)
            echo "Copied alias file to home"
            sleep 5
            ;;
        *)
            echo "Something went wrong!!!"
            echo "Wait a minute then try again"
            sleep 2
            return
            ;;
    esac
}

## Name: generic_zsh_actions
## Desc: Does an action based on parameters passed
## Param: string -- path to new zshrc
##        integer -- what action to perform
##        1 -- replace zshrc
##        2 -- merge zshrc
##        3 -- append zshrc
## Return: integer
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
        4)

            ## Update system
            sudo apt update
            ## Install zsh
            install zsh
            ## Change default shell to zsh
            sudo chsh -s $(which zsh)
            return 7
            ;;
        5)
            echo "No password" | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
            return 8
            ;;
        6)
            ## Path to aliases
            zsh_dir="${HOME}//.zsh"
            if [ ! -d $zsh_dir ]; then
              mkdir -p "$zsh_dir"
            fi
            cp -r "$1" "$zsh_dir"
            return 9
            ;;
        *)
            return 4
            ;;
    esac
}

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
    generic_zsh_actions $1 5
    zsh_op_mesg $?
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
