function onCountdownStarted()
    runHaxeCode([[ 
        for (strum in game.opponentStrums) {
            strum.cameras = [game.camGame]; 
            strum.scrollFactor.set(1, 1); 
            strum.scale.x = 0.4; 
            strum.scale.y = 0.4; 
        } 
        
        for (note in game.unspawnNotes) {
            if (!note.mustPress) {
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

function onUpdatePost(elapsed)
    setObjectOrder('floor', getObjectOrder('opponentStrums.members[1]') + 9)
    setObjectOrder('dadGroup', getObjectOrder('floor') + 16)
    setObjectOrder('gfGroup', getObjectOrder('floor') + 17)
    setObjectOrder('boyfriendGroup', getObjectOrder('floor') + 17)
end

function onSongStart()
    for i = 0, 3 do
        noteX = getPropertyFromGroup('strumLineNotes', i, 'x')
        noteTweenX('coolnotes' .. i, i, noteX + 1200, 0.01, 'linear')
    end
end