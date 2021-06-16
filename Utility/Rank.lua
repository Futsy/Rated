function ResolveTitle(rating)
    local title = titles.Unranked;
    if (rating >= 2400) then
        title = titles.Gladiator;
    elseif (rating >= 2100) then
        title = titles.Duelist;
    elseif (rating >= 1800) then
        title = titles.Rival;
    elseif (rating >= 1600) then
        title = titles.Challenger;
    elseif (rating >= 1400) then
        title = titles.Combatant;
    end
    return title;
end

function HighestSeasonRank()
    if (data.twoVTwoSeasonBest > data.threeVThreeSeasonBest) then
        return data.twoVTwoSeasonBest;
    else
        return data.threeVThreeSeasonBest;
    end
end

function ResolveSmallTexture(rating)
    return ResolveLargeTexture(rating).."_Small";
end

function ResolveSmallTextureToId(rating)
    return GetFileIDFromPath(ResolveSmallTexture(rating));
end

function ResolveLargeTexture(rating)
    local texture = bd.RankedIcon.."_01";
    if (rating >= 2400) then
        texture = bd.RankedIcon.."_06";
    elseif (rating >= 2100) then
        texture = bd.RankedIcon.."_05";
    elseif (rating >= 1800) then
        texture = bd.RankedIcon.."_04";
    elseif (rating >= 1600) then
        texture = bd.RankedIcon.."_03";
    elseif (rating >= 1400) then
        texture = bd.RankedIcon.."_02";
    end
    return texture;
end

function ResolveLargeTextureToId(rating)
    return GetFileIDFromPath(ResolveLargeTexture(rating));
end