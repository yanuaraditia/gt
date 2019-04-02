function love.load()
  -- Matahari
  sunX = 0
  sunY = 0
  
  -- Bumi
  bumiX = 180
  bumiY = 0
  bumiA = 0
  
  -- Bulan
  bulanX = 100
  bulanY = 0
  bulanA = 0
  
  angle = 0
  wX = love.graphics.getWidth() /2
  wY = love.graphics.getHeight() /2
  
  cometX = love.graphics.getWidth()
  cometY = 0
end

function love.update()
  bumiA = bumiA + 0.01
  bulanA = bulanA + 0.03
  
  cometX = cometX - 0.5
  cometY = cometY + 0.4
end

function love.draw()
  
  -- Lokalisasi koordinat
  love.graphics.push()
    -- Pindah center point
    love.graphics.translate(wX,wY)
    
    -- Matahari
    love.graphics.setColor(1,0,0)
    love.graphics.circle('fill',sunX,sunY,75)
    
    -- Bumi
    love.graphics.rotate(bumiA)
    love.graphics.translate(bumiX,bumiX)
    love.graphics.setColor(0,0,1)
    love.graphics.circle('fill',0,0,35)

    -- Bulan
    love.graphics.rotate(bulanA)
    love.graphics.setColor(0.5,0.5,0.5)
    love.graphics.circle('fill',bulanX,bulanY,20)
  love.graphics.pop()
  
  -- Nggambar comet nganggo koordinat original
  love.graphics.setColor(1,1,0)
  love.graphics.circle('fill',cometX, cometY, 7)
end
