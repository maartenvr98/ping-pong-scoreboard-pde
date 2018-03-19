import processing.data.JSONObject;
import javax.swing.*;  
import java.util.*;

void setup(){
  setDefaults();

  surface.setTitle(lang.getString("title"));

  background(31,31,31); //background needs to be set before saved match check to colorize background before popup shows
  if(checkSavedMatch()) {
      setSavedMatch();

      playersLabel[1] = " ("+gamesWin[1]+")";
      playersLabel[2] = " ("+gamesWin[2]+")";
  }
  
  getButtons();
}

void settings() {
  size(800,500);
}

void draw(){
  setViewDefaults();

  if(gameStarted()) {
      checkSideChange();

      gamePaused = false;
      if(gameFinish() && !matchFinish()) {
          noLoop();
          createGameFinishView();
      }

      if(matchFinish()) {
          noLoop();
          createMatchFinishView();
      }

      createScoreboardView();
  }
  else {
      createSelectionPageView();
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
      Set keys = buttons.keys();  
      for (Object key : keys) { 
        String id = key.toString();
        if(buttonClick(id)) {
           JSONObject button = buttons.getJSONObject(id);
           switch(button.getString("action")) {
             case "set_game_type": 
               setGameType(button.getInt("value"));
               break;
             case "set_rule_type":
               setRuleType(button.getInt("value"));
               break;
             case "start_game":
               startGame();
               break;
             case "next_game":
               nextGame();
               break;
             case "add_point":
               points("add", button.getInt("value"));
               break;
             case "remove_point":
               points("remove", button.getInt("value"));
               break;
             case "close_match":
               closeMatch();
               break;
             default:
               println("no action found (id: "+id+")");
           }
         }
      }
   }
}