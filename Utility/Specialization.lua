function GetIconForSpec(player)
    if player == nil or player.classToken == nil then
        return bd.Disconnect;
    elseif player.classToken == "DEATHKNIGHT" then
        return ResolveDeathKnight(player.talentSpec);
    elseif player.classToken == "DEMONHUNTER" then
        return ResolveDemonHunter(player.talentSpec);
    elseif player.classToken == "DRUID" then
        return ResolveDruid(player.talentSpec);
    elseif player.classToken == "HUNTER" then
        return ResolveHunter(player.talentSpec);
    elseif player.classToken == "MAGE" then
        return ResolveMage(player.talentSpec);
    elseif player.classToken == "MONK" then
        return ResolveMonk(player.talentSpec);
    elseif player.classToken == "PALADIN" then
        return ResolvePaladin(player.talentSpec);
    elseif player.classToken == "PRIEST" then
        return ResolvePriest(player.talentSpec);
    elseif player.classToken == "ROGUE" then
        return ResolveRogue(player.talentSpec);
    elseif player.classToken == "SHAMAN" then
        return ResolveShaman(player.talentSpec);
    elseif player.classToken == "WARLOCK" then
        return ResolveWarlock(player.talentSpec);
    elseif player.classToken == "WARRIOR" then
        return ResolveWarrior(player.talentSpec);
    else
        return bd.Disconnect;
    end
end

function ResolveWarrior(talentSpec)
    if talentSpec == "Arms" then
        return QuickResolve(71);
    elseif talentSpec == "Fury" then
        return QuickResolve(72);
    else
        return QuickResolve(73);
    end
end

function ResolveWarlock(talentSpec)
    if talentSpec == "Affliction" then
        return QuickResolve(265);
    elseif talentSpec == "Demonology" then
        return QuickResolve(266);
    else
        return QuickResolve(267);
    end
end

function ResolveShaman(talentSpec)
    if talentSpec == "Elemental" then
        return QuickResolve(262);
    elseif talentSpec == "Enhancement" then
        return QuickResolve(263);
    else
        return QuickResolve(264);
    end
end

function ResolveRogue(talentSpec)
    if talentSpec == "Assassination" then
        return QuickResolve(259);
    elseif talentSpec == "Outlaw" then
        return QuickResolve(260);
    else
        return QuickResolve(261);
    end
end

function ResolvePriest(talentSpec)
    if talentSpec == "Discipline" then
        return QuickResolve(256);
    elseif talentSpec == "Holy" then
        return QuickResolve(257);
    else
        return QuickResolve(258);
    end
end

function ResolvePaladin(talentSpec)
    if talentSpec == "Holy" then
        return QuickResolve(65);
    elseif talentSpec == "Protection" then
        return QuickResolve(66);
    else
        return QuickResolve(70);
    end
end

function ResolveMonk(talentSpec)
    if talentSpec == "Brewmaster" then
        return QuickResolve(268);
    elseif talentSpec == "Mistweaver" then
        return QuickResolve(270);
    else
        return QuickResolve(269);
    end
end

function ResolveMage(talentSpec)
    if talentSpec == "Arcane" then
        return QuickResolve(62);
    elseif talentSpec == "Fire" then
        return QuickResolve(63);
    else
        return QuickResolve(64);
    end
end

function ResolveHunter(talentSpec)
    if talentSpec == "Beast Mastery" then
        return QuickResolve(253);
    elseif talentSpec == "Marksmanship" then
        return QuickResolve(254);
    else
        return QuickResolve(255);
    end
end

function ResolveDruid(talentSpec)
    if talentSpec == "Balance" then
        return QuickResolve(102);
    elseif talentSpec == "Feral" then
        return QuickResolve(103);
    elseif talentSpec == "Guardian" then
        return QuickResolve(104);
    else
        return QuickResolve(105);
    end
end

function ResolveDemonHunter(talentSpec)
    if talentSpec == "Havoc" then
        return QuickResolve(577);
    else
        return QuickResolve(581);
    end
end

function ResolveDeathKnight(talentSpec)
    if talentSpec == "Blood" then
        return QuickResolve(250);
    elseif talentSpec == "Frost" then
        return QuickResolve(251);
    else
        return QuickResolve(252);
    end
end

function QuickResolve(specId)
    local id, name, description, icon, role, class = GetSpecializationInfoByID(specId);
    return icon;
end