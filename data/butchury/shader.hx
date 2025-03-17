function onCreatePost() {
  game.initLuaShader('ntsc');
  var shader = game.createRuntimeShader('ntsc');
  
  var filter = new ShaderFilter(shader);
  camGame.setFilters([filter]);
  camHUD.setFilters([filter]);
                    
}