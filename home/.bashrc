bashd=~/.bash

# import global settings
. "$bashd/colours"
. "$bashd/ps1/prompt"
. "$bashd/aliases"
. "$bashd/environment"

# source all the functions and aliases in the git folder
for f in "$bashd/git/"*; do
   . "$f"
done

PATH="$HOME/bin:$PATH"
export PATH

# set window title
echo -ne "\033]2;bash\007"
