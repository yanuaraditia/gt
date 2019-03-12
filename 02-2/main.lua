function love.load()
  anjay = love.graphics.newImage('asset/anjay.png')
  smumbul = love.audio.newSource('asset/mumbul.wav','static')
  ceblok = love.audio.newSource('asset/ceblok.wav','static')  
  grav = 0.68
  
  require('manuk')
end

function love.update()
  manuk.ceblok()
end

function love.draw()
end

function love.mousepressed(x,y,button)
  manuk.mabur()
end
