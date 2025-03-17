function onEvent(name,value1,value2)
    if name == 'Flash' then
        if value1 == '' then
            value1 = 'FFFFFF'
        end
        cameraFlash('camGame', value1, value2, true)
    end
end