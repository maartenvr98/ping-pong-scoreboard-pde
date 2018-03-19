String[] players = new String[3];
String[] playersLabel = new String[3];
String[] gameTypes = new String[3];
String[] ruleTypes = new String[2];
String language;

Integer currentGame = 0;

int[] points = new int[3];
int[] gamesWin = new int[3];
int gameType = 0;
int ruleType = 0;
int totalPoints = 0;
int service = 0;
int gamesPlayed = 0;
int sides = 12;
int gameType3BtnColor = 150;
int gameType5BtnColor = 255;
int gameType7BtnColor = 255;
int ruleType11BtnColor = 150;
int ruleType21BtnColor = 255;

boolean[] games = new boolean[7];
boolean changeFast = false;
boolean gameStart = false;
boolean gamePaused = false;
boolean changedInLastGame = false;

JSONObject lang;

void setDefaults() {
  JSONObject config = loadJSONObject("lib/config/config.json");
  
  language = config.getString("language");
  lang = loadJSONObject("lib/language/"+language+".json");
  
  players[0] = "empty"; //Empty by default
  players[1] = config.getString("player-1");
  players[2] = config.getString("player-2");

  gameTypes[0] = lang.getString("best-of-3");
  gameTypes[1] = lang.getString("best-of-5");
  gameTypes[2] = lang.getString("best-of-7");

  ruleTypes[0] = lang.getString("rules-11");
  ruleTypes[1] = lang.getString("rules-21");

  points[1] = 0;
  points[2] = 0;

  games[0] = false;
  games[1] = false;
  games[2] = false;
  games[3] = false;
  games[4] = false;
  games[5] = false;
  games[6] = false;

  gamesWin[1] = 0;
  gamesWin[2] = 0;

  playersLabel[1] = " ("+gamesWin[1]+")";
  playersLabel[2] = " ("+gamesWin[2]+")";
}

void setGameType(int type) {
  gameType = type;
  switch(type) {
    case 0:
      gameTypeButtonsColor(150, 255, 255);
      break;
    case 1:
      gameTypeButtonsColor(255, 150, 255);
      break;
    case 2:
      gameTypeButtonsColor(255, 255, 150);
      break;
    default:
      gameTypeButtonsColor(150, 255, 255);
  }
}

void setRuleType(int type) {
  ruleType = type;
  switch(type) {
    case 0:
      ruleTypeButtonsColor(150, 255);
      break;
    case 1:
      ruleTypeButtonsColor(255, 150);
      break;
    default:
      ruleTypeButtonsColor(150, 255);
  }
}

public boolean confirm(String title, String msg) {
  Object[] options = {lang.getString("yes"), lang.getString("no")};
  int result = JOptionPane.showOptionDialog(null, msg, title,
          JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,
          null, options, options[0]);

  return result!=1;
}

void message(String text, int r, int g, int b) {
  textAlign(CENTER);
  fill(r,g,b);
  text(text, width/2,height/2);
  fill(255);
  textAlign(LEFT);
}

String placeholders(String text) {
  String game = currentGame.toString();
  String postfix;

  if(language == "english") {
      switch (currentGame) {
          case 1:
              postfix = "st";
              break;
          case 2:
              postfix = "nd";
              break;
          case 3:
              postfix = "rd";
              break;
          case 4:
          case 5:
          case 6:
          case 7:
              postfix = "th";
              break;
          default:
              postfix = "st";
      }
  }
  else {
      postfix = "e";
  }


  String newText = text.replace("{game_winner}", players[getGameWinner()])
  .replace("{current_game}", game+postfix)
  .replace("{match_winner}", players[getWinner()]);

  return newText;
}