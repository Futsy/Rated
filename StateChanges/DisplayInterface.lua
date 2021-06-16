function DisplayAddonFrame()
    if callbacks.mainWindow == nil then
        if ratedInfoGatheredAtleastOnce then
            CreateMainWindow();
            OpenHome();
            AddGamesToScrollArea();
        else
            print("Did not yet receive a ranking update.. please wait a second.");
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