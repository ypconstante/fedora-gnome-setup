#!/usr/bin/env bash

set -o nounset

if [[ -z ${FORCE_RUN_AS_ROOT+x} ]]; then
    if [[ $EUID -eq 0 ]]; then
        echo "This script must NOT be ran as root"
        exit 1
    fi
else
    if [[ $EUID -ne 0 ]]; then
        echo "This script MUST BE ran as root"
        exit 1
    fi
fi

sudo true || exit

CURRENT_SCRIPT_PATH=$(realpath "${BASH_SOURCE[1]}")
CURRENT_SCRIPT=$(basename "$CURRENT_SCRIPT_PATH")

BASE_FILE_PATH=$(realpath "${BASH_SOURCE[0]}")
SCRIPTS_DIR=$(dirname "$BASE_FILE_PATH")
PROJECT_DIR=$(realpath "$SCRIPTS_DIR/..")
ASSETS_DIR=$(realpath "$PROJECT_DIR/assets")

RELEASE_NUMBER=$(rpm -E %fedora)

export ASSETS_DIR
export RELEASE_NUMBER

cd "$SCRIPTS_DIR" || exit

source "$ASSETS_DIR/base--env"

#################################### FILE #####################################

my:append-to-file-if-not-contains() {
    local FILE="$1"
    local CONTENT="$2"

    my:create-file "$FILE"

    if ! my:file-contains-line "$FILE" "$CONTENT"; then
        if [ -w "$FILE" ]; then
            echo "$CONTENT" | tee -a "$FILE" 1> /dev/null
        else
            echo "$CONTENT" | sudo tee -a "$FILE" 1> /dev/null
        fi
    fi
}

my:create-file() {
    local FILE="$1"

    my:create-parent-dirs "$FILE"
    touch "$FILE" 2> /dev/null || sudo touch "$FILE"
}

my:create-parent-dirs() {
    local FILE="$1"

    local PARENTS
    PARENTS=$(dirname "$FILE")

    mkdir -p "$PARENTS" 2> /dev/null || sudo mkdir -p "$PARENTS"
}

my:file-contains-line() {
    local FILE="$1"
    local CONTENT="$2"

    grep -Fxq "$CONTENT" "$FILE" 2> /dev/null || sudo grep -Fxq "$CONTENT" "$FILE"
}

my:link-file() {
    local FROM="$1"
    local TO="$2"

    my:create-parent-dirs "$TO"

    ln -f "$FROM" "$TO" 2> /dev/null \
        || cp "$FROM" "$TO" 2> /dev/null \
        || cp "$FROM" "$TO"
}

my:copy-file() {
    local FROM="$1"
    local TO="$2"

    my:create-parent-dirs "$TO"

    cp "$FROM" "$TO" 2> /dev/null \
        || sudo cp "$FROM" "$TO" 2> /dev/null \
        || sudo cp "$FROM" "$TO"
}

my:run-files() {
    sort -zn | xargs -0 -I '{}' bash '{}' \;
}

my:wait-file() {
    local FILE="$1"
    local TIME_WAITING=0;

    until [ -f "$FILE" ]; do
        sleep 1
        ((TIME_WAITING++))
        if [[ $TIME_WAITING -gt 20 ]]; then
            echo ''
            my:echo-error 'File not created after 20 seconds'
            return 1
        elif [[ $TIME_WAITING -eq 2 ]]; then
            my:echo-without-line-break "Waiting for file '$FILE' to be created "
        elif [[ $TIME_WAITING -gt 2 ]]; then
            my:echo-without-line-break "#"
        fi
    done

    if [[ $TIME_WAITING -ge 2 ]]; then
        echo ''
        echo 'File created'
    fi
}

################################### INSTALL ###################################

# my:dnf
my:dnf-install() {
    sudo dnf install -y -q "$@"
}

my:dnf-add-key() {
    local URL="$1"

    sudo rpm -v --import "$URL"
}

my:dnf-add-repo() {
    local URL="$1"

    sudo dnf config-manager addrepo --from-repofile="$URL" --overwrite
}

my:dnf-remove() {
    sudo dnf remove -y -q "$@"
}

# my:flatpak
my:flatpak-install() {
    flatpak install -y flathub "$@"
    sleep 0.5
    echo ''
}

# my:git
my:git-clone() {
    local REPOSITORY="$1"
    local DIRECTORY="$2"

    if [ -d "$DIRECTORY" ]; then
        my:echo-substep "Updating repo '$DIRECTORY'"
        git -C "$DIRECTORY" remote set-url origin "$REPOSITORY"

        local CURRENT_BRANCH
        CURRENT_BRANCH=$(git -C "$DIRECTORY" symbolic-ref --short -q HEAD)

        if [ -n "$CURRENT_BRANCH" ]; then
            echo "Pulling changes"
            git -C "$DIRECTORY" pull --rebase --prune
        else
            echo "Fetching changes"
            git -C "$DIRECTORY" fetch --prune
        fi
    else
        git clone "$REPOSITORY" "$DIRECTORY"
    fi
}

#################################### PRINT #####################################

# my:file-run
my:file-run-begin() {
    local FILE="$1"

    my:file-run-echo "FILE BEGIN: $FILE"
}

my:file-run-end() {
    local FILE="$1"

    echo ''
    my:file-run-echo "FILE END: $FILE"
    echo ''
}

my:file-run-echo() {
    local MESSAGE="$1"

    echo "$(tput setab 4)$(tput setaf 0)$MESSAGE$(tput el)$(tput sgr0)"
}

# my:step
my:step-begin() {
    local STEP="$1"

    echo ''
    my:echo-step "step: $STEP"
}

# my:echo
my:echo-step() {
    local MESSAGE="$1"

    echo "$(tput setab 7)$(tput setaf 0)$MESSAGE$(tput el)$(tput sgr0)"
}

my:echo-substep() {
    local MESSAGE="$1"

    echo "$(tput bold)$(tput setaf 4)$MESSAGE$(tput el)$(tput sgr0)"
}

my:echo-error() {
    local MESSAGE="$1"

    echo "$(tput setab 1)$(tput setaf 0)$MESSAGE$(tput el)$(tput sgr0)"
}

my:echo-without-line-break() {
    local MESSAGE="$1"

    echo -n "$MESSAGE"
}

################################################################################

if [ -n "$CURRENT_SCRIPT" ]; then
    my:file-run-begin "$CURRENT_SCRIPT"

    function my:on-exit {
        my:file-run-end "$CURRENT_SCRIPT"
    }

    trap my:on-exit EXIT
fi
