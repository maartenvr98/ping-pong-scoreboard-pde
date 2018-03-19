boolean readyForStart() {
  if(gameStarted()) {
      return false;
  }
  return true;
}

boolean matchFinish() {
  int totalGames = (gameType * 2) + 3;
  int gamesToWin = (totalGames/2)+1;
  if(gameStarted()) {
    if(gamesWin[1] == gamesToWin || gamesWin[2] == gamesToWin) {
      return true;
    }
  }
  return false;
}

int getWinner() {
  if(gamesWin[1] > gamesWin[2]) {
      return 1;
  }
  else if(gamesWin[2] > gamesWin[1]) {
      return 2;
  }
  return 0;
}

void closeMatch() {
  if(confirm(lang.getString("confirm-stop-title"), lang.getString("confirm-stop-text"))) {
      if(!matchFinish()) {
          if(totalPoints > 0 || currentGame > 1) {
              saveMatch();
          }
      }
      endMatch();
  }
}

void endMatch() {
  gameStart = false;
  sides = 12;
  changedInLastGame = false;
  setDefaults();
  loop();
}