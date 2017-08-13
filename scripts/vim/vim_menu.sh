## Vim Menu File
## This file should not be called independently
## To be imported and used in another program
## vim menu function displays

## Interactive menu to configure vim
vim_menu()
{
    while :
    do
        clear
        echo "*******************************"
        echo "VIM MENU OPTIONS"
        echo "Select an option"
        echo "1 -- replace your .vimrc with ours"
        echo "2 -- add our .vimrc to yours"
        echo "3 -- install a different vim"
        echo "4 -- configure your vim however I like"
        echo "5 -- return to previous menu"
        echo "6 -- Quit"
        read vim_option

        case $vim_option in
            1)
                curr_dir=`pwd`
                conf_file="${curr_dir}//configs//vim//vimrc"
                vim_replace "$conf_file"
                exit_val=$?
                if [ $exit_val -eq 0 ]
                then
                    echo ".vimrc has been replaced!!!"
                    sleep 1
                else
                    echo "Something went wrong!!!"
                    echo "Please ensure that the configs folder is present"
                    echo "Also ensure configs folder contains a vim folder"
                    echo "And vim folder includes a vimrc file within it"
                    sleep 10
                fi
                ;;
            2)
                vim_append
                ;;
            3)
                select_vim_install
                ;;
            4)
                configure_vim
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
