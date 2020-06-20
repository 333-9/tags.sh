#!/bin/sh
# date: 19.05 2020
# vim: expandtab

fuzzy='fzy' # fzf also works
tname='.fstags'
set_t='read t' # 't=`echo | dmenu`'


search() {
    tags="`pwd`/$tname"
    while [ "$tags" != "/$tname" ]; do
        # echo $tags >&2 #debug
        if [ -e "$tags" ]; then
            echo "$tags"
            exit
        else
            tags=`echo "$tags" | sed "s/[^/]*\/[^/]*\$/$tname/"`
        fi
    done
    exit 1
}


if [ "$1" = "-h" ]; then # get short help
    echo "usage: tags [-a name]    tags file: $tname" >&2
elif tags=`search`; [ $? -ne 0 ]; then
    echo 'tags not found' >&2
    exit 1
elif [ "$1" = "-a" ]; then # add entry
    shift
    $set_t
    if grep -sq -F "^$1" "$tags"; then
        echo "/^$1/s/: /&$t /\nw\nq\n" | ed "$tags"
    else
        echo "$1: $t" >> "$tags"
    fi
elif [ -z "$1" ]; then # search for file
    cat "$tags" | $fuzzy | sed "s/: .*$//"
else
    echo "unknown argument $1" >&2
    exit 1
fi
