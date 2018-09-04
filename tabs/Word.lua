Word = class()

function Word:init(x)
    -- you can accept and set parameters here
    self.x = x
end

function Word:name()
    return self.x.name
end

function Word:attributes()
    return self.x.attributes
end

function Word:contains(attr)
    for k,v in ipairs(self.x.attributes) do
        if attr == v then
            return true
        end
    end
    return false
end

function Word:hasName(name)
    return self.x.name == name
end

function Word:pickAttrib()
    return self.x.attributes[math.random(1, #self.x.attributes)]
end

function Word:draw()
    -- Codea does not automatically call this method
end

function Word:touched(touch)
    -- Codea does not automatically call this method
end
