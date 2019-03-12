-- hello

function love.load()
  posX = 200
  posY = 0
  velY = 0
  gForce = 0.068
end

function love.update()
  velY = velY + gForce
  posY = posY + velY
  if posY >= love.graphics.getHeight() then
    velY = velY * -1
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0.4,0.4,0.4)
  love.graphics.setColor(0,1,0)
  love.graphics.print('Asiaap',100,100)
  love.graphics.setColor(0,1,1)
  love.graphics.circle('fill',posX,posY,100)
end