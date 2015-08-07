#! /usr/bin/env zsh

# racketest — continuously run racket tests
#
# Idea: http://stackoverflow.com/questions/7566569/

pat=${1?Must provide file glob pattern}  # ex: ./http/*(.)

autoload -Uz colors; colors

fail_icon=$0:h/red.png
pass_icon=$0:h/green.png

print "Setting up to watch $pat"
while true; do
  res=$( inotifywait --quiet --event modify,attrib,close_write,move,create,delete $pat )
  print "CHANGE\! res: $res"
  fl=$(cut -d' ' -f1 <<<$res)
  #print running tests for $fl
  if raco test -x $fl; then
    notify-send -u low -i $pass_icon "PASS" "Good job."
    print "$fg[green]####################$reset_color"
  else
    notify-send -u critical -i $fail_icon "FAIL" "Try again."
    print "$fg[red]####################$reset_color"
  fi
done
