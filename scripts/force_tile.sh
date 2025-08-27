#!/bin/zsh

state=$(grep 'force tiling' ~/.config/awesome/rc.lua)
echo $state
if [[ "$state" == '--[[ force tiling' ]]
then
        sed -i 's/--\[\[ force tiling/-- \[\[ force tiling/' ~/.config/awesome/rc.lua
        echo "True"
else
        sed -i 's/-- \[\[ force tiling/--\[\[ force tiling/' ~/.config/awesome/rc.lua
        echo "False"
fi
