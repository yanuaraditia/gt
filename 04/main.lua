function love.load()
  midX = love.graphics.getWidth() / 2
  midY = love.graphics.getHeight() / 2
end

function love.update()
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0, 0, 0)
  love.graphics.setColor(0,1,0)
  love.graphics.translate(midX,midY)
  love.graphics.circle('fill', 0, 0, 25)
  love.graphics.print('Libur libur libur mantap jiwa',0,50)
end
