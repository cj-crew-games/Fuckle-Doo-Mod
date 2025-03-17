function onCreate()
    -- Create the opponent character
    makeAnimatedLuaSprite('opponent', 'stage/bald/yctpnotes', 480, 480) -- Adjust position as needed
    
    -- Scale the sprite (change values as needed)
    scaleObject('opponent', 2.5, 2.5) -- 1.5x size (change this value)

    -- Add animations using names from your XML file
    addAnimationByPrefix('opponent', 'L', 'L', 24, false) -- Left animation
    addAnimationByPrefix('opponent', 'D', 'D', 24, false) -- Down animation
    addAnimationByPrefix('opponent', 'U', 'U', 24, false) -- Up animation
    addAnimationByPrefix('opponent', 'R', 'R', 24, false) -- Right animation
    addAnimationByPrefix('opponent', 'NONE', 'NONE', 24, false) -- Idle animation

    -- Set opponent to idle initially
    playAnim('opponent', 'NONE', true)

    -- Add to game
    addLuaSprite('opponent', false)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then -- Ignore sustain notes
        playAnim('opponent', getSingAnimation(direction), true)
        runTimer('resetIdle', 0.6) -- Wait 0.3 seconds before switching to idle
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resetIdle' then
        playAnim('opponent', 'NONE', true) -- Reset to idle after timer ends
    end
end

function getSingAnimation(direction)
    local animations = {'L', 'D', 'U', 'R'}
    return animations[direction + 1] -- Directions: 0 = Left, 1 = Down, 2 = Up, 3 = Right
end

function onStepHit()
    if curStep == 893 then
        removeLuaSprite('opponent', true) -- Remove the opponent from the game
    end
end