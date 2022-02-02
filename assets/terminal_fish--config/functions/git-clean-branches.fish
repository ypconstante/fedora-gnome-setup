function git-clean-branches
    git branch --no-color --merged | egrep -v "(^\*|master|main|dev|develop)" | xargs --no-run-if-empty -n 1  -r git branch -d
end
