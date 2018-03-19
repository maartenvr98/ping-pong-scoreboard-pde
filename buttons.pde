JSONObject buttons = new JSONObject();

void getButtons() {
  String[] categories = new String[5];
  categories[0] = "game_type";
  categories[1] = "rule_type";
  categories[2] = "game";
  categories[3] = "points";
  categories[4] = "match";
  
  JSONObject get = loadJSONObject("lib/buttons/buttons.json");
  for (int i = 0; i < get.size(); i++) {
    JSONArray categorie = get.getJSONArray(categories[i]);
    for (int count = 0; count < categorie.size(); count++) {
      JSONObject button = categorie.getJSONObject(count);
      
      buttons.setJSONObject(button.getString("id"), button);
    }
  }
}

void viewButton(String id, String text, int textColor) {
  if(buttons != null) {
     JSONObject button = buttons.getJSONObject(id);
     if(button != null) {
       JSONObject coords = button.getJSONObject("coords");
       createButton(coords.getFloat("x"), coords.getFloat("y"), coords.getFloat("w"), coords.getFloat("h"), text, textColor);
     }
  }
}

void createButton(float x, float y, float w, float h, String text, int textColor) {
  float textX = x + (w / 2);
  float textY = y + (h / 2) - 3;
 
  cursor(HAND);
  fill(textColor);
  rect(x, y, w, h);
  fill(0,0,0);
  textAlign(CENTER, CENTER);
  text(text, textX, textY);
  fill(255);
  cursor(ARROW);
}

boolean buttonClick(String id) {
  JSONObject button = buttons.getJSONObject(id);
  JSONObject coords = button.getJSONObject("coords");
  float x = coords.getFloat("x");
  float y = coords.getFloat("y");
  float w = coords.getFloat("w");
  float h = coords.getFloat("h");
  
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  }
  return false;
}

void gameTypeButtonsColor(int color1, int color2, int color3) {
  gameType3BtnColor = color1;
  gameType5BtnColor = color2;
  gameType7BtnColor = color3;
}

void ruleTypeButtonsColor(int color1, int color2) {
  ruleType11BtnColor = color1;
  ruleType21BtnColor = color2;
}