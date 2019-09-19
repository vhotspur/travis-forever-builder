#!/bin/sh

DEPLOY_KEY_FILE=`mktemp -u -p "$PWD"`
echo "$DEPLOY_KEY" >"$DEPLOY_KEY_FILE"

date '+%Y-%m-%d %H:%M:%S' >TRIGGER
git add TRIGGER
git commit -m "Updating to `cat TRIGGER`"

GIT_SSH_COMMAND="ssh -i $DEPLOY_KEY_FILE" git push 

rm -f "$DEPLOY_KEY_FILE"
