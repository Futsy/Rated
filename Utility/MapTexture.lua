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
        return textInserts.expansions.mists;
    elseif id == 2373 then
        return textInserts.expansions.sl;
    elseif id == 2167 then
        return textInserts.expansions.bfa;
    elseif id == 617 then
        return textInserts.expansions.wotlk;
    elseif id == 980 then
        return textInserts.expansions.mists;
    elseif id == 572 then
        return textInserts.expansions.bc;
    elseif id == 1672 then
        return textInserts.expansions.bc;
    elseif id == 1552 then
        return textInserts.expansions.legion;
    elseif id == 1911 then
        return textInserts.expansions.bfa;
    elseif id == 1504 then
        return textInserts.expansions.legion;
    elseif id == 1825 then
        return textInserts.expansions.bfa;
    elseif id == 1505 then
        return textInserts.expansions.bc;
    else
        return textInserts.expansions.unknown;
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