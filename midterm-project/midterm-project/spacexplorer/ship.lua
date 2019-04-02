-- ship

local ship = {}

local image = love.graphics.newImage('spaceship.png')
ship.x = 0
ship.y = 0
ship.dx = ship.x
ship.dy = ship.y
ship.shield = 3


local exhaustImg = love.graphics.newImage('exhaust.png')
local exhaust = love.graphics.newParticleSystem(exhaustImg, 500)
exhaust:setParticleLifetime(0.5,2)
exhaust:setEmissionRate(250)
exhaust:setSizeVariation(1)
exhaust:setLinearAcceleration(-5,30,5,35)
exhaust:setColors(1,1,0,1,1,0,0,0)

function ship.update(dt)
  dx = (ship.dx - ship.x) * 0.1
  dy = (ship.dy - ship.y) * 0.1
  
  ship.x = ship.x + dx
  ship.y = ship.y + dy
  
  exhaust:update(dt)
end

function ship.draw()
  love.graphics.draw(exhaust, ship.x - 17, ship.y + 25)
  love.graphics.draw(exhaust, ship.x + 17, ship.y + 25)
  love.graphics.draw(image, ship.x, ship.y, 0, 1, 1, 32, 32)
end

function ship.moveTo(x,y)
  ship.dx = x
  ship.dy = y
end

function ship.shake()
end

return ship