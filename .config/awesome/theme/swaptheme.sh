#!/bin/zsh

# swapping the file theme.lua with theme.lua.bak

mv theme.lua tmp.lua
mv theme.lua.bak theme.lua
mv tmp.lua theme.lua.bak
