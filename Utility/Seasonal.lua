function GetCurrentSeasonTitle()
    local currentSeason = GetCurrentArenaSeason();

    if currentSeason == 30 then
        return textInserts.seasonThirty;
    elseif currentSeason == 31 then
        return textInserts.seasonThirtyOne;
    end
    return textInserts.seasonUpgrade;
end

function GetCurrentXpacTitle()
    local xpacLevel = GetServerExpansionLevel();
    if xpacLevel ~= 8 then
        return "???";
    end
    return textInserts.expansions.sl;
end