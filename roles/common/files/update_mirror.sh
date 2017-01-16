#!/bin/bash
# usage ./update_mirror.sh <path_to_mirror>
# 
# Cron job runs every 20 minutes.  To avoid all the slaves querying the same
# git servers at exactly the same time, stagger the updates by sleeping for
# a random amount of time between 0 and 15 minutes
#
sleep $(expr $RANDOM % 900)

exec > /dev/null
cd $1
rm -f .git/gc.log
git prune
git remote update
git remote prune origin
git remote prune next
git remote prune arm-soc
git remote prune lsk
git remote prune rmk
git gc

# Hack for broken Jenkins git plugin which sometimes expects to see a
# '.git' dir, which doesn't exist in a bare repo
[[ ! -e .git ]] && ln -s . .git
