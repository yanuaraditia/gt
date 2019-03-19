function love.load()
  anjay = love.graphics.newImage('manuk.png')
  posX = love.graphics.getWidth() / 2
  posY = love.graphics.getHeight() / 2  
end

function love.update()
  if love.keyboard.isDown('up') then
    posY = posY - 20
  elseif love.keyboard.isDown('down') then
    posY = posY + 20
  elseif love.keyboard.isDown('left') then
    posX = posX - 20
  elseif love.keyboard.isDown('right') then
    posX = posX + 20
  end
end

function love.mousepressed(x, y)
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