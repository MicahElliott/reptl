#! /usr/bin/env zsh

# racketest — continuously run racket tests
# http://stackoverflow.com/questions/7566569/

autoload -Uz colors; colors

#arg1=${1?Must provide arg}
dir='./http/*(.)'
fail_icon=$PWD/red.png
pass_icon=$PWD/green.png

print "Setting up to watch $dir"
while true; do
  res=$( inotifywait --quiet --event modify,attrib,close_write,move,create,delete ./http/*(.) )
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
