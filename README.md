# 💾Save shortcut script
Simple bash script to save your pwd and give it an alias.

This allows you to move to a given directory and save the location with shortcut name so you can move to it by just typing `cd location_name` in future.

## 🎬Getting Started  
Before you begin, if it doesn't exist already create a path called `/.dirs`. For example:

```touch ~/.dirs```

Save the following script and save function to your `~/.bashrc` file:

```
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
```
## 💻Using the Save function
Move to the directory you use a lot or want to create a shortcut for:

```cd folder1/folder2/folder3/folder4```

Type save and the name you want to give the shortcut for this location:

```save shortcut1```

The next time you want to go to this location you can just type:

```cd shortcut1```

Alternatively, you can just type `save` and it gives the shortcut the name of the folder. In this example it would be `folder4`.
