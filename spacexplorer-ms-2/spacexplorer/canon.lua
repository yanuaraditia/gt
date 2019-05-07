-- canon

-- create table
local canon = {}

local image = love.graphics.newImage('missile.png')
local sound = love.audio.newSource('laser.wav','static')
canon.missiles = {}

function canon.fire(x,y)
  local m = {}
  m.x = x
  m.y = y
  
  table.insert(canon.missiles, m)
  sound:play()
end

function canon.update(dt)
  for i = #canon.missiles, 1, -1 do
    local m = canon.missiles[i]
    m.y = m.y - 10
    
    if m.y <= -6 then
      table.remove(canon.missiles,i)
    end
  end
end

function canon.draw()
  for i = #canon.missiles, 1, -1 do
    local m = canon.missiles[i]
    love.graphics.draw(image, m.x, m.y, 0, 1, 1, 1, 0)
  end
end

return canon