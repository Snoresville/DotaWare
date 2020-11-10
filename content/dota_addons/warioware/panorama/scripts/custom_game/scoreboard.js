var SCOREBOARD_SHOWING_PLAYERS = true
var scoreboardPlayers = {};
var playerCount = 0;
var playerReadyCount = 0;

function ScoreboardTitleHover(){
    AnimatePanel(FindDotaHudElement("ScoreboardTitle"), {"background-color": "#666666"}, 0.25, "ease-in", 0)
}

function ScoreboardTitleUnhover(){
    AnimatePanel(FindDotaHudElement("ScoreboardTitle"), {"background-color": "black"}, 0.25, "ease-in", 0)
}

function ScoreboardToggleVisibilty(){
    var distance = 50;
    distance += FindDotaHudElement("ScoreboardPlayerList").GetChildCount() * 50;
    if (SCOREBOARD_SHOWING_PLAYERS){
        AnimatePanel(FindDotaHudElement("ScoreboardPlayerList"), {"transform": "translateY(-" + distance + "px)"}, distance / 200, "ease-in", 0)
        SCOREBOARD_SHOWING_PLAYERS = false
    }
    else {
        AnimatePanel(FindDotaHudElement("ScoreboardPlayerList"), {"transform": "translateY(0px)"}, distance / 200, "ease-in", 0)
        SCOREBOARD_SHOWING_PLAYERS = true
    }
}

function ScoreboardAddPlayer(data){
    var newPlayer = $.CreatePanel('Panel', $('#ScoreboardPlayerList'), '');
    newPlayer.BLoadLayoutSnippet("NewPlayer");
    scoreboardPlayers[data.playerID] = newPlayer;

    // Was making sure my steam id assignment to avatar and username is working
    var avatar = newPlayer.FindChildTraverse("PlayerAvatar");
    var username = newPlayer.FindChildTraverse("PlayerUsername");
    avatar.steamid = data.steamID;
    username.steamid = data.steamID;

    var usernameBackground = username.GetParent();
    if(Players.GetLocalPlayer() == data.playerID){
        usernameBackground.style.backgroundColor = "#8b8d1f9c";
    }

    playerCount++;
    ScoreboardSendReadyState();
}

function ScoreboardSetReady(data){
    var playerReady = scoreboardPlayers[data.playerID];
    playerReady.FindChildTraverse("ScoreboardReady").text = "Ready";
    playerReady.FindChildTraverse("ScoreboardReady").style.color = "#00ff00";
    playerReadyCount++;

    ScoreboardSendReadyState();
}

function ScoreboardSendReadyState(){
    GameEvents.SendCustomGameEventToAllClients("scoreboard_ready_state", {"readyState": playerCount == playerReadyCount} );
}

function ScoreboardPrepareHUD(){
    var moveDelay = 0.05;

    AnimatePanel(FindDotaHudElement("ScoreboardTitle"), {"width": "391px"}, 2.0, "ease-in", 0);
    for(var i = 0; i < playerCount; i++){
        var selectedPlayer = scoreboardPlayers[i];
        AnimatePanel(selectedPlayer.FindChildTraverse("ScoreboardReadyContainer"), {"transform": "translateX(-500px)"}, 1.25, "ease-in", 0 + moveDelay * i);
    }
    $.Schedule(5 + moveDelay * playerCount, ScoreboardCleanup);
}
function ScoreboardCleanup(){
    for(var i = 0; i < playerCount; i++){
        var selectedPlayer = scoreboardPlayers[i];
        selectedPlayer.FindChildTraverse("ScoreboardReadyContainer").RemoveAndDeleteChildren();
    }
}

GameEvents.Subscribe("scoreboard_add_player", ScoreboardAddPlayer);
GameEvents.Subscribe("scoreboard_ready_player", ScoreboardSetReady);
GameEvents.Subscribe("game_started", ScoreboardPrepareHUD);