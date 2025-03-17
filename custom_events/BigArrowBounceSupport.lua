local stopUpdate = false
local arrowStepCount = 1

function onEvent(name, value1, value2)
    if name == 'BigArrowBounceSupport' then
        stopTrigger = value1 == 'false'
        setProperty('camZoomingMult', 0)
        
        if not stopUpdate then
            function onBeatHit()
                if stopUpdate then return end
        
                arrowStepCount = (arrowStepCount % 4) + 1
        
                for i = 0, 7 do
                    if not getPropertyFromGroup('strumLineNotes', i, 'isBeingPressed') then
                        cancelTween('firstother' .. i)
                        cancelTween('biggie' .. i)
                        cancelTween('second' .. i)
        
                        if arrowStepCount <= 3 then
                            noteTweenY('firstother' .. i, i, defaultPlayerStrumY0, crochet / 2000, 'sineInOut')
                        elseif arrowStepCount == 4 then
                            noteTweenY('biggie' .. i, i, defaultPlayerStrumY0 + 40, crochet / 2000, 'sineInOut')
                        end
                    end
                end
            end
        
            function onTweenCompleted(tag)
                for i = 0,7 do
                    if tag == 'firstother'..i then
                        runTimer('wait', crochet / 1000 / 4)
                    end
                end
            end
        
            function onTimerCompleted(tag)
                if tag == 'wait' then
                    for i = 0, 7 do
                        if not getPropertyFromGroup('strumLineNotes', i, 'isBeingPressed') then
                            cancelTween('second' .. i)
                            noteTweenY('second' .. i, i, defaultPlayerStrumY0 + 100, crochet / 2000, 'sineIn')
                        end
                    end
                end
            end
        else
            setProperty('camZoomingMult', 1)
        end
    end
end
