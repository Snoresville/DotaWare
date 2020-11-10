var GAME_PLAYERS_READY = 0;
var START_BUTTON_PUSHED = false;

function GetReadyState(data){
    GAME_PLAYERS_READY = data.readyState;
    StartButtonInteractable();
}

function StartButtonInteractable(){
    if(!IsHost){
        FindDotaHudElement("StartButton").style.opacity = "0";
    }
    else if(GAME_PLAYERS_READY == 1){
        FindDotaHudElement("StartButton").style.opacity = "1";
    }
    else {
        FindDotaHudElement("StartButton").style.opacity = "0.3";
    }
}

function StartButtonHover(){
    if(GAME_PLAYERS_READY == 1){
        AnimatePanel(FindDotaHudElement("StartButton"), {"background-color": "#666666"}, 0.25, "ease-in", 0);
    }
}

function StartButtonUnhover(){
    if(GAME_PLAYERS_READY == 1){
        AnimatePanel(FindDotaHudElement("StartButton"), {"background-color": "#3a3a3a"}, 0.25, "ease-in", 0);
    }
}

function StartButtonActivate(){
    if(IsHost && GAME_PLAYERS_READY == 1 && START_BUTTON_PUSHED == false){
        START_BUTTON_PUSHED = true;
        AnimatePanel(FindDotaHudElement("StartButton"), {"opacity": "0"}, 2.0, "ease-in", 0);
        GameEvents.SendCustomGameEventToAllClients("game_started", {} );
        GameEvents.SendCustomGameEventToServer("game_started", {});
    }
}



GameEvents.Subscribe("scoreboard_ready_state", GetReadyState);