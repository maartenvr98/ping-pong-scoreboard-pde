String getService() {
  return players[service];
}

void updateService() {
  if(gameStarted()) {
      if(ruleType == 0) { //11
          if(totalPoints < 20) {
              if(totalPoints % 2 == 0) {
                  changeService();
              }
          }
          else {
              if(points[1] == 10 && points[2] == 10) {
                  changeService();
                  changeFast = true;
              }
              else {
                  int multiple = (changeFast) ? 1 : 2;
                  if(totalPoints % multiple == 0) {
                      changeService();
                  }
              }
          }
      }
      else if(ruleType == 1) { //21
          if(totalPoints < 40) {
              if(totalPoints % 5 == 0) {
                  changeService();
              }
          }
          else {
              if(points[1] == 20 && points[2] == 20) {
                  changeService();
                  changeFast = true;
              }
              else {
                  int multiple = (changeFast) ? 2 : 5;
                  if(totalPoints % multiple == 0) {
                      changeService();
                  }
              }
          }
      }
  }
}

void changeService() {
  if(service == 1) {
      service = 2;
  }
  else if(service == 2) {
      service = 1;
  }
}