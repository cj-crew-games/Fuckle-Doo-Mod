local defaultPlayerStrum = {
    [4] = 732,
    [5] = 844,
    [6] = 956,
    [7] = 1068
}

-- Function to create the background boxes
function onCreate()  
    local function createBox(name, xPos)
        makeLuaSprite(name, '', xPos, 0)
        makeGraphic(name, 190, 720, '000000')
        addLuaSprite(name)
        setObjectCamera(name, 'other')
    end

    createBox('box', 0)
    createBox('box1', 1100)
end

function onCreatePost()
    -- Move the default HUD elements off-screen
    setProperty('scoreTxt.y', -500)
    setProperty('healthBar.y', -500)
    setProperty('healthBarBG.y', -500)
    setProperty('iconP1.y', -500)
    setProperty('iconP2.y', -500)
    setProperty('timeBar.y', -500)
    setProperty('timeBarBG.y', -500)
    setProperty('timeTxt.y', -500)
    setProperty('scoreTxt.alpha', 0)  -- Hide score text
    setProperty('timeTxt.alpha', 0)   -- Hide time text

    -- Move the player's notes (so it doesn't overwrite the HUD movement)
    for i = 4, 7 do
        noteTweenX('shiftNote' .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') - 600, 0.01, 'linear')
    end
end


-- Ensures consistent HUD zoom level after every update
function onUpdatePost(elapsed)
    setProperty('camHUD.zoom', 0.85)
end

-- Handles actions when the player reaches step 1820
function onStepHit()
    if curStep == 1820 then
        doTweenX('boxLeft', 'box', -600, 4, 'cubeIn')
        doTweenX('boxRight', 'box1', 1700, 4, 'cubeIn')

        -- Apply initial angle to the notes
        for i = 4, 7 do
            noteTweenAngle('initialAngle'..i, i, 25, 0.4, 'sineInOut')
        end
    end
end

-- Handle tween completion to trigger further actions
function onTweenCompleted(tag)
    if tag == 'initialAngle7' then
        for i = 4, 7 do
            noteTweenX('notesMove' .. i, i, defaultPlayerStrum[i] - 800, 3, 'sineInOut')
            noteTweenAngle('otherAngle'..i, i, -45, 0.8, 'sineInOut')
        end
    end

    if tag == 'otherAngle7' then 
        for i = 4, 7 do
            noteTweenAngle('finalAngle'..i, i, 360, 2, 'sineInOut')
        end
    end
end

function onCreatePost()
    for i = 4, 7 do
        noteTweenX('shiftNote' .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') - 600, 0.01, 'linear')
    end
end