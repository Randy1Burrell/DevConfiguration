## Vim Menu File
## This file should not be called independently
## To be imported and used in another program
## vim menu function displays
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
                ;;
            2)
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
                echo "Options are 1-5"
                sleep 1
                ;;
        esac
    done
}
