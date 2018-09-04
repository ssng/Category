-- Category
displayMode(OVERLAY)
displayMode(FULLSCREEN)
hideKeyboard()
supportedOrientations(LANDSCAPE_ANY)
local NCARDS = 6

-- Soda

--displayMode(OVERLAY)
--displayMode(FULLSCREEN)
-- Use this as a template for your projects that have Soda as a dependency. 

function setup()
    math.randomseed(os.time())
    saveProjectInfo("Description", "Soda v"..Soda.version) 
    profiler.init(false)    -- arg tells profiler whether to be quiet
    Soda.setup()
    --parameter.watch("Soda.focus.title")
    --overview{}
    -- demo1() --do your setting up here
    list = Masterlist()
    newSession()
end

function draw()
    --do your updating here
    pushMatrix()
    Soda.camera()
    drawing()
    popMatrix()
    profiler.draw()
    fill(255, 0, 148, 255)
    font("HelveticaNeue-Bold")
    fontSize(82)
    textWrapWidth(WIDTH - 20)
    text(attribute, WIDTH/2, HEIGHT*0.75)

    if timer > 0 and ElapsedTime - timer > 2 then
        newSession()
    end
end

function drawing(breakPoint) 
    --in order for gaussian blur to work, do all your drawing here
    background(40, 40, 50)
    --background(66, 75, 81, 255)
    --sprite("Cargo Bot:Game Area", WIDTH*0.5, HEIGHT*0.5, WIDTH, HEIGHT)
    Soda.draw(breakPoint)
end

function newSession()
    timer = 0
    -- pick N words
    words = {}
    local unique = {} -- used for detecting collisions
    for i = 1, NCARDS do
        words[i] = list:pickOne()
        while unique[words[i]:name()] ~= nil do
            words[i] = list:pickOne()
        end
        unique[words[i]:name()] = true
    end
    -- pick one attrib from one card at random
    attribute = words[math.random(1, NCARDS)]:pickAttrib()
    print(attribute)
    local cardpos = {
        {x = 0.15 + 0.02, y = 0.2},
        {x = 0.5, y = 0.2},
        {x = 1 - 0.15 - 0.02, y = 0.2},
        {x = 0.15 + 0.02, y = 0.48},
        {x = 0.5, y = 0.48},
        {x = 1 - 0.15 - 0.02, y = 0.48}
    }
    -- create the cards to display
    cards = {}
    solution = 0
    for i = 1, NCARDS do
        local bitmask = math.floor(2 ^ (i - 1))
        print(bitmask)
        cards[i] = Card(words[i], cardpos[i].x, cardpos[i].y, bitmask)
        -- generate a bitmask of the correct solution
        if words[i]:contains(attribute) then
            solution = solution | bitmask
        end
    end
    print("solution: " .. solution)
end
--user inputs:

function touched(touch)
   if Soda.touched(touch) then return end
    --your touch code goes here
end

function keyboard(key)
    Soda.keyboard(key)
end

function orientationChanged(ori)
    Soda.orientationChanged(ori)
end

--measure performance:

profiler={}

function profiler.init(quiet)    
    profiler.del=0
    profiler.c=0
    profiler.fps=0
    profiler.mem=0
    if not quiet then
        parameter.watch("profiler.fps")
        parameter.watch("profiler.mem")
    end
end

function profiler.draw()
    profiler.del = profiler.del +  DeltaTime
    profiler.c = profiler.c + 1
    if profiler.c==10 then
        profiler.fps=profiler.c/profiler.del
        profiler.del=0
        profiler.c=0
        profiler.mem=collectgarbage("count", 2)
    end
end

