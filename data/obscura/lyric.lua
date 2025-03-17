function onUpdate()
  if curStep == 2396 then
		makeVideoSprite("myCutscene", "mariohh", 500, 200, "other", false,3.0,3.0) -- Tag, Path, X, Y, Default Camera, Loop
        setObjectCamera("myCutscene", "game")
        setProperty("myCutscene.alpha", 1) -- Changing Properties
	end
end