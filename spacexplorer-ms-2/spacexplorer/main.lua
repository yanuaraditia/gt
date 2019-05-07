---------------------------------------------------------------------------
-- SpaceXplorer
-- Author: (your name, your email)
-- 
-- main.lua
-- Main entry point
---------------------------------------------------------------------------

-- coordinates
local width
local height
local centerX
local centerY
local shipAnchorY

-- music and font
local bgmusic
local font

-- references for game objects
local background
local ship
local stars
local asteroids
local canon
local explosion

-- score and button
local score
local hiscore

-- circular collision detection
local function checkCollision()
  for i = #asteroids.rocks, 1, -1 do
    local r = asteroids.rocks[i]
    for j = #canon.missiles, 1, -1 do
      local m = canon.missiles[j]
      local dx = r.x - m.x
      local dy = r.y - m.y
      local d = math.sqrt(math.pow(dx,2) + math.pow(dy, 2))
      if d <= 8 then
        explosion.bang(r.x, r.y)
        table.remove(asteroids.rocks, i)
        table.remove(canon.missiles, j)
        score = score + 100
      end
    end
  end
end

-- show Head Up Display (HUD): score, hi-schore, and shield-bar
local function showHUD()
  love.graphics.print('goblok: ' .. score, 10, 10)
  love.graphics.print('pinter: ' .. hiscore, width - 125, 10)
  love.graphics.print('SOBAT GURUN', love.graphics.getWidth() / 2 - 45, love.graphics.getHeight() - 50)
end

-- reset the game
local function resetGame()
  -- write your code here
end

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  centerX = width / 2
  centerY = height / 2
  shipAnchorY = centerY + 100
  
  background = love.graphics.newImage('background.jpg')
  font = love.graphics.newFont('whitrabt.ttf')
  love.graphics.setFont(font)
  
  ship = require('ship')
  ship.x = centerX
  ship.y = height + 64
  ship.moveTo(ship.x, shipAnchorY)
  
  asteroids = require('asteroids')
  
  stars = require('stars')
  
  canon = require('canon')
  
  explosion = require('explosion')
  
  score = 0
  hiscore = 0
  
  bgmusic = love.audio.newSource('cavern.ogg', 'stream')
  bgmusic:setLooping(true)
  bgmusic:play()
end

function love.update(dt)
  stars.update(dt)
  asteroids.update(dt)
  canon.update(dt)
  ship.update(dt)
  checkCollision()
  explosion.update(dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  stars.draw()
  asteroids.draw()
  canon.draw()
  ship.draw()
  showHUD()
  explosion.draw()
end

function love.mousepressed(x, y, button)
  if button == 1 then
    ship.moveTo(x, shipAnchorY)
    canon.fire(ship.x, ship.y)
  end
end

function love.mousemoved(x, y)
  if love.mouse.isDown(1) then
    ship.moveTo(x, shipAnchorY)
  end
end
