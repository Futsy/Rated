function CreateHomeBottomWindow()
    -- Create a container for the season title that sticks to the top
    callbacks.bottomHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.1, "BOTTOMLEFT", 0, 0);

    -- Start with class and spec text
    local currentSpec = GetSpecialization();
    local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None";
    local localizedClass, englishClass, classIndex = UnitClass("player");
    local playerClass = Text(callbacks.bottomHeaderWindow, texts.playerClassSpec);
    playerClass:SetText(currentSpecName.." "..localizedClass);

    -- Start with title of the season Large
    local classText = Text(callbacks.bottomHeaderWindow, texts.playerName);
    if GetCurrentTitle() ~= -1 then
        classText:SetText(ResolveTitle(HighestSeasonRank()).." "..UnitName("player"));
    else
        classText:SetText(UnitName("player"));
    end
end