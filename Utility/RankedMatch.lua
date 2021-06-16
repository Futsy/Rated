function IsRankedMatch()
    local inInstance, instanceType = IsInInstance();

    if instanceType == "arena" and C_PvP.IsRatedMap() and not IsArenaSkirmish() then
        return true;
    end
    return false;
end

function IsSkirmish()
    local inInstance, instanceType = IsInInstance();

    if instanceType == "arena" and C_PvP.IsRatedMap() and IsArenaSkirmish() then
        return true;
    end
    return false;
end

function IsItRated(gameEntry)
    if gameEntry.isArena and gameEntry.rated ~= nil and gameEntry.skirmish == false then
        return true;
    end
    return false;
end