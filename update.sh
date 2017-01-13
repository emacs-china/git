#!/bin/bash
#
# This file is invoked by cron everyday.

# Some giant Git Repositories related to Emacs
repos=(
    'git://git.sv.gnu.org/emacs.git'
    'git://orgmode.org/org-mode.git'
    'https://bitbucket.org/mituharu/emacs-mac.git'
    'https://github.com/Wilfred/remacs.git'
)

# All Git Repositories will locate in this directory
GIT_DIR=/var/Emacs-China-Git-Mirrors

update_repo () {
    cd $GIT_DIR || exit

    repo=$1
    repo_name=$( basename $repo )

    if [ -d $repo_name ]; then
        cd $repo_name
        git remote update
    else
        git clone --mirror $repo
    fi
}

for i in "${repos[@]}"; do
    update_repo $i
done
