function onEvent(name,value1,value2)
    if name == 'Fade' then
        if value1 == '' then
            value1 = 'FFFFFF'
        end
        cameraFade('camGame', value1, value2, true)
    end
end