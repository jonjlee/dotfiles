# References for many of these options:
# - https://mths.be/dotfiles
# - https://github.com/mrzool/bash-sensible/blob/master/sensible.bash

# Include ~/bin and homebrew bin in path
export PATH="~/bin:/usr/local/bin:$PATH"

# Shell options
shopt -s nocaseglob         # Case-insensitive globbing (used in pathname expansion)
shopt -s cdspell            # Autocorrect typos in path names when using `cd`
shopt -s checkwinsize       # Update window size after every command
shopt -s histappend         # Append to the history file, don't overwrite it
shopt -s cmdhist            # Save multi-line commands as one command

# Readline options
bind "set completion-ignore-case on"      # Tab autocomplete ignore filename case
bind "set show-all-if-ambiguous on"       # List all matches in case multiple possible completions are possible
bind "set mark-symlinked-directories on"  # Immediately add a trailing slash when autocompleting symlinks to directories
bind "set visible-stats on"               # Show extra file information when completing, like `ls -F` does
bind "set skip-completed-text on"         # Be more intelligent when autocompleting by also looking at the text after the cursor. For example, when the current line is "cd ~/src/mozil", and the cursor is on the "z", pressing Tab will not autocomplete it to "cd ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the Readline used by Bash 4.)
bind '"\e[A": history-search-backward'    # Enable incremental history search with up/down arrows (also Readline goodness)
bind '"\e[B": history-search-forward'
bind '"\e[3;3~": kill-word'               # Use Alt/Meta + Delete to delete the preceding word

# Load the shell dotfiles
for file in {~/.exports,~/.aliases,~/.functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
