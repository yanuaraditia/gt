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
local shipAnchorY
-- write your code here

-- music and font
-- write your code here

-- references for game objects
local background
local ship
-- write your code here


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
  background = love.graphics.newImage('background.jpg')
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  centerX = width / 2
  shipAnchorY = height / 2 + 100
  ship = require('ship')
  ship.x = centerX
  ship.y = height + 64
  ship.moveTo(centerX, shipAnchorY)
end

function love.update(dt)
  ship.update(dt)
end

function love.draw()
  love.graphics.draw(background)
  ship.draw()
end

function love.mousepressed(x, y, button)
  ship.moveTo(x, shipAnchorY)
end

function love.mousemoved(x, y)
  if love.mouse.isDown(1) then
    ship.moveTo(x, shipAnchorY)
  end
end
