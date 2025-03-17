function onCreatePost() {
  game.initLuaShader('pixel');
  var shader = game.createRuntimeShader('pixel');
  
  var filter = new ShaderFilter(shader);
  camGame.setFilters([filter]);
  camHUD.setFilters([filter]);
                    
}