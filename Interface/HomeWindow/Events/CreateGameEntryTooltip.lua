local lightGreyEscapeColor = string.format("|cff%02x%02x%02x", 115, 115, 115);
local goldEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 125);
local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);
local winEscapeColor = string.format("|cff%02x%02x%02x", 255 * 0.2, 255 * 0.7, 255 * 0.2);
local loseEscapeColor = string.format("|cff%02x%02x%02x", 255 * 0.7, 255 * 0.2, 255 * 0.2);
local greenEscapeColor = string.format("|cff%02x%02x%02x", 185, 255, 185);
local redEscapeColor = string.format("|cff%02x%02x%02x", 255, 185, 185);

function CreateGameEntryTooltip(name, gameEntry, offset, gameEntryWindow)
    gameEntryWindow:SetScript("OnEnter", function(self, motion)
        gameEntryWindow:SetBackdropColor(0.45, 0.4, 0.4, 1);
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:ClearLines();

        if IsItRated(gameEntry) then
            CreateRatedTooltipParts(name, gameEntry, offset, gameEntryWindow);
        else
            CreateUnratedTooltipParts(name, gameEntry, offset, gameEntryWindow);
        end

        GameTooltip:Show();
    end);
    gameEntryWindow:SetScript("OnLeave", function(self, motion)
        gameEntryWindow:SetBackdropColor(0.25, 0.2, 0.2, 1);
        GameTooltip:Hide();
    end);
end

function CreateUnratedTooltipParts(name, gameEntry, offset, gameEntryWindow)
    GameTooltip:AddLine(lightGreyEscapeColor..(gameEntry.playersNum == 6 and "3V3" or "2V2").."|r \n".."Honor", 1, 1, 1);
    
    GameTooltip:AddTexture(GetFileIDFromPath(bd.PrestigeIcon), {
        width = 32, height = 32,
        anchor = Enum.TooltipTextureAnchor.LeftTop,
        region = Enum.TooltipTextureRelativeRegion.LeftLine,
        verticalOffset = 0,
        margin = { left = 8, right = 8, top = 0, bottom = 0 },
        texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
        vertexColor = { r = 1, g = 1, b = 1, a = 1 },
    });
    -- Player team
    GameTooltip:AddLine("\nThis game was finished and recorded at "..date("%H:%M:%S", gameEntry.timeStamp).." on "..date("%d-%m-%Y")..".\n\n");
    GameTooltip:AddLine(goldEscapeColor.."Your team|r");
    GameTooltip:AddLine("\n");

    for k, player in ipairs(gameEntry.playerTeam) do
        GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r\n", whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");

        GameTooltip:AddTexture(GetIconForSpec(player), {
            width = 32,
            height = 32,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 4,
            margin = { left = 8, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end
    GameTooltip:AddLine("\n");

    -- Enemy team

    GameTooltip:AddLine(goldEscapeColor.."Enemy team|r");
    GameTooltip:AddLine("\n");

    for k, player in ipairs(gameEntry.enemyTeam) do
        GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r", whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");

        GameTooltip:AddTexture(GetIconForSpec(player), {
            width = 32,
            height = 32,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 4,
            margin = { left = 8, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end

    CreateMapTooltipParts(gameEntry);
end

function CreateRatedTooltipParts(name, gameEntry, offset, gameEntryWindow)
    GameTooltip:AddLine(lightGreyEscapeColor..(gameEntry.playersNum == 6 and "3V3" or "2V2").."|r \n"..floor((gameEntry.teamRatingOne + gameEntry.teamRatingZero) / 2).." MMR", 1, 1, 1);
    GameTooltip:AddTexture(ResolveSmallTextureToId((gameEntry.teamRatingOne + gameEntry.teamRatingZero) / 2), {
        width = 32,
        height = 32,
        anchor = Enum.TooltipTextureAnchor.LeftTop,
        region = Enum.TooltipTextureRelativeRegion.LeftLine,
        verticalOffset = 0,
        margin = { left = 8, right = 8, top = 0, bottom = 0 },
        texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
        vertexColor = { r = 1, g = 1, b = 1, a = 1 },
    });

    -- Player team
    GameTooltip:AddLine("\nThis game was finished and recorded at "..date("%H:%M:%S", gameEntry.timeStamp).." on "..date("%d-%m-%Y")..".\n\n");

    GameTooltip:AddLine(goldEscapeColor.."Your team|r");
    GameTooltip:AddDoubleLine(whiteEscapeColor.."MMR:|r", blueEscapeColor..gameEntry.teamRatingOne.."|r");
    GameTooltip:AddDoubleLine(whiteEscapeColor.."Bracket:|r", blueEscapeColor..ResolveTitle(gameEntry.teamRatingOne).."|r");
    GameTooltip:AddLine("\n");

    for k, player in ipairs(gameEntry.playerTeam) do
        if gameEntry.winner == gameEntry.playerSide then
            GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r", winEscapeColor.."+"..player.ratingChange.."|r\n"..whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");
        else
            GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r", loseEscapeColor..player.ratingChange.."|r\n"..whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");
        end
        GameTooltip:AddTexture(GetIconForSpec(player), {
            width = 32,
            height = 32,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 4,
            margin = { left = 8, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end
    GameTooltip:AddLine("\n");

    -- Enemy team

    GameTooltip:AddLine(goldEscapeColor.."Enemy team|r");
    GameTooltip:AddDoubleLine(whiteEscapeColor.."MMR:|r", blueEscapeColor..gameEntry.teamRatingZero.."|r");
    GameTooltip:AddDoubleLine(whiteEscapeColor.."Bracket:|r", blueEscapeColor..ResolveTitle(gameEntry.teamRatingZero).."|r");
    GameTooltip:AddLine("\n");

    for k, player in ipairs(gameEntry.enemyTeam) do
        if gameEntry.winner ~= gameEntry.playerSide then
            GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r", winEscapeColor.."+"..player.ratingChange.."|r\n"..whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");
        else
            GameTooltip:AddDoubleLine(whiteEscapeColor..player.name.."|r\n"..lightGreyEscapeColor..player.race.." "..player.talentSpec.." "..player.class.."|r", loseEscapeColor..player.ratingChange.."|r\n"..whiteEscapeColor..GetFormattedNumber(player.damageDone).."|r"..lightGreyEscapeColor.." damage - |r"..whiteEscapeColor..GetFormattedNumber(player.healingDone).."|r"..lightGreyEscapeColor.." healing|r");
        end
        GameTooltip:AddTexture(GetIconForSpec(player), {
            width = 32,
            height = 32,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 4,
            margin = { left = 8, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end

    CreateMapTooltipParts(gameEntry);
end

function CreateMapTooltipParts(gameEntry)
    GameTooltip:AddLine("\n"..goldEscapeColor.."Map and match data|r");

    -- Get the map statistics
    -- Iterate every game and get map specific data
    local gamesPlayed = 0;
    local gamesWon = 0;
    local gamesLost = 0;
    local highestTwos = -1;
    local highestThrees = -1;
    local twosWon = 0;
    local twosLost = 0;
    local threesWon = 0;
    local threesLost = 0;

    for k, v in ipairs(data) do
        if v.map and v.map == gameEntry.map then
            gamesPlayed = gamesPlayed + 1;

            if v.playerSide == v.winner then
                gamesWon = gamesWon + 1;
                
                if gameEntry.playersNum == 6 then
                    threesWon = threesWon + 1;
                elseif gameEntry.playersNum == 4 then
                    twosWon = twosWon + 1;
                end
            else
                gamesLost = gamesLost + 1;
                
                if gameEntry.playersNum == 6 then
                    threesLost = threesLost + 1;
                elseif gameEntry.playersNum == 4 then
                    twosLost = twosLost + 1;
                end
            end

            if v.teamRatingOne and v.teamRatingZero then
                if v.playersNum == 6 then
                    local level = floor((v.teamRatingOne + v.teamRatingZero) / 2);
                    if level > highestThrees then
                        highestThrees = level;
                    end
                elseif v.playersNum == 4 then
                    local level = floor((v.teamRatingOne + v.teamRatingZero) / 2);
                    if level > highestTwos then
                        highestTwos = level;
                    end
                end
            end
        end
    end

    -- Show the map statistics
    if gameEntry.startStamp ~= nil then
        GameTooltip:AddDoubleLine(lightGreyEscapeColor..GetRealZoneText(gameEntry.map).."|r"..whiteEscapeColor.."\nStart: \nEnded: \nDuration:\nWin-Loss ratio: |r", 
            blueEscapeColor.."\n"..date("%H:%M:%S", gameEntry.startStamp).."\n"..date("%H:%M:%S", gameEntry.timeStamp).."\n"..date("%M:%S", gameEntry.timeStamp - gameEntry.startStamp).."\n"..floor((gamesWon / gamesPlayed)*100).."%|r"
            , 1, 1, 1, 1, 1, 1);
    else
        GameTooltip:AddDoubleLine(lightGreyEscapeColor..GetRealZoneText(gameEntry.map).."|r"..whiteEscapeColor.."\nEnded: \nWin-Loss ratio: |r", 
            blueEscapeColor.."\n"..date("%H:%M:%S", gameEntry.timeStamp).."\n"..floor((gamesWon / gamesPlayed)*100).."%|r"
            , 1, 1, 1, 1, 1, 1);
    end
    GameTooltip:AddTexture(GetFileIDFromPath(GetMapTexture(gameEntry.map)), {
        width = 96,
        height = 96,
        anchor = Enum.TooltipTextureAnchor.LeftTop,
        region = Enum.TooltipTextureRelativeRegion.LeftLine,
        verticalOffset = 0,
        margin = { left = 8, right = 8, top = 0, bottom = 0 },
        texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
        vertexColor = { r = 1, g = 1, b = 1, a = 1 },
    });

    --local stringLine = UnitName("player").." ";
    local stringLine = "";
    if gameEntry.playerPersonalTalents ~= nil then
        for k, v in ipairs(gameEntry.playerPersonalTalents) do
            if v.talentName and v.talentTexture then
                stringLine = stringLine.."|T"..v.talentTexture..":48:48:0:0|t ";
            end
        end
    end
    stringLine = stringLine.." - "
    if gameEntry.playerPersonalPvpTalents ~= nil then
        GameTooltip:AddLine("\n");
        for k, v in ipairs(gameEntry.playerPersonalPvpTalents) do
            if v.talentName and v.talentTexture then
                stringLine = stringLine.."|T"..v.talentTexture..":48:48:0:0|t ";
            end
        end
    end
    
    GameTooltip:AddLine("\n"..goldEscapeColor.."Talents|r");
    if gameEntry.playerPersonalTalents == nil or gameEntry.playerPersonalPvpTalents == nil then
        GameTooltip:AddLine(whiteEscapeColor.."Either this game was recorded with an old version or the data got corrupted :(|r");
    else
        GameTooltip:AddLine("\n"..stringLine);
    end

    GameTooltip:AddLine("\n\n"..goldEscapeColor.."Your trinkets|r");
    if gameEntry.trinkOne ~= nil then
        GameTooltip:AddLine("\n");
        GameTooltip:AddDoubleLine("\n"..whiteEscapeColor..gameEntry.trinkOne[1].name, "\n"..blueEscapeColor..gameEntry.trinkOne[1].iLevel.." item level|r");
        GameTooltip:AddTexture(gameEntry.trinkOne[1].texture, {
            width = 42,
            height = 42,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 0,
            margin = { left = 0, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end
    if gameEntry.trinkTwo ~= nil then
        GameTooltip:AddDoubleLine("\n"..whiteEscapeColor..gameEntry.trinkTwo[1].name, "\n"..blueEscapeColor..gameEntry.trinkTwo[1].iLevel.." item level|r");
        GameTooltip:AddTexture(gameEntry.trinkTwo[1].texture, {
            width = 42,
            height = 42,
            anchor = Enum.TooltipTextureAnchor.LeftTop,
            region = Enum.TooltipTextureRelativeRegion.LeftLine,
            verticalOffset = 0,
            margin = { left = 0, right = 8, top = 0, bottom = 0 },
            texCoords = { left = 0, right = 1, top = 0, bottom = 1 },
            vertexColor = { r = 1, g = 1, b = 1, a = 1 },
        });
    end

    if gameEntry.trinkOne == nil and gameEntry.trinkTwo == nil then
        GameTooltip:AddLine(whiteEscapeColor.."Either this game was recorded with an old version or the data got corrupted :(|r");
    end
end

function GetFormattedNumber(dmgHeal)
    if dmgHeal < 1000 then
        return dmgHeal;
    elseif dmgHeal < 1000000 then
        return floor(dmgHeal / 1000).."K";
    else
        return floor(dmgHeal / 1000000).."M";
    end
end