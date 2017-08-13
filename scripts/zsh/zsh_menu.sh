## Zsh Menu File
## This file should not be called independently
## To be imported and used in another program
## zsh menu function displays

## Interactive menu to configure zsh
zsh_menu()
{
    ## Loop keeps user at menu until the select
    ## an option in the menu
    while :
    do
        clear
        echo "*******************************"
        echo "ZSH MENU OPTIONS"
        echo "Select an option"
        echo "1 -- replace your .zshrc with ours"
        echo "2 -- add our .zshrc to yours"
        echo "3 -- install and configure zsh"
        echo "4 -- install and configure OH_MY_ZSH"
        echo "5 -- return to previous menu"
        echo "6 -- Quit"
        read vim_option

        case $vim_option in
            1)
                clear
                echo "************* WARNING!!!!! *******************"
                echo "## This could be dangerous"
                echo "## Your .zshrc file may have settings that is"
                echo "## Specific to your environment"
                echo "## Select:"
                echo "## [y]--YES"
                echo "## [ANY OTHER KEY]--NO"
                echo "**********************************************"
                read opt
                if [ $opt = "y" ] || [ $opt = "Y" ]
                then
                    curr_dir=`pwd`
                    conf_file="${curr_dir}//configs//zsh//zshrc"
                    zsh_replace "$conf_file"
                    zsh_op_mesg $?
                fi
                ;;
            2)
                curr_dir=`pwd`
                conf_file="${curr_dir}//configs//zsh//zshrc"
                zsh_append "$conf_file"
                zsh_op_mesg $?
                ;;
            3)
                ;;
            4)
                ;;
            5)
                return 0
                ;;
            6)
                clear
                exit
                ;;
            *)
                echo "Options are 1-6"
                sleep 1
                ;;
        esac
    done
}
