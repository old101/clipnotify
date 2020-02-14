#!/bin/bash

trap 'echo "TRAP" |xsel -b; exit 11' INT
>/tmp/CurrentClip.txt
echo "NULL" |xsel -b

while clipnotify;
do
#  SelectedText="$(xsel)"
  CopiedText="$(xsel -b)"
  if [[ "$SelectedText" != "$CopiedText" ]]; then
    echo "$CopiedText" >>/tmp/CurrentClip.txt
    echo copy...
fi
SelectedText="${CopiedText}"
done
