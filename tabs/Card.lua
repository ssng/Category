Card = class()

local CARDWIDTH = 0.3
local CARDHEIGHT = 0.2

function Card:init(word, x, y, bitmask)
    print("bitmask: " .. bitmask)
    -- you can accept and set parameters here
    self.word = word
    self.x = x
    self.y = y
    self.bitmask = bitmask
    self:newButton()
end

function Card:draw()
    -- Codea does not automatically call this method
end

function Card:touched(touch)
    -- Codea does not automatically call this method
    print("touched")
end

function Card:newButton()
	local newButton = Soda.Button{
		title = self.word:name(),       
		h = CARDHEIGHT, w = CARDWIDTH, x = self.x, y = self.y,
		style =  {
    --font("Optima-ExtraBlack")
  			shape = { fill = color(255, 255, 255, 255), strokeWidth = 1 },
			text = { font = "Optima-ExtraBlack", fontSize = 2.3,
                fill = color(9, 132, 226, 255)}
		},
		shadow = false,
		shapeArgs = { radius = 50.0 },
        word = self.word,
        selected = false,
        bitmask = self.bitmask,
        callback = function(self)
            print(self.title)
            print(attribute)
            if self.word:contains(attribute) then
                if solution > 0 then
                    sound("Game Sounds One:Bell 2")
                end
                if not self.selected then
                    self.selected = true
                    solution = solution ~ self.bitmask
                    self.style.shape.fill = color(55, 55, 55, 255)
                    if solution == 0 then
                        sound("Game Sounds One:Female Cheer 2")
                        timer = ElapsedTime
                    end
               end
            else
                if solution > 0 then
                    sound("Game Sounds One:Wrong")
                end
            end
            print("solution :" .. solution)
        end
	}
    return newButton
	--background filename used: Cargo Bot:Game Area
end

