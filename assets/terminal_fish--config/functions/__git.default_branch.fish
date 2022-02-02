function __git.default_branch -d "Fallback to main when master branch is not found"
  # Silently fail when not in git directory
  command git rev-parse --git-dir &>/dev/null; or return
  git-main-branch
end
