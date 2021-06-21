function CreateHomeBottomWindow()
    -- Create a container for the season title that sticks to the top
    local bottomHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.1, "BOTTOMLEFT", 0, 0);

    -- Start with class and spec text
    local currentSpec = GetSpecialization();
    local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None";
    local localizedClass, englishClass, classIndex = UnitClass("player");
    local playerClass = Text(bottomHeaderWindow, texts.playerClassSpec);
    playerClass:SetText(textInserts.levelPrefix..UnitLevel("player").." "..currentSpecName.." "..localizedClass);

    -- Start with title of the season Large
    local classText = Text(bottomHeaderWindow, texts.playerName);
    if GetCurrentTitle() ~= -1 then
        classText:SetText(GetTitleName(GetCurrentTitle()).." "..UnitName("player"));
    else
        classText:SetText(UnitName("player"));
    end
end