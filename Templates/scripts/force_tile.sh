#!/bin/zsh

state=$(grep 'force tiling' ~/.config/awesome/rc.lua)
if [ $"state"='--[[ force tiling' ]
then
        sed -i 's/--\[\[ force tiling/-- \[\[ force tiling/' ~/.config/awesome/rc.lua
else
        sed -i 's/-- \[\[ force tiling/--\[\[ force tiling/' ~/.config/awesome/rc.lua
fi
