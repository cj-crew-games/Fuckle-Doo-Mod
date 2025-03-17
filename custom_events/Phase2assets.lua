function onEvent(name,value1,value2)
    if name == 'Phase2assets' then
        if value1 == 'phase2' then
            setProperty('sky.visible', false)
			setProperty('grond.visible', false)
			----------------------------------- phase 2
			setProperty('Goombap.visible', true)
			setProperty('Mariop.visible', true)
			setProperty('void.visible', true)
		    setProperty('debrie1.visible', true)
	        setProperty('debrie2.visible', true)
			setProperty('pipe1.visible', true)
	        setProperty('pipe2.visible', true)
	        setProperty('glowin.visible', true)
			setProperty('glowside.visible', true)
	        setProperty('glowside1.visible', true)
	        setProperty('pipefront.visible', true)
			setProperty('uglyrain.visible', false)
        end
    end
end