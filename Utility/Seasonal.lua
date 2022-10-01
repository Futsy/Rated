function GetCurrentSeasonTitle()
    local currentSeason = GetCurrentArenaSeason();

    if currentSeason == 30 then
        return textInserts.seasonThirty;
    elseif currentSeason == 31 then
        return textInserts.seasonThirtyOne;
    elseif currentSeason == 32 then
        return textInserts.seasonThirtyTwo;
    elseif currentSeason == 33 then
        return textInserts.seasonThirtyThree;
    elseif currentSeason == 34 then
        return textInserts.seasonThirtyFour;
    end
    return textInserts.seasonUpgrade;
end

function GetCurrentXpacTitle()
    local xpacLevel = GetServerExpansionLevel();
    if xpacLevel ~= 8 then
        return textInserts.expansions.df;
    end
    return textInserts.expansions.sl;
end