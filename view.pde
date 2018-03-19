void setViewDefaults() {
  smooth();
  background(31,31,31);
  textSize(25);
}

void createSelectionPageView() {
  viewButton("set_game_type_1", gameTypes[0], gameType3BtnColor);
  viewButton("set_game_type_2", gameTypes[1], gameType5BtnColor);
  viewButton("set_game_type_3", gameTypes[2], gameType7BtnColor);

  viewButton("set_rule_type_1", ruleTypes[0], ruleType11BtnColor);
  viewButton("set_rule_type_2", ruleTypes[1], ruleType21BtnColor);

  viewButton("start_game", lang.getString("start-game"), 255);
}

void createScoreboardView() {
  textAlign(CENTER);
  text(players[1]+playersLabel[1],getSide(width, 1),height/4-40);
  text(players[2]+playersLabel[2],getSide(width, 2),height/4-40);
  text(lang.getString("vs"), width/2,height/4-40);

  text(lang.getString("service")+getService(), width/2,height-95);
  text(lang.getString("type")+gameTypes[gameType], width/2,height-60);
  text(lang.getString("rules")+ruleTypes[ruleType], width/2,height-25);

  setPoints();

  viewButton("add_point_1", "+", 255);
  viewButton("remove_point_1", "-", 255);
  
  viewButton("add_point_2", "+", 255);
  viewButton("remove_point_2", "-", 255);

  viewButton("close_match", "x", 255);

  textAlign(LEFT);
}

void createGameFinishView() {
  gamePaused = true;
  message(placeholders(lang.getString("game-win")), 255,0,0);

  viewButton("next_game", lang.getString("next-game"), 255);
}

void createMatchFinishView() {
  gamePaused = true;
  message(placeholders(lang.getString("match-win")), 255,0,0);
}