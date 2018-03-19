void startGame() {
  if(readyForStart()) {
    if(!gameStarted()) {
      gameStart = true;
      currentGame = 1;
      service = (int)random(1,3);
    }
  }
}

boolean gameStarted() {
  return gameStart;
}

boolean gameFinish() {
  if(checkGameFinish() != 0) {
      games[currentGame] = true;
      updateGame();
      return true;
  }
  return false;
}

int checkGameFinish() {
  int difference;
  int pointsNeeded = (ruleType == 0) ? 11 : 21;
  if(points[1] >= pointsNeeded && points[2] < pointsNeeded) {
      difference = points[1] - points[2];
      if(difference >= 2) {
          return 1;
      }
  }
  else if(points[2] >= pointsNeeded && points[1] < pointsNeeded) {
      difference = points[2] - points[1];
      if(difference >= 2) {
          return 2;
      }
  }
  else if(points[1] >= pointsNeeded && points[2] >= pointsNeeded) {
      difference = points[1] - points[2];
      if(difference == 2) {
          return 1;
      }
      else if(difference == -2) {
          return 2;
      }
  }
  return 0;
}

void updateGame() {
  gamesWin[getGameWinner()] += 1;

  playersLabel[getGameWinner()] = " ("+gamesWin[getGameWinner()]+")";
}

int getGameWinner() {
  return checkGameFinish();
}

void nextGame() {
  totalPoints = 0;
  points[1] = 0;
  points[2] = 0;
  gamesPlayed += 1;
  currentGame += 1;

  changeSide();

  loop();
}