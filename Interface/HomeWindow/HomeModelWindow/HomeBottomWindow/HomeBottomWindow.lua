function CreateHomeBottomWindow()
    -- Create a container for the season title that sticks to the top
    callbacks.bottomHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.1, "BOTTOMLEFT", 0, 0);

    -- Start with class and spec text
    local currentSpec = GetSpecialization();
    local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None";
    local localizedClass, englishClass, classIndex = UnitClass("player");
    local playerClass = Text(callbacks.bottomHeaderWindow, texts.playerClassSpec);
    playerClass:SetText(currentSpecName.." "..localizedClass);

    if GetCurrentTitle() ~= -1 then
        local titleText = Text(callbacks.bottomHeaderWindow, texts.playerTitle);
        titleText:SetText(ResolveTitle(HighestSeasonRank()));
    end

    -- Start with title of the season Large
    local classText = Text(callbacks.bottomHeaderWindow, texts.playerName);
    classText:SetText(UnitName("player"));
end