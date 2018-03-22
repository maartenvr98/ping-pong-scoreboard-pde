int getSide(int width, int player) {
  if(player == 1) {
      if(sides == 21) {
          return width/2+250;
      }
      return width/2-250;
  }
  else {
      if(sides == 21) {
          return width/2-250;
      }
      return width/2+250;
  }
}

void checkSideChange() {
  int pointsNeeded = (ruleType == 0) ? 5 : 10;
  int atGame = (gameType * 2) + 3;
  if(currentGame == atGame) {
      if(!changedInLastGame) {
          if(points[1] == pointsNeeded) {
              changeSide();
              changedInLastGame = true;
          }
          else if(points[2] == pointsNeeded) {
              changeSide();
              changedInLastGame = true;
          }
      }
  }
}

void changeSide() {
  if(sides == 12) {
      sides = 21;
  }
  else {
      sides = 12;
  }
  alert(lang.getString("alert-side-change-title"), lang.getString("alert-side-change-text")); 
}