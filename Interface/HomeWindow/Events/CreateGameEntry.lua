function CreateGameEntry(name, gameEntry, offset)
    local gameEntryWindow = CreateGameEntryBox(name, offset);

    CreateGameNewRatingArea(name, gameEntry, gameEntryWindow);
    CreateTimestampAndWinnerArea(name, gameEntry, gameEntryWindow);

    -- Create an icon to indicate what level this game was played at
    -- e.g. duelist/unranked etc
    local gameLevel = Position(nil, gameEntryWindow, 1, 30, 30, nil, 5, -5);

    if IsItRated(gameEntry) then
        gameLevel:SetBackdrop({
            bgFile = ResolveSmallTexture((gameEntry.teamRatingOne + gameEntry.teamRatingZero) / 2)
        });
    else
        gameLevel:SetBackdrop({
            bgFile = bd.PrestigeIcon
        });
    end

    -- 2v2 or 3v3 or corrupt?
    local gameIsCorrupt = false;

    local playersText = Text(gameEntryWindow, texts.formatText);
    if gameEntry.playersNum == 6 then
        playersText:SetText("3V3");
    elseif gameEntry.playersNum == 4 then
        playersText:SetText("2V2")
    else
        gameIsCorrupt = true;
        playersText:SetText("COR");
    end

    if corrupt == true then
        return gameEntryWindow;
    end

    CreateFriendlyAndEnemyArea(name, gameEntry, offset, gameEntryWindow);
    CreateGameEntryTooltip(name, gameEntry, offset, gameEntryWindow);
    return gameEntryWindow;
end

function CreateGameEntryBox(name, offset)
    local gameEntryWindow = Position(nil, callbacks.containerFrame, 1, callbacks.gameScrollerWindow:GetWidth() - 28, 40, nil, 5, -offset);
    tinsert(gameEntryHandles, gameEntryWindow);
    gameEntryWindow:SetBackdrop({
        bgFile = bd.TooltipBg, 
        edgeFile = bd.TooltipBor, 
        tile = true, tileSize = 16, edgeSize = 16, 
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    });
    gameEntryWindow:SetBackdropColor(0.25, 0.2, 0.2, 1);
    return gameEntryWindow;
end

function CreateGameNewRatingArea(name, gameEntry, gameEntryWindow)
    local newRatingText = Text(gameEntryWindow, texts.newRatingLabel);
    if gameEntry.playersNum == 6 and IsItRated(gameEntry) then
        for k,v in ipairs(gameEntry.playerTeam) do
            if v.name == UnitName("player") then
                if v.ratingChange > 0 then
                    newRatingText:SetText(gameEntry.postThreesCR + v.ratingChange.." (+"..v.ratingChange..")");
                else
                    newRatingText:SetText(gameEntry.postThreesCR + v.ratingChange.." ("..v.ratingChange..")");
                end
            end
        end

        if gameEntry.winner == gameEntry.playerSide then
            newRatingText:SetTextColor(0.2, 0.7, 0.2, 1);
        else
            newRatingText:SetTextColor(0.7, 0.2, 0.2, 1);
        end
    elseif gameEntry.playersNum == 4 and IsItRated(gameEntry) then
        for k,v in ipairs(gameEntry.playerTeam) do
            if v.name == UnitName("player") then
                if v.ratingChange > 0 then
                    newRatingText:SetText(gameEntry.postCR + v.ratingChange.." (+"..v.ratingChange..")");
                else
                    newRatingText:SetText(gameEntry.postCR + v.ratingChange.." ("..v.ratingChange..")");
                end
            end
        end
            
        if gameEntry.winner == gameEntry.playerSide then
            newRatingText:SetTextColor(0.2, 0.7, 0.2, 1);
        else
            newRatingText:SetTextColor(0.7, 0.2, 0.2, 1);
        end
    else
        newRatingText:SetText("");
    end
end

function CreateTimestampAndWinnerArea(name, gameEntry, gameEntryWindow)
    local timestampText = Text(gameEntryWindow, texts.timestampLabel);
    timestampText:SetText(date("%H:%M:%S", gameEntry.timeStamp));
    local winnerTextWindow = Position(nil, gameEntryWindow, nil, 44, 40, "TOPRIGHT", 0, 0);
    local winnerText = Text(winnerTextWindow, texts.winnerLabel);
    if gameEntry.winner == gameEntry.playerSide then
        winnerText:SetTextColor(0.2, 0.7, 0.2, 1);
        winnerText:SetText(textInserts.winGameLabel);
    else
        winnerText:SetTextColor(0.7, 0.2, 0.2, 1);
    end
end

function CreateFriendlyAndEnemyArea(name, gameEntry, offset, gameEntryWindow)
    local offset = 1;
    if gameEntry.playersNum == 4 then
        offset = offset + 1;
    end
    for k, player in ipairs(gameEntry.playerTeam) do
        local playerIconWindow = Position(nil, gameEntryWindow, 1, 30, 30, nil, 50 + (offset * 30), -5);
        playerIconWindow:SetBackdrop({
            bgFile = GetIconForSpec(player)
        });
        offset = offset + 1;
    end

    -- Print a vs text or icon
    Text(gameEntryWindow, texts.vsTextEntry);

    -- For each enemy player
    -- print spec icon
    for k, enemy in ipairs(gameEntry.enemyTeam) do
        local enemyIconWindow = Position(nil, gameEntryWindow, 1, 30, 30, nil, 175 + (k * 30), -5);
        enemyIconWindow:SetBackdrop({
            bgFile = GetIconForSpec(enemy)
        });
    end
end