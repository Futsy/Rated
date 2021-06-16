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

    local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
    local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);
    local goldEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 125);

    threesHeaderWindow:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine("3v3 stats");
        GameTooltip:AddLine(whiteEscapeColor.."Summary of all the games played in 3v3.\n\n".."|r", 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor.."Current".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.threeVThreeRating).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Rating: ", blueEscapeColor..data.threeVThreeRating.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."Season".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.threeVThreeSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Highest: ", blueEscapeColor..data.threeVThreeSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Played: ", blueEscapeColor..data.threeVThreeSeasonPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Won: ", blueEscapeColor..data.threeVThreeSeasonWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Lost: ", blueEscapeColor..(data.threeVThreeSeasonPlayed - data.threeVThreeSeasonWon).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."This week".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.threeVThreeWeeklyBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Highest: ", blueEscapeColor..data.threeVThreeWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Played: ", blueEscapeColor..data.threeVThreeWeeklyPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Won: ", blueEscapeColor..data.threeVThreeWeeklyWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Lost: ", blueEscapeColor..(data.threeVThreeWeeklyPlayed - data.threeVThreeWeeklyWon).."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    threesHeaderWindow:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForSeasonHeader(frame)
    local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
    local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);

    frame:SetScript("OnEnter", function(self, motion)
        local expansionLevel = GetMaximumExpansionLevel();
        local currentSeasonNumber = GetCurrentArenaSeason();
        local expansionName = "Unknown";
        
        if expansionLevel == 8 then
            expansionName = "Shadowlands";
        end

        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine("Season information");
        GameTooltip:AddLine(whiteEscapeColor.."Welcome to the season, don't forget to have fun!\n\n".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Name: ", blueEscapeColor..GetCurrentSeasonTitle().."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Number: ", blueEscapeColor..currentSeasonNumber.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Expansion: ", blueEscapeColor..expansionName.."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForSeasonHigh(frame)
    local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
    local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);
    local goldEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 125);

    frame:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine("Season high");
        GameTooltip:AddLine(whiteEscapeColor.."Season high is gathered from the highest rating \nattained during the season in 2v2 or 3v3.\n\n".."|r", 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor.."2v2".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Highest title: ", blueEscapeColor..ResolveTitle(data.twoVTwoSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Season high: ", blueEscapeColor..data.twoVTwoSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Weekly high: ", blueEscapeColor..data.twoVTwoWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."3v3".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Highest title: ", blueEscapeColor..ResolveTitle(data.threeVThreeSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Season high: ", blueEscapeColor..data.threeVThreeSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Weekly high: ", blueEscapeColor..data.threeVThreeWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end

function CreateTooltipForTwosCurrent(frame)
    local whiteEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 255);
    local blueEscapeColor = string.format("|cff%02x%02x%02x", 225, 225, 255);
    local goldEscapeColor = string.format("|cff%02x%02x%02x", 255, 255, 125);

    frame:SetScript("OnEnter", function(self, motion)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
        GameTooltip:ClearLines();

        GameTooltip:AddLine("2v2 stats");
        GameTooltip:AddLine(whiteEscapeColor.."Summary of all the games played in 2v2.\n\n".."|r", 1, 1, 1);
        GameTooltip:AddLine(goldEscapeColor.."Current".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.twoVTwoRating).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Rating: ", blueEscapeColor..data.twoVTwoRating.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."Season".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.twoVTwoSeasonBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Highest: ", blueEscapeColor..data.twoVTwoSeasonBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Played: ", blueEscapeColor..data.twoVTwoSeasonPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Won: ", blueEscapeColor..data.twoVTwoSeasonWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Lost: ", blueEscapeColor..(data.twoVTwoSeasonPlayed - data.twoVTwoSeasonWon).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddLine("\n");
        GameTooltip:AddLine(goldEscapeColor.."This week".."|r", 1, 1, 1);
        GameTooltip:AddDoubleLine("Title: ", blueEscapeColor..ResolveTitle(data.twoVTwoWeeklyBest).."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Highest: ", blueEscapeColor..data.twoVTwoWeeklyBest.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Played: ", blueEscapeColor..data.twoVTwoWeeklyPlayed.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Won: ", blueEscapeColor..data.twoVTwoWeeklyWon.."|r", 1, 1, 1, 1 ,1, 1);
        GameTooltip:AddDoubleLine("Lost: ", blueEscapeColor..(data.twoVTwoWeeklyPlayed - data.twoVTwoWeeklyWon).."|r", 1, 1, 1, 1 ,1, 1);

        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self, motion)
        GameTooltip:Hide();
    end);
end