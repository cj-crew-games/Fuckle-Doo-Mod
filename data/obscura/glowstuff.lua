function onCreatePost()
    -- Start the initial tween to the left
    doTweenAngle('glowL', 'glowin', 10, 3, 'cubeInOut')
    doTweenX('glowLslide', 'glowin', -600, 3, 'cubeInOut')
end

function onTweenCompleted(tag)
    if tag == 'glowL' or tag == 'glowLslide' then
        -- Tween back to the right
        doTweenAngle('glowR', 'glowin', -10, 3, 'cubeInOut')
        doTweenX('glowRslide', 'glowin', 0, 3, 'cubeInOut')
    elseif tag == 'glowR' or tag == 'glowRslide' then
        -- Tween back to the left
        doTweenAngle('glowL', 'glowin', 10, 3, 'cubeInOut')
        doTweenX('glowLslide', 'glowin', -600, 3, 'cubeInOut')
    end
end
