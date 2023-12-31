hud = {}

function hud:init(player)
    self.player = player
    self.selected = 1
end

function hud:keypressed(key, scancode, isrepeat)
    if key == "1" then
        self.selected = 1
    elseif key == "2" then
        self.selected = 2
    elseif key == "3" then
        self.selected = 3
    elseif key == "4" then
        self.selected = 4
    elseif key == "5" then
        self.selected = 5
    end
end

function hud:drawHealth()
    love.graphics.rectangle("line", 16, 16, 20*16, 32)
    love.graphics.rectangle("fill", 16, 16, self.player:getHealth() * 16, 32)
end


function hud:drawItems()
    local itemSpriteSize = 64
    local items = self.player:getItems()

    for i=1,table.getn(items) do
        love.graphics.draw(
            sprites.images.items,
            items[i].sprite,
            i*itemSpriteSize,
            love.graphics.getHeight() - itemSpriteSize - 20)
        if self.selected == i then
            love.graphics.rectangle("line",
                i*itemSpriteSize,
                love.graphics.getHeight() - itemSpriteSize - 20,
                itemSpriteSize,
                itemSpriteSize)
        end
    end
end

function hud:drawMoney()
end

function hud:draw()
    self:drawItems()
    self:drawMoney()
    self:drawHealth()
end

function hud:update(player)
    self.player = player
end
