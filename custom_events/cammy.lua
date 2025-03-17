local noteTime = {1, 1.25, 1.5, 1.75}
local noteTimeOp = {1.75, 1.50, 1.25, 1}
local noteAngle = {5, -5}
local playerNotes = {4, 5, 6, 7}
local opponentNotes = {0, 1, 2, 3}
local stopTrigger = false

function onEvent(eventName, value1, value2)
    if eventName == 'cammy' then
        stopTrigger = value1 == 'false'
        if not stopTrigger then
            -- Tween the HUD camera to move downward
            doTweenAngle('hudMove', 'camHUD', 5, 2, 'sineInOut')
            doTweenZoom('hudZoomIn', 'camHUD', 1.05, 3, 'sineInOut')

            -- Trigger initial note tweens for opponent's notes
            for j = 1, #opponentNotes do
                noteTweenAngle('opponentNote' .. opponentNotes[j], opponentNotes[j], noteAngle[1], noteTime[j], 'sineInOut')
            end

            -- Trigger initial note tweens for player's notes
            for j = 1, #playerNotes do
                noteTweenAngle('playerNote' .. playerNotes[j], playerNotes[j], noteAngle[1], noteTime[j], 'sineInOut')
            end
        end
    end
end

function onTweenCompleted(tag)
    if not stopTrigger then
        -- Handle HUD camera tweens
        if tag == 'hudMove' then
            doTweenAngle('hudReset', 'camHUD', -5, 2, 'sineInOut')
        elseif tag == 'hudReset' then
            doTweenAngle('hudMove', 'camHUD', 5, 2, 'sineInOut')
        elseif tag == 'hudZoomIn' then
            doTweenZoom('hudZoomOut', 'camHUD', 0.95, 3, 'sineInOut')
        elseif tag == 'hudZoomOut' then
            doTweenZoom('hudZoomIn', 'camHUD', 1.05, 3, 'sineInOut')
        end

        -- Handle opponent note tweens
        for j = 1, #opponentNotes do
            if tag == 'opponentNote' .. opponentNotes[j] then
                noteTweenAngle('opponentNoteBack' .. opponentNotes[j], opponentNotes[j], noteAngle[2], noteTimeOp[j], 'sineInOut')
            elseif tag == 'opponentNoteBack' .. opponentNotes[j] then
                noteTweenAngle('opponentNote' .. opponentNotes[j], opponentNotes[j], noteAngle[1], noteTimeOp[j], 'sineInOut')
            end
        end

        -- Handle player note tweens
        for j = 1, #playerNotes do
            if tag == 'playerNote' .. playerNotes[j] then
                noteTweenAngle('playerNoteBack' .. playerNotes[j], playerNotes[j], noteAngle[2], noteTime[j], 'sineInOut')
            elseif tag == 'playerNoteBack' .. playerNotes[j] then
                noteTweenAngle('playerNote' .. playerNotes[j], playerNotes[j], noteAngle[1], noteTime[j], 'sineInOut')
            end
        end
    else
        -- Cancel all tweens and reset
        cancelTween('hudMove')
        cancelTween('hudReset')
        cancelTween('hudZoomIn')
        cancelTween('hudZoomOut')

        doTweenAngle('hudBack', 'camHUD', 0, 1, 'sineInOut')
        doTweenZoom('hudZoomBack', 'camHUD', 1, 1, 'sineInOut')

        for j = 1, #opponentNotes do
            cancelTween('opponentNoteBack' .. opponentNotes[j])
            noteTweenAngle('opponentNoteReset' .. opponentNotes[j], opponentNotes[j], 0, 1, 'sineInOut')
        end

        for j = 1, #playerNotes do
            cancelTween('playerNoteBack' .. playerNotes[j])
            noteTweenAngle('playerNoteReset' .. playerNotes[j], playerNotes[j], 0, 1, 'sineInOut')
        end
    end
end
