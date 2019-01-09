alias show='cat ~/.dirs'
save () {
    here=`pwd`
    if (( $# == 0 )); then
        name=`basename $here`
    elif (( $# > 1 )); then
        echo "usage: save [<name>]"
        return -1
    else
        name=$1
    fi
    sed -i -e "/^$name=/d" ~/.dirs
    echo "$name=\"$here\"" >> ~/.dirs
    source ~/.dirs
}
source ~/.dirs
shopt -s cdable_vars
