var SCOREBOARD_SHOWING_PLAYERS = true

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