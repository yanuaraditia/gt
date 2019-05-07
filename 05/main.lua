-- physics demo

local world
local ground
local ball
local meterRatio 

function love.load()
  love.window.setMode(650, 650)
  love.graphics.setBackgroundColor(0.41,0.53,0.97)
  
  meterRatio = 64  -- skala satuan meter ke pixel
  
  -- world
  love.physics.setMeter(meterRatio)
  world = love.physics.newWorld(0, 9.81 * meterRatio, true)
  
  -- ground definition
  ground = {}
  ground.body = love.physics.newBody(world, 325, 625, 'static')
  ground.shape = love.physics.newRectangleShape(650, 50)
  ground.fixture = love.physics.newFixture(ground.body, ground.shape, 1)
    
  -- ball
  ball = {}
  ball.body = love.physics.newBody(world, 325, 325, 'dynamic')
  ball.shape = love.physics.newCircleShape(25)
  ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1)
  ball.fixture:setRestitution(0.99)
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  -- draw ground
  love.graphics.setColor(0.28, 0.63, 0.05)
  love.graphics.polygon('fill', ground.body:getWorldPoints(ground.shape:getPoints()))
  
  -- draw ball
  love.graphics.setColor(0.76, 0.18, 0.05)
  love.graphics.circle('fill', ball.body:getX(), ball.body:getY(), ball.shape:getRadius())
end
