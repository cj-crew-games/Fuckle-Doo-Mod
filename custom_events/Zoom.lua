local stopUpdate = false

function onEvent(name, value1, value2)
    if name == 'Zoom' then
        stopUpdate = false
        doTweenZoom('camzoom', 'camGame', value1, value2, 'sineInOut')
    end
    if name == 'ZoomCancel' then 
        stopUpdate = true
        cancelTween('camzoom')
        doTweenZoom('camzoomnew', 'camGame', getProperty('defaultCamZoom'), 1, 'sineInOut')
    end
end