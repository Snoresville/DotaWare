var titleSchedule = null;
var subtitleSchedule = null;

// Functions to set title and subtitle text
function TitleSet(data){
    if (titleSchedule != null){
        $.CancelScheduled(titleSchedule);
    }

    var title = FindDotaHudElement("TextEngineTitle");
    title.text = data.text;
    title.style.color = data.color;
    AnimatePanel(FindDotaHudElement("TextEngineTitle"), {"opacity": "1"}, 0.0, "ease-in", 0);

    titleSchedule = $.Schedule(data.duration, TitleClear);
}
function TitleClear(){
    AnimatePanel(FindDotaHudElement("TextEngineTitle"), {"opacity": "0"}, 0.5, "ease-in", 0);
}

function SubtitleSet(data){
    if (subtitleSchedule != null){
        $.CancelScheduled(subtitleSchedule);
    }

    var subtitle = FindDotaHudElement("TextEngineSubtitle");
    subtitle.text = data.text;
    subtitle.style.color = data.color;
    AnimatePanel(FindDotaHudElement("TextEngineSubtitle"), {"opacity": "1"}, 0.0, "ease-in", 0);

    subtitleSchedule = $.Schedule(data.duration, SubtitleClear);
}
function SubtitleClear(){
    AnimatePanel(FindDotaHudElement("TextEngineSubtitle"), {"opacity": "0"}, 0.5, "ease-in", 0);
}

// Miscellaneous
function ClearText(){
    AnimatePanel(FindDotaHudElement("TextEngineTitle"), {"opacity": "0"}, 0.0, "ease-in", 0);
    AnimatePanel(FindDotaHudElement("TextEngineSubtitle"), {"opacity": "0"}, 0.0, "ease-in", 0);
}

GameEvents.Subscribe("textengine_title", TitleSet);
GameEvents.Subscribe("textengine_subtitle", SubtitleSet);
GameEvents.Subscribe("textengine_clear", ClearText);