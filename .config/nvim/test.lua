local file = io.open("~/.local/state/nvim/custom/transparent.txt","r")
local transparent_state = false
if file then
  transparent_state = file:read()
else
  os.execute("mkdir -p ~/local/state/nvim/custom && 'false' > transparent.txt")
end

local save_transparent_state = function () 
  local file = io.open("~/.local/state/nvim/custom/transparent.txt","w")
  file:write()

end 
