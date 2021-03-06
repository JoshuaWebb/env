bashd=~/.bash

# import global settings
. "$bashd/colours"
. "$bashd/ps1/prompt"
. "$bashd/aliases"
. "$bashd/environment"
. "$bashd/history"

# source all the functions and aliases in the git folder
for f in "$bashd/git/"*; do
   . "$f"
done

PATH="$HOME/bin:$PATH"
export PATH

# load history from most recent session
latestHistory=$(ls --color=never ~/.history | sort -n | tail -1)
if [[ ! -z $latestHistory ]]; then
    loadhistory $latestHistory
fi

# set window title
echo -ne "\033]2;bash\007"
