
function AddGamesToScrollArea(entry)
    if entry == nil then
        AddAllGames();
    elseif callbacks.containerFrame ~= nil then
        AddGameToScrollArea(entry);
    end
end

L = {};

function AddGameToScrollArea(gameEntry)
    -- Have a static list L that keeps all the new game containers
    -- Create a container for new game

    -- Create the actual entry at the new spot
    local gameEntryWindow = CreateGameEntry("GameEntryFlexWindow"..#L, gameEntry, -40 * (#L + 1));
    
    -- Push back containerFrame by (#L + 1) * gameEntryBoxHeight
    local cpoint, crelativeTo, crelativePoint, cxOfs, cyOfs = callbacks.containerFrame:GetPoint(); -- containerFrame = nil after skirmish game, when having 0 games registered
    callbacks.containerFrame:SetPoint("TOPLEFT", 0, cyOfs - 40);
    callbacks.containerFrame:Show();

    -- Save the container to L
    tinsert(L, gameEntryWindow);

    -- Resize the callbacks.gameScrollArea to the correct height (e.g. former height + gameEntryBoxHeight)
    callbacks.gameScrollArea:SetHeight(callbacks.gameScrollArea:GetHeight() + 40);
end

function AddAllGames()
    -- Determine what dates we played
    local datesWePlayed = DatesPlayed();

    -- Have a base container to contain all the dynamic elements
    callbacks.containerFrame = Position(nil, callbacks.gameScrollArea, nil, callbacks.gameScrollerWindow:GetWidth(), nil, nil, 0, -70);
    
    -- The first header is special
    CreateFirstHeaderEntry();
    
    -- We sort the table from new to old so we get dates from new to old
    table.sort(data, function (a,b) return a.timeStamp > b.timeStamp end);

    -- Keep an offset so we know where to start the next header/entry
    local offset = 0;

    -- For each day
    for i,currentDay in ipairs(datesWePlayed) do
        CreateDayHeader(i, offset, currentDay);
        offset = offset + 70;

        for j, gameEntry in ipairs(data) do
            if date("%d-%m-%Y", gameEntry.timeStamp) == currentDay then
                CreateGameEntry("GameEntryWindow"..i, gameEntry, offset);
                offset = offset + 40;
            end
        end
    end

    -- (For each day added * height) + (For each game added * height) we set the scrollbox height
    if offset == 0 then
        callbacks.containerFrame:SetHeight(10);
    else
        callbacks.containerFrame:SetHeight(offset);
    end
    callbacks.gameScrollArea:SetHeight(offset + 70);
end

function DatesPlayed()
    local datesWePlayed = {};
    local datesWePlayedStamps = {};
    for i, gameEntry in ipairs(data) do
        if tContains(datesWePlayed, date("%d-%m-%Y", gameEntry.timeStamp)) == false then
            tinsert(datesWePlayed, date("%d-%m-%Y", gameEntry.timeStamp));
            tinsert(datesWePlayedStamps, gameEntry.timeStamp);
        end
    end
    table.sort(datesWePlayedStamps, function (a, b) return a > b end);
    local returnValue = {};
    for k, v in ipairs(datesWePlayedStamps) do
        tinsert(returnValue, date("%d-%m-%Y", v));
    end
    return returnValue;
end

function CreateDayHeader(i, offset, currentDay)
    local dayHeaderWindow = Position(nil, callbacks.containerFrame, nil, callbacks.gameScrollerWindow:GetWidth() - 10, 70, nil, 5, -offset);
    Text(dayHeaderWindow, texts.dayHeaderPipe);

    local wins = 0;
    local losses = 0;
    for j, gameEntry in ipairs(data) do
        if date("%d-%m-%Y", gameEntry.timeStamp) == currentDay then
            if gameEntry.playerSide == gameEntry.winner then
                wins = wins + 1;
            else
                losses = losses + 1;
            end
        end
    end

    local dayHeaderText = Text(dayHeaderWindow, texts.dayText);
    dayHeaderText:SetText(currentDay);
    if wins > 0 or losses > 0 then
        if wins == 1 and losses == 1 then
            dayHeaderWindow:SetScript("OnEnter", function(self, motion)
                dayHeaderText:SetText("1 win - 1 loss");
            end);
        elseif wins == 1 then
            dayHeaderWindow:SetScript("OnEnter", function(self, motion)
                dayHeaderText:SetText("1 win - "..losses.." losses");
            end);
        elseif losses == 1 then
            dayHeaderWindow:SetScript("OnEnter", function(self, motion)
                dayHeaderText:SetText(wins.." wins - 1 loss");
            end);
        else
            dayHeaderWindow:SetScript("OnEnter", function(self, motion)
                dayHeaderText:SetText(wins.." wins - "..losses.." losses");
            end);
        end
    end
    dayHeaderWindow:SetScript("OnLeave", function(self, motion)
        dayHeaderText:SetText(currentDay);
    end);
    
    Text(dayHeaderWindow, texts.pipeSeparator);
end

function CreateFirstHeaderEntry()
    callbacks.firstDayHeaderWindow = Position(nil, callbacks.gameScrollArea, nil, callbacks.gameScrollerWindow:GetWidth() - 10, 70, nil, 5, 0);

    Text(callbacks.firstDayHeaderWindow, texts.sessionHeader);
    Text(callbacks.firstDayHeaderWindow, texts.pipeSeparator);
end