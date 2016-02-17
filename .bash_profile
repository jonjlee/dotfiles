# Include ~/bin and homebrew bin in path
export PATH="~/bin:/usr/local/bin:$PATH"

# Bash prompt - "[time dir]$ "
export PS1="[\t \w]\$ "

# Shell options
shopt -s nocaseglob;    # Case-insensitive globbing (used in pathname expansion)
shopt -s cdspell;       # Autocorrect typos in path names when using `cd`

# Load the shell dotfiles
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
