-- stars
-- for paralax effect

local stars = {}

-- array for 'dot' to represent star
stars.dots = {}
for i = 1, 20 do
  local d = {}
  d.x = math.random(10, love.graphics.getWidth() - 10) -- xpos
  d.y = math.random(0, love.graphics.getWidth()) -- y pos
  d.r = math.random(1, 3) -- radius
  -- insert 'd' to array:
  stars.dots[i] = d
end

function stars.update(dt)
  -- update each dot
  for i = 1, #stars.dots do
    local d = stars.dots[i]
    d.y = d.y + 0.5 * d.r 
    
    -- if a dot reach the bottom of screen
    if d.y >= love.graphics.getHeight() then
      -- reset the dot
      d.x = math.random(10, love.graphics.getWidth() - 10)
      d.y = math.random(-64, 0)
      d.r = math.random(1, 3)
    end
  end
end

function stars.draw()
  love.graphics.setColor(1, 1, 1, 0.5)
  for i = 1, #stars.dots do
    local d = stars.dots[i]
    love.graphics.circle('fill', d.x, d.y, d.r)
  end
end

return stars




