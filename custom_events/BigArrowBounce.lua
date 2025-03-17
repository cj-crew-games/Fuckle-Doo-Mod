function onEvent(name, value1, value2)
    stopTrigger = value1 == 'false'
    if name == 'BigArrowBounce' then
        local update = false
        local arrowStepCount = 1
        local stopTrigger = false
        if not stopTrigger then
            update = (value1 == 'true')
            intensity = value2

            function onBeatHit()
                if not update or isTweening then
                    return
                end

                arrowStepCount = arrowStepCount + 1
                if arrowStepCount > 4 then
                    arrowStepCount = 1
                end

                if value2 ~= 'step' then
                    if arrowStepCount == 2 then
                            cancelTween('hudZoomBack')
                            doTweenZoom('hudZoom1', 'camHUD', intensity + 0.1, crochet / 5000 + 0.6, 'sineInOut')
                    elseif arrowStepCount == 4 then
                            cancelTween('hudZoomBack')
                            doTweenZoom('hudZoom2', 'camHUD', intensity, crochet / 5000 + 0.6, 'sineInOut')
                    end
                end
            end

            function onTweenCompleted(tag)
                if tag == 'hudZoom1' then
                        doTweenZoom('hudZoomBack', 'camHUD', 1, crochet / 1000 / 2 - 0.01 + 0.5, 'sineInOut')
                end
            end
        end
    end
end
