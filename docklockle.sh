#!/bin/sh
#!/usr/bin/env dash
# shellcheck shell=dash

################################
# docklockle.sh (POSIX syntax)

#

curVAL=$(defaults read com.apple.dock contents-immutable)
case $curVAL in 0) newVAL=true;  printf   'locked\n' >&2 ;;
                1) newVAL=false; printf 'unlocked\n' >&2 ;; esac
defaults write com.apple.dock  contents-immutable -bool $newVAL  &&  killall Dock
