-- asteroids

-- create table
local asteroids = {}

local image = love.graphics.newImage('asteroid.png')
local et = 0 -- elapsed time

-- array for asteroid's rock
asteroids.rocks = {}

function asteroids.create()
  local r = {}
  r.x = math.random(10, love.graphics.getWidth() - 10)
  r.y = -64
  r.a = 0
  
  -- insert the rock into array
  table.insert(asteroids.rocks, r)
end

function asteroids.update(dt)
  et = et + dt
  if et >= 2 then
    asteroids.create()
    et = 0
  end
  
  for i = #asteroids.rocks, 1, -1 do
    local r = asteroids.rocks[i]
    r.y = r.y + 2
    r.a = r.a + 0.005
    
    -- if a rock reach the bottom of screen
    if r.y >= love.graphics.getHeight() + 32 then
      -- remove from array
      table.remove(asteroids.rocks, i)
    end
  end
end

function asteroids.draw()
  love.graphics.setColor(1, 1, 1, 1)
  for i = #asteroids.rocks, 1, -1 do
    local r = asteroids.rocks[i]
    love.graphics.draw(image, r.x, r.y, r.a, 1, 1, 16, 16)
  end
end

return asteroids