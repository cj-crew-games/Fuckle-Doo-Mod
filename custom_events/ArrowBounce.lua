local stopUpdate = false
local arrowStepCount = 1
local bounceAmount = 0
local bounceMode = ''

function onEvent(name, value1, value2)
    if name == 'ArrowBounce' then
        stopUpdate = false
        bounceAmount = tonumber(value1) or 0
        bounceMode = value2 or ''

    elseif name == 'ArrowCancel' then
        stopUpdate = true
    end
	function onBeatHit()
    if stopUpdate then
        return
    end
        arrowStepCount = arrowStepCount + 1
        if arrowStepCount > 4 then
            arrowStepCount = 1
        end
        for i = 0, 7 do
            if arrowStepCount == 1 or arrowStepCount == 2 or arrowStepCount == 3 then
                cancelTween('first'..i)
                cancelTween('second'..i)
                noteTweenY('firstother' .. i, i, defaultPlayerStrumY0, crochet / 1000 / 2, 'sineInOut')
            elseif arrowStepCount == 4 then
                cancelTween('firstother'..i)
                noteTweenY('firstother' .. i, i, defaultPlayerStrumY0+40, crochet / 1000 / 2, 'sineInOut')
            end
        end
end

function onTweenCompleted(tag)
    if tag == 'firstother7' then
        runTimer('wait', crochet / 1000 / 8)
    end
end

function onTimerCompleted(tag)
    if tag == 'wait' then
        for i = 0, 7 do
            noteTweenY('second' .. i, i, defaultPlayerStrumY0 + bounceAmount, crochet / 1000 / 2, 'sineIn')
        end
    end
end
end

