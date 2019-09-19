#!/bin/sh

MY_TEMP=`mktemp -d`
export GIT_SSH_COMMAND="ssh -i $PWD/deploy_key"

git clone "git@github.com:$TRAVIS_REPO_SLUG.git" "$MY_TEMP"

(
    cd "$MY_TEMP"

    date '+%Y-%m-%d %H:%M:%S' >TRIGGER
    git add TRIGGER
    git commit -m "Updating to `cat TRIGGER`"
    git push
)
