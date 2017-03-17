# List all directories leading up to a filename; this is useful to see
# if some permissions are blocking access to a file.
lspath () {
    if [[ "$1" = "${1##/}" ]]; then
        pathlist=(/ ${(s:/:)PWD} ${(s:/:)1})
    else
        pathlist=(/ ${(s:/:)1})
    fi
    allpaths=()
    filepath=$pathlist[0]
    shift pathlist
    for i in $pathlist[@]; do
        allpaths=($allpaths[@] $filepath)
        filepath="${filepath%/}/$i"
    done
    allpaths=($allpaths[@] $filepath)
    ls -ld "$allpaths[@]"
}

# Grep from ps output
psg () {
    FST=`echo $1 | sed -e "s/^\(.\).*/\1/"`
    RST=`echo $1 | sed -e "s/^.\(.*\)/\1/"`
    ps aux | grep "[$FST]$RST"
}

# Autoexpand "..." to "../.." and so on
dot () {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N dot
bindkey . dot

# Print apt history
apt-history () {
    case "$1" in
    install)
        zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
        ;;
    upgrade|remove)
        zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
        ;;
    rollback)
        zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
        grep "$2" -A10000000 | \
        grep "$3" -B10000000 | \
        awk '{print $4"="$5}'
        ;;
    *)
        echo "Parameters:"
        echo " install - Lists all packages that have been installed."
        echo " upgrade - Lists all packages that have been upgraded."
        echo " remove - Lists all packages that have been removed."
        echo " rollback - Lists rollback information."
        ;;
    esac
}

# vpaste uploader
vpaste () {
    local uri="http://vpaste.net/"
    local out
    if [ -f "$1" ]; then
        out=`curl -s -F "text=<$1" "$uri?$2"`
    else
        out=`curl -s -F 'text=<-' "$uri?$1"`
    fi
    echo "$out"
    if (( $+commands[xclip] )) && [[ ! -z "$DISPLAY" ]]; then
        echo -n "$out" | xclip -i -selection primary
        echo -n "$out" | xclip -i -selection clipboard
    elif (( $+commands[pbcopy] )); then
        echo -n "$out" | pbcopy
    fi
}