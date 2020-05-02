#!/bin/sh
#!/usr/bin/env dash
# shellcheck shell=dash

################################
# dockzwer.sh

# shellcheck disable=SC1112

Vd='-d  use Dock’s Documents side instead of Applications side'
Vs='-s  use a small spacer'
Vl='-l  run docklockle afterwards?'
Vh='-h  print this help'

dUsage () {
  printf 'Usage:  %s [[-ds] | [-h]]\n'    "$(basename "$0")"
}

dHelp () {
  printf 'Add spacer tiles to the Dock to devide its icons into groups.\n%s\nOptions:
    %s.\n        Without options, a spacer is placed on Dock’s Applications side.
        Use this option to place the spacer on Dock’s Documents side.
    %s.\n        Without options, spacer has the same size as other icons in the Dock.
        Use this option to place a spacer with half the width.
    %s.\n'  \
      "$(dUsage)"  "${Vd}"  "${Vs}"  "${Vh}"    &&    exit 0
}

illOptArg () {
  printf '\e[41m \e[0m Illegal option/argument ignored\n%s\n  %s\n  %s\n  %s\n  %s\n'    "$(dUsage)"  "${Vd}"  "${Vs}"  "${Vl}"  "${Vh}"
}

if  [ -n "$*" ];  then  while getopts ':dlsh' opt;  do  case  ${opt} in
    d) side='others';;    l) lockle=true;;    s) small=1;;    h) dHelp;;    \?) ill=1;;
        esac;  done;  shift $((OPTIND -1));  fi

if  [ -n "${*}" ];  then  illOptArg  >&2
else
  if [ -n "${ill}" ];  then illOptArg >&2;  fi
fi

defaults write 'com.apple.dock' persistent-"${side:-apps}"  \
  -array-add '{tile-data={};tile-type='"${small:+small-}"'spacer-tile;}'  &&  killall Dock

if  [ -n "${lockle}" ];  then  "$(dirname "$0")"'/docklockle.sh'; fi
