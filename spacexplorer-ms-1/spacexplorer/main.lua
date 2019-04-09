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

-- references for game objects
local background
local ship
local stars
local asteroids

-- score and button
-- write your code here

-- circular collision detection
local function checkCollision()
  -- write your code here
end

-- show Head Up Display (HUD): score, hi-schore, and shield-bar
local function showHUD()
  -- write your code here
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
  ship = require('ship')
  ship.x = centerX
  ship.y = height + 64
  ship.moveTo(ship.x, shipAnchorY)
  
  stars = require('stars')
  asteroids = require('asteroids')
  
  bgmusic = love.audio.newSource('cavern.ogg', 'stream')
  bgmusic:setLooping(true)
  bgmusic:play()
end

function love.update(dt)
  asteroids.update(dt)
  stars.update(dt)
  ship.update(dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  asteroids.draw()
  stars.draw()
  ship.draw()
end

function love.mousepressed(x, y, button)
  if button == 1 then
    ship.moveTo(x, shipAnchorY)
  end
end

function love.mousemoved(x, y)
  if love.mouse.isDown(1) then
    ship.moveTo(x, shipAnchorY)
  end
end
