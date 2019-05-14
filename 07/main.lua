-- simple collision detection

local world
local ground
local ball
local meterRatio
local info
local soundFX


function love.load()
  love.window.setMode(650, 650)
  
  meterRatio = 64  -- skala satuan meter ke pixel
  
  -- world
  love.physics.setMeter(meterRatio)
  world = love.physics.newWorld(0, 9.81 * meterRatio, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
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
end

function love.draw()
  -- draw ground
  love.graphics.polygon('line', ground.body:getWorldPoints(ground.shape:getPoints()))
  -- draw ball
  love.graphics.circle('line', ball.body:getX(), ball.body:getY(), 25)
  
  love.graphics.print(info, 10, 10)
end

function beginContact(a,b,coll)
  info = info .. 'beginContact() triggered\n'
  soundFX:play()
end

function endContact(a,b,coll)
  info = info .. 'endContact() triggered\n'
end

function preSolve(a,b,coll)
  info = info .. 'preContact() triggered\n'
end

function postSolve(a,b,coll)
  info = info .. 'postContact() triggered\n'
end