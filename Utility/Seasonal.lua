function GetCurrentSeasonTitle()
    local currentSeason = GetCurrentArenaSeason();

    if currentSeason == 1 then
        return "Swift";
    elseif currentSeason == 2 then
        return "Merciless";
    elseif currentSeason == 3 then
        return "Vengeful"
    elseif currentSeason == 4 then
        return "Brutal";
    elseif currentSeason == 5 then
        return "Deadly";
    elseif currentSeason == 6 then
        return "Furious";
    elseif currentSeason == 7 then
        return "Relentless";
    elseif currentSeason == 8 then
        return "Wrathful";
    elseif currentSeason == 9 then
        return "Vicious";
    elseif currentSeason == 10 then
        return "Ruthless";
    elseif currentSeason == 11 then
        return "Cataclysmic";
    elseif currentSeason == 12 then
        return "Malevolent";
    elseif currentSeason == 13 then
        return "Tyrannical";
    elseif currentSeason == 14 then
        return "Grievous";
    elseif currentSeason == 15 then
        return "Prideful";
    elseif currentSeason == 16 then
        return "Primal";
    elseif currentSeason == 17 then
        return "Wild";
    elseif currentSeason == 18 then
        return "Warmongering";
    elseif currentSeason == 19 then
        return "Vindictive";
    elseif currentSeason == 20 then
        return "Fearless";
    elseif currentSeason == 21 then
        return "Cruel";
    elseif currentSeason == 22 then
        return "Ferocious";
    elseif currentSeason == 23 then
        return "Fierce";
    elseif currentSeason == 24 then
        return "Dominant";
    elseif currentSeason == 25 then
        return "Demonic";
    elseif currentSeason == 26 then
        return "Dread";
    elseif currentSeason == 27 then
        return "Sinister";
    elseif currentSeason == 28 then
        return "Notorious";
    elseif currentSeason == 29 then
        return "Corrupted";
    elseif currentSeason == 30 then
        return "Sinful";
    elseif currentSeason == 31 then
        return "Unchained";
    end
    return "Upgrade addon";
end