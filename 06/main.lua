-- simple collision detection

local world
local ground
local ball
local meterRatio
local info
local soundFX

local ballIm = love.graphics.newImage('am.png')

function love.load()
  love.window.setMode(650, 650)
  
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
  ball.fixture:setRestitution(0.91)
  
  info = 'Simple Collision Detection\n'
  soundFX = love.audio.newSource('mumbul.wav', 'static')
end

function love.update(dt)
  world:update(dt)
  
  if ball.body:isTouching(ground.body) then
    info = info .. ">> collision detected\n"
    soundFX:play()
  end
end

function love.draw()
  -- draw ground
  love.graphics.polygon('line', ground.body:getWorldPoints(ground.shape:getPoints()))
  -- draw ball
  love.graphics.circle('line', ball.body:getX(), ball.body:getY(), 25)
  
  love.graphics.print(info, 10, 10)
end