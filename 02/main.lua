function love.load()
  anjay = love.graphics.newImage('asset/anjay.png')
  smumbul = love.audio.newSource('asset/mumbul.wav','static')
  ceblok = love.audio.newSource('asset/ceblok.wav','static')
  
  posX = love.graphics.getWidth() /  2
  posY = love.graphics.getHeight() /  2
  velo = 0
  
  grav = 0.68
end

function love.update()
  if posY + 100 <= love.graphics.getHeight() then
    velo = velo + grav
    posY = posY + velo
  end
  
  if posY + 100 == love.graphics.getHeight() then
    love.audio.play(cevlok)
  end
end

function love.draw()
  love.graphics.draw(anjay, posX, posY)
end

function love.mousepressed(x,y,button)
  love.audio.play(smumbul)
  
  velo = -17
end
