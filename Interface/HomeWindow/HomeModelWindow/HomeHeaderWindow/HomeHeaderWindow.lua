local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);
local goldEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 125);

function CreateHomeHeaderWindow()
    --
    -- Display the season name
    --

    -- Create a container for the season title that sticks to the top
    local topHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.1, nil, 0, 0);

    -- Start with season text
    Text(topHeaderWindow, texts.seasonLabel);

    -- Start with title of the season Large
    callbacks.seasonTitleText = Text(topHeaderWindow, texts.seasonName);
    callbacks.seasonTitleText:SetText(GetCurrentSeasonTitle());

    CreateTooltipForSeasonHeader(topHeaderWindow);

    --
    -- Display highest obtained rank
    --

    -- Create a container for the badge
    local highestHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.07, nil, 0, -(callbacks.homeModelWindow:GetHeight() * 0.1));
    
    -- Show highest text
    Text(highestHeaderWindow, texts.highestHeaderLabel);

    -- Show the highest earned rank
    callbacks.seasonHighestText = Text(highestHeaderWindow, texts.seasonHighLabel);
    callbacks.seasonHighestText:SetText(ResolveTitle(HighestSeasonRank()));

    CreateTooltipForSeasonHigh(highestHeaderWindow);

    --
    -- Display 2v2 current
    --

    -- Create a container for the badge
    local twosHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.07, nil, 0, -(callbacks.homeModelWindow:GetHeight() * 0.17));

    -- Show highest text
    Text(twosHeaderWindow, texts.twosHighestLabel);

    -- Show the highest earned rank
    callbacks.twosCurrentText = Text(twosHeaderWindow, texts.twosHighestDetail);
    callbacks.twosCurrentText:SetText(data.twoVTwoRating);

    CreateTooltipForTwosCurrent(twosHeaderWindow);

    --
    -- Display 3v3 current
    --

    -- Create a container for the badge
    local threesHeaderWindow = Position(nil, callbacks.homeModelWindow, nil, callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.07, nil, 0, -(callbacks.homeModelWindow:GetHeight() * 0.24));
    
    -- Show highest text
    Text(threesHeaderWindow, texts.threesHighestLabel);

    -- Show the highest earned rank
    callbacks.threesCurrentText = Text(threesHeaderWindow, texts.threesHighestDetail);
    callbacks.threesCurrentText:SetText(data.threeVThreeRating);

    threesHeaderWindow:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine(textInserts.threesHeader);
        GameTooltip:AddLine(whiteEscapeColor..textInserts.threesSummary, 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixCurrent, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.threeVThreeRating).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixRating, blueEscapeColor..data.threeVThreeRating.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixSeason, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.threeVThreeSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixHighest, blueEscapeColor..data.threeVThreeSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixPlayed, blueEscapeColor..data.threeVThreeSeasonPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixWon, blueEscapeColor..data.threeVThreeSeasonWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixLost, blueEscapeColor..(data.threeVThreeSeasonPlayed - data.threeVThreeSeasonWon).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixWeek, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.threeVThreeWeeklyBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixHighest, blueEscapeColor..data.threeVThreeWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixPlayed, blueEscapeColor..data.threeVThreeWeeklyPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixWon, blueEscapeColor..data.threeVThreeWeeklyWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixLost, blueEscapeColor..(data.threeVThreeWeeklyPlayed - data.threeVThreeWeeklyWon).."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    threesHeaderWindow:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForSeasonHeader(frame)
    frame:SetScript("OnEnter", function(self, motion)
        local currentSeasonNumber = GetCurrentArenaSeason();
        local expansionName = GetCurrentXpacTitle();

        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine(textInserts.seasonInfo);
        GameTooltip:AddLine(whiteEscapeColor..textInserts.seasonFunReminder, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipNameLabel, blueEscapeColor..GetCurrentSeasonTitle().."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipNumberLabel, blueEscapeColor..currentSeasonNumber.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipExpansionLabel, blueEscapeColor..expansionName.."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForSeasonHigh(frame)
    frame:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine(textInserts.seasonHeader);
        GameTooltip:AddLine(whiteEscapeColor..textInserts.seasonSummary, 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor.."2v2|r", 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipHighestTitle, blueEscapeColor..ResolveTitle(data.twoVTwoSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipSeasonHighest, blueEscapeColor..data.twoVTwoSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipWeeklyHighest, blueEscapeColor..data.twoVTwoWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."3v3|r", 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipHighestTitle, blueEscapeColor..ResolveTitle(data.threeVThreeSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipSeasonHighest, blueEscapeColor..data.threeVThreeSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.tooltipWeeklyHighest, blueEscapeColor..data.threeVThreeWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForTwosCurrent(frame)
    frame:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine(textInserts.twosHeader);
        GameTooltip:AddLine(whiteEscapeColor..textInserts.twosSummary, 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixCurrent, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.twoVTwoRating).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixRating, blueEscapeColor..data.twoVTwoRating.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixSeason, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.twoVTwoSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixHighest, blueEscapeColor..data.twoVTwoSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixPlayed, blueEscapeColor..data.twoVTwoSeasonPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixWon, blueEscapeColor..data.twoVTwoSeasonWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixLost, blueEscapeColor..(data.twoVTwoSeasonPlayed - data.twoVTwoSeasonWon).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor..textInserts.prefixWeek, 1, 1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixTitle, blueEscapeColor..ResolveTitle(data.twoVTwoWeeklyBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixHighest, blueEscapeColor..data.twoVTwoWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixPlayed, blueEscapeColor..data.twoVTwoWeeklyPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixWon, blueEscapeColor..data.twoVTwoWeeklyWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine(textInserts.prefixLost, blueEscapeColor..(data.twoVTwoWeeklyPlayed - data.twoVTwoWeeklyWon).."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end