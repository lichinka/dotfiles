#!/bin/sh
#
# poll.sh - A poll script for astroid.
#
# Intended to be run by astroid. See the following link for more information:
# https://github.com/astroidmail/astroid/wiki/Polling
#
# In particular, in order for this script to be run by astroid, it needs to be
# located at ~/.config/astroid/poll.sh
#

# Exit as soon as one of the commands fail.
set -e

# Check if we have a connection
if ! ping -w 1 -W 1 -c 1 8.8.8.8; then
    echo "There is no internet connection"
    exit
fi

# Fetch new mail.
offlineimap -c ~/.offlineimap/offlineimaprc -l ~/.offlineimap/offlineimap.log -o
