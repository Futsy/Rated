function DisplayAddonFrame()
    if callbacks.mainWindow == nil then
        if ratedInfoGatheredAtleastOnce then
            CreateMainWindow();
            OpenHome();
            AddGamesToScrollArea();
        else
            print(textInserts.errorRatedUpdate);
        end
    elseif callbacks.mainWindow:IsVisible() == false then
        OpenHome();
        -- Initialized but not visible
        FadeInFrame(callbacks.mainWindow, 0.35);
    else
        -- Initialized but visible
        FadeOutFrame(callbacks.mainWindow, 0.35);
    end
end