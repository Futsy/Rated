function FadeInFrame(frame, time)
    local fadeInfo = {
        mode = "OUT",
        timeToFade = time,
        startAlpha = 0,
        endAlpha = 1
    };
    frame:Show();
    UIFrameFade(frame, fadeInfo);
    frame.visible = 1;
end

function FadeOutFrame(frame, time)
    local fadeInfo = {
        mode = "OUT",
        timeToFade = time,
        startAlpha = 1,
        endAlpha = 0,
        finishedFunc = function() frame:Hide() end;
    };
    UIFrameFade(frame, fadeInfo);
    frame.visible = 0;
end