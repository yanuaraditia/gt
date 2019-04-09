-- asteroids

-- create table
local asteroids = {}

local image = love.graphics.newImage('asteroid.png')
local et = 0 -- elapsed time

asteroids.rocks = {}

function asteroids.create(dt)
  local r = {}
  r.x  = math.random(10,love.graphics.getWidth() - 10)
  r.y = -64
  r.a = 0
  
  table.insert(asteroids.rocks, r)
end

function asteroids.update(dt)
  asteroids.create(dt)
  
  for i = #asteroids.rocks,1,-1 do
    local r = asteroids.rocks[i]
    r.y = r.y + 2
    r.a = r.a + 0.005
  end
end

function asteroids.draw()
  for i = #asteroids.rocks, 1, -1 do
    local r = asteroids.rocks[i]
    love.graphics.draw(image, r.x, r.y, r.a, 1, 1, 16, 16)
  end
end

return asteroids