void setPoints() {
  text(points[1], getSide(width, 1),height/4);
  text(points[2], getSide(width, 2), height/4);
}

void points(String action, int player) {
  switch(action) {
    case "add":
      addPoint((sides == 12) ? player : reversePlayer(player));
      break;
    case "remove":
      removePoint((sides == 12) ? player : reversePlayer(player));
      break;
    default:
      println("please use add or remove action");
  }
}

int reversePlayer(int player) {
  return (player == 1) ? 2 : 1;
}

void addPoint(int player) {
  if(!gamePaused) {
      points[player] += 1;
      totalPoints += 1;
  }
  updateService();
}

void removePoint(int player) {
  if(!gamePaused) {
      if(points[player] > 0) {
          points[player] -= 1;
          totalPoints -= 1;
      }
      updateService();
  }
  else {
      if(gameFinish()) {
          if(!matchFinish() && getGameWinner() == player) {
            if(points[player] > 0) {
                if(getGameWinner() == player) {
                    games[currentGame] = false;
                    gamesWin[getGameWinner()] -= 2; //need to be 2 because updateGame() is fired twice
                    playersLabel[getGameWinner()] = " ("+gamesWin[getGameWinner()]+")";
                }
                points[player] -= 1;
                totalPoints -= 1;
                loop();
            }
          }
      }
  }
}