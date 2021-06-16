function GetMapTexture(id)
    -- 1134 Tiger's peak
    -- 2373 Sunglasses arena
    -- 2167 Robodrome
    -- 617 Dalaran sewers
    -- 980 tolviron
    -- 572 Ruins
    -- 1672 Blade's edge
    -- 1552 Ashamane
    -- 1911 Mugambala
    -- 1504 Blackrook hold
    -- 1825 Hookpoint
    -- 1505 Nagrand
    if id == 1134 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadingScreen_Shadowpan_bg";
    elseif id == 2373 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenSkywallRaid";
    elseif id == 2167 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenGnomeregan";
    elseif id == 617 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenDalaranSewersArena";
    elseif id == 980 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenTolvirArena";
    elseif id == 572 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenRuinsofLordaeronBattlegrounds";
    elseif id == 1672 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenBladesEdgeArena";
    elseif id == 1552 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenWanderingIsle";
    elseif id == 1911 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadingScreen_ZuldazarArena";
    elseif id == 1504 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadingScreen_BlackrookHoldArena_wide";
    elseif id == 1825 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadingScreen_AlliancePVParena_MasterWidescreen_BattleforAzeroth";
    elseif id == 1505 then
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenNagrandArenaBattlegrounds";
    else
        return "Interface\\GLUES\\LOADINGSCREENS\\LoadScreenOrgrimmarArena";
    end
end

function GetExpansionForMap(id)
    if id == 1134 then
        return "Mists of pandaria";
    elseif id == 2373 then
        return "Shadowlands";
    elseif id == 2167 then
        return "Battle for azeroth";
    elseif id == 617 then
        return "Wrath of the lich king";
    elseif id == 980 then
        return "Mists of pandaria";
    elseif id == 572 then
        return "Burning crusade";
    elseif id == 1672 then
        return "Burning crusade";
    elseif id == 1552 then
        return "Legion";
    elseif id == 1911 then
        return "Battle for azeroth";
    elseif id == 1504 then
        return "Legion";
    elseif id == 1825 then
        return "Battle for azeroth";
    elseif id == 1505 then
        return "Burning crusade";
    else
        return "Unknown";
    end
end

function GetExpansionBackdrop(id)
    if id == 1134 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-MPLogo";
    elseif id == 2373 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-ShadowlandsLogo";
    elseif id == 2167 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-BattleforAzerothLogo";
    elseif id == 617 then
        return "Interface\\GLUES\\COMMON\\Glues-WOW-WoltkLogo";
    elseif id == 980 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-MPLogo";
    elseif id == 572 then
        return "Interface\\GLUES\\COMMON\\GLUES-WOW-BCLOGO";
    elseif id == 1672 then
        return "Interface\\GLUES\\COMMON\\GLUES-WOW-BCLOGO";
    elseif id == 1552 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-LegionLogo";
    elseif id == 1911 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-BattleforAzerothLogo";
    elseif id == 1504 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-LegionLogo";
    elseif id == 1825 then
        return "Interface\\GLUES\\COMMON\\Glues-WoW-BattleforAzerothLogo";
    elseif id == 1505 then
        return "Interface\\GLUES\\COMMON\\GLUES-WOW-BCLOGO";
    else
        return "Interface\\GLUES\\COMMON\\GLUES-WOW-CLASSICLOGO";
    end
end