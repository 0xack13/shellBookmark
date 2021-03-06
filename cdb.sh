function cdb() {
    USAGE="Usage: cdb [-c|-g|-d|-l] [bookmark]" ;
    if  [ ! -e ~/.cd_bookmarks ] ; then
        mkdir ~/.cd_bookmarks
    fi

    case $1 in
        # create bookmark
        -c) shift
            if [ ! -f ~/.cd_bookmarks/$1 ] ; then
                echo "cd `pwd`" > ~/.cd_bookmarks/"$1" ;
            else
                echo "Try again! Looks like there is already a bookmark '$1'"
            fi
            ;;
        # goto bookmark
        -g) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                source ~/.cd_bookmarks/"$1"
            else
                echo "Mmm...looks like your bookmark has spontaneously combusted. What I mean to say is that your bookmark does not exist." ;
            fi
            ;;
        # delete bookmark
        -d) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                rm ~/.cd_bookmarks/"$1" ;
            else
                echo "Oops, forgot to specify the bookmark" ;
            fi    
            ;;
        # list bookmarks
        -l) shift
            ls -l ~/.cd_bookmarks/ ;
            ;;
         *) echo "$USAGE" ;
            ;;
    esac
}

