local stepCount = 1
local realValue1 = 1.1
local realValue2 = 0
local defaultCamZoom = getProperty('camGame.zoom') 



function onEvent(eventName, value1, value2)
    realValue1 = value1
    realValue2 = value2
    if eventName == 'ZoomLoop' then
        setVar('stopUpdate',false)
    end
end

function onUpdate()
    if getVar('stopUpdate') == true then
        cancelTween('camzoomin')
        cancelTween('camzoomout')
    end
end

function onBeatHit()
    defaultCamZoom = getProperty('camGame.zoom')
    if getVar('stopUpdate') == false then
        if realValue2 == 'step' then
            stepCount = stepCount + 1
            if stepCount > 4 then
                stepCount = 1
            end
            if stepCount == 1 or stepCount == 3 then
                doTweenZoom('camzoominstep', 'camGame', realValue1, 0.01, 'sineInOut')
                doTweenZoom('camzoomoutstep', 'camGame', defaultCamZoom, crochet/1000, 'cubeOut')
            end
        else
            doTweenZoom('camzoomin', 'camGame', realValue1, 0.01, 'sineInOut')
            doTweenZoom('camzoomout', 'camGame', defaultCamZoom, crochet/1000, 'cubeOut')
        end
    end
end
