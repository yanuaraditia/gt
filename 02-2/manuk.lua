manuk = {
  posX = love.graphics.getWidth() / 2,
  posY = 0,
  velY = 0,
  urip = true,
}
manuk.mabur = function()
  manuk.velY = -10
end

manuk.ceblok = function()
  if manuk.urip then
    manuk.velY = manuk.velY + grav
    manuk.posY = manuk.posY + manuk.velY
  end
end