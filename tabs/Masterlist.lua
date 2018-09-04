Masterlist = class()

local wordlist={
    {name="apple", attributes={"fruit"}},
    {name="pear", attributes={"fruit"}},
    {name="mango", attributes={"fruit"}},
    {name="banana", attributes={"fruit"}},
    {name="pineapple", attributes={"fruit"}},
    {name="kiwi fruit", attributes={"fruit"}},
    {name="tomato", attributes={"fruit"}},
    {name="broccoli", attributes={"vegetable"}},
    {name="spinach", attributes={"vegetable"}},
    {name="soap", attributes={"wash body"}},
    {name="body wash", attributes={"wash body"}},
    {name="hand soap", attributes={"wash hands"}},
    {name="shampoo", attributes={"wash hair"}},
    {name="owl", attributes={"animal", "bird", "has wings", "can fly"}},
    {name="eagle", attributes={"animal", "bird", "has wings", "can fly"}},
    {name="pigeon", attributes={"animal", "bird", "has wings", "can fly"}},
    {name="penguin", attributes={"animal", "bird", "has wings"}},
    {name="ostrich", attributes={"animal", "bird", "has wings"}},
    {name="kiwi bird", attributes={"animal", "bird", "has wings"}},
    {name="airplane", attributes={"vehicle", "has wheels", "has wings", "can fly"}},
    {name="car", attributes={"vehicle", "has wheels"}},
    {name="bicycle", attributes={"vehicle", "has wheels"}},
    {name="motorcycle", attributes={"vehicle", "has wheels"}},
    {name="police car", attributes={"vehicle", "has wheels"}},
    {name="fire truck", attributes={"vehicle", "has wheels"}}
}

function Masterlist:init()
    -- you can accept and set parameters here
    --self.x = x
    math.randomseed(os.time())
end

function Masterlist:pickOne()
    return Word(wordlist[math.random(1, #wordlist)])
end

function Masterlist:draw()
    -- Codea does not automatically call this method
end

function Masterlist:touched(touch)
    -- Codea does not automatically call this method
end
