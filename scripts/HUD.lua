local maxMisses = 5  -- Set the miss limit
local currentMisses = 0  -- Track the number of misses

function onCreatePost()
    setProperty('timeTxt.visible',false)
    setProperty('timeBar.visible',false)
    setProperty('scoreTxt.visible',false)
    setProperty('iconP1.visible',false)
    setProperty('iconP2.visible',false)
    setProperty('healthBar.visible',false)
    
    -- Create the health indicator
    makeAnimatedLuaSprite('hpIndicator', 'huddy/hpbar', 1100, 500)  -- Adjust position if needed

    -- Add animation frames based on hpbar.xml
    addAnimationByPrefix('hpIndicator', 'hp0', 'Health5', 24, false) -- Empty
    addAnimationByPrefix('hpIndicator', 'hp1', 'Health4', 24, false)
    addAnimationByPrefix('hpIndicator', 'hp2', 'Health3', 24, false)
    addAnimationByPrefix('hpIndicator', 'hp3', 'Health2', 24, false)
    addAnimationByPrefix('hpIndicator', 'hp4', 'Health1', 24, false)
    addAnimationByPrefix('hpIndicator', 'hp5', 'Health0', 24, false) -- Full

    -- Start at empty
    objectPlayAnimation('hpIndicator', 'hp5', true)
    
    -- Add the indicator to the screen
    addLuaSprite('hpIndicator', true)
    setObjectCamera('hpIndicator', 'hud')
end

function onSongStart()
    -- Gradually fill up the health bar
    runTimer('fillHP1', 0.3)
    runTimer('fillHP2', 0.6)
    runTimer('fillHP3', 0.9)
    runTimer('fillHP4', 1.2)
    runTimer('fillHP5', 1.5)
end

function onTimerCompleted(tag)
    if tag == 'fillHP1' then
        objectPlayAnimation('hpIndicator', 'hp4', true)
    elseif tag == 'fillHP2' then
        objectPlayAnimation('hpIndicator', 'hp3', true)
    elseif tag == 'fillHP3' then
        objectPlayAnimation('hpIndicator', 'hp2', true)
    elseif tag == 'fillHP4' then
        objectPlayAnimation('hpIndicator', 'hp1', true)
    elseif tag == 'fillHP5' then
        objectPlayAnimation('hpIndicator', 'hp0', true) -- Fully filled
    end
end

function noteMiss()  -- Called when a player misses a note
    currentMisses = currentMisses + 1

    -- Update health indicator based on misses
    if currentMisses >= maxMisses then
        objectPlayAnimation('hpIndicator', 'hp5', true)  -- Fully depleted
        setProperty('health', 0)  -- Instantly kill the player
    else
        objectPlayAnimation('hpIndicator', 'hp'..currentMisses, true)
    end
end

local danceToggle = true  -- Variable to toggle between animations

function onCreate()
    makeAnimatedLuaSprite('manager', 'huddy/manaui', 0, 500)
    addAnimationByPrefix('manager', 'danceL', 'danceL', 8, false)  -- 'false' ensures it plays once per beat
    addAnimationByPrefix('manager', 'danceR', 'danceR', 8, false)
    addLuaSprite('manager', true)
    setObjectCamera('manager', 'other')
end

function onBeatHit()
    if danceToggle then
        objectPlayAnimation('manager', 'danceL', true)
    else
        objectPlayAnimation('manager', 'danceR', true)
    end
    danceToggle = not danceToggle  -- Switch between animations
end
