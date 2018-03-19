void saveMatch() {
  if(!confirm(lang.getString("confirm-save-title"), lang.getString("confirm-save-text"))) {
      return;
  }
  
  JSONObject game = new JSONObject();

  game.setBoolean("active", true);
  game.setInt("game_type", gameType);
  game.setInt("rule_type", ruleType);
  game.setInt("total_points", totalPoints);
  game.setInt("service", service);
  game.setInt("games_played", gamesPlayed);
  game.setInt("current_game", currentGame);
  game.setInt("sides", sides);
  game.setBoolean("change_fast", changeFast);
  game.setBoolean("paused", gamePaused);
  game.setBoolean("sides_changed_in_last_game", changedInLastGame);

  JSONObject jsonPlayers = new JSONObject();
  for (int i = 1; i <= 2; i++) {
      JSONObject jsonPlayer = new JSONObject();
      jsonPlayer.setInt("id", i);
      jsonPlayer.setString("name", players[i]);
      jsonPlayer.setInt("points", points[i]);
      jsonPlayer.setInt("games_win", gamesWin[i]);

      jsonPlayers.setJSONObject("player_"+i, jsonPlayer);
  }
  game.setJSONObject("players", jsonPlayers);

  JSONObject jsonGames = new JSONObject();
  for (int i = 0; i <= 6; i++) {
      JSONObject jsonGame = new JSONObject();
      jsonGame.setInt("id", i);
      jsonGame.setBoolean("played", games[i]);

      jsonGames.setJSONObject("game_"+i, jsonGame);
  }
  game.setJSONObject("games", jsonGames);

  saveJSONObject(game, "lib/save/game.json");
}

boolean checkSavedMatch() {
  try {
      JSONObject game = loadJSONObject("lib/save/game.json");
      boolean active = game.getBoolean("active");
      if(active) {
          //TODO: Set active to false if choose to not get match from json
          return confirm(lang.getString("confirm-saved-title"), lang.getString("confirm-saved-text"));
      }
      return false;
  } catch (java.lang.RuntimeException e) {
      return false;
  }

}

void setSavedMatch() {
  JSONObject game = loadJSONObject("lib/save/game.json");

  gameType = game.getInt("game_type");
  ruleType = game.getInt("rule_type");
  totalPoints = game.getInt("total_points");
  service = game.getInt("service");
  gamesPlayed = game.getInt("games_played");
  currentGame = game.getInt("current_game");
  sides = game.getInt("sides");
  changeFast = game.getBoolean("change_fast");
  gamePaused = game.getBoolean("paused");
  changedInLastGame = game.getBoolean("sides_changed_in_last_game");

  JSONObject jsonPlayers = game.getJSONObject("players");
  for (int i = 1; i <= jsonPlayers.size(); i++) {
      JSONObject jsonPlayer = jsonPlayers.getJSONObject("player_"+i);
      players[i] = jsonPlayer.getString("name");
      points[i] = jsonPlayer.getInt("points");
      gamesWin[i] = jsonPlayer.getInt("games_win");
  }

  JSONObject jsonGames = game.getJSONObject("games");
  for (int i = 0; i <= 6; i++) {
      JSONObject jsonGame = jsonGames.getJSONObject("game_"+i);
      games[i] = jsonGame.getBoolean("played");
  }

  game.setBoolean("active", false);
  saveJSONObject(game, "lib/save/game.json");

  gameStart = true;
}