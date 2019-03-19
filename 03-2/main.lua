function love.load()
  anjay = love.graphics.newImage('manuk.png')
  posX = love.graphics.getWidth() / 2
  posY = love.graphics.getHeight() / 2  
  
  velX = 0
  velY = 0
  
  desX = 0
  desY = 0
end

function love.update()
  posX = posX + velX
  posY = posY + velY
  
  if posX == desX and posY == desY then
    velX, velY = 0, 0
  end
end

function love.mousepressed(x, y)
  desX, desY = x, y
  velX = desX - posX
  velY = desY - posY
  
  local dist = math.sqrt(math.pow(velX, 2) + math.pow(velY, 2))
  
  velX = velX / dist
  velY = velY / dist
end

function love.draw()
  love.graphics.setBackgroundColor(0.8, 0.9, 1.0)
  love.graphics.draw(anjay, posX, posY)
end

function love.keypressed(key, scancode)
  if key == 'escape' then
    love.event.quit(0)
  end
end