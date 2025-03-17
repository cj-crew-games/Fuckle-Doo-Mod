function onCountdownStarted()
    runHaxeCode([[ 
        for (strum in game.playerStrums) {
            strum.cameras = [game.camGame]; 
            strum.scrollFactor.set(1, 1); 
            strum.scale.x = 0.45; 
            strum.scale.y = 0.45; 
        } 
        
        for (note in game.unspawnNotes) {
            if (note.mustPress) {
                note.cameras = [game.camGame]; 
                note.scrollFactor.set(1, 1); 
                note.scale.x = 0.4; 
                note.scale.y = 0.4; 
                if (note.isSustainNote) {
                    note.scale.y = 2.5; 
                }
            } 
        }
    ]])
end

function onSongStart()
    for i = 4, 7 do
        noteX = getPropertyFromGroup('strumLineNotes', i, 'x')
        noteTweenX('coolnotes' .. i, i, noteX + 1200, 0.01, 'linear')
    end
end

function onCreatePost()
    local spacing = 80
    local startX = getPropertyFromGroup('playerStrums', 0, 'x')

    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'x', startX + (i * spacing))
    end
end

function onSongStart()
    for i = 0, 3 do -- Loop through player notes (0 to 3)
        local noteX = getPropertyFromGroup('playerStrums', i, 'x')
        local noteY = getPropertyFromGroup('playerStrums', i, 'y')
        
        noteTweenX('noteX' .. i, i + 4, noteX + 330, 0.01, 'quadOut')
        noteTweenY('noteY' .. i, i + 4, noteY + 200, 0.01, 'quadOut')
    end
end