# Shortcuts

# Directories
alias dotfiles="cd $DOTFILES"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Git
alias amend="git add . && git commit --amend --no-edit"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
