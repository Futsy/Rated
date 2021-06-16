-- This enum keeps common backdrops 
bd = {
    TooltipBg = "Interface\\Tooltips\\UI-Tooltip-Background",
    TooltipBor = "Interface\\Tooltips\\UI-Tooltip-Border",
    EightTimesEight = "Interface\\BUTTONS\\WHITE8X8",
    ItemTextSilver = "Interface\\ItemTextFrame\\ItemText-Silver-TopLeft",
    BannerEmblem = "Interface\\PVPFrame\\Icons\\PVP-Banner-Emblem-94",
    ClassicLogo = "Interface\\GLUES\\COMMON\\GLUES-WOW-CLASSICLOGO",
    PrestigeIcon = "Interface\\PVPFrame\\Icons\\prestige-icon-4-2",
    BgHorde = "Interface\\PVPFRAME\\ScoreboardBackgroundWarfrontsHorde",
    BgAlliance = "Interface\\PVPFRAME\\ScoreboardBackgroundWarfrontsAlliance",
    ButtonUp = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",
    ButtonHighlight = "Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight",
    ButtonDown = "Interface\\Buttons\\UI-Panel-MinimizeButton-Down",
    BgScore = "Interface\\WORLDSTATEFRAME\\WorldStateFinalScoreFrame-TopBackground",
    Disconnect = "Interface\\CHARACTERFRAME\\Disconnect-Icon",
    RankedIcon = "Interface\\PVPFrame\\Icons\\UI_RankedPvP"
};

-- Titles for PVP rating
titles = {
    Unranked = "Unranked",
    Gladiator = "Gladiator",
    Duelist = "Duelist",
    Rival = "Rival",
    Challenger = "Challenger",
    Combatant = "Combatant"
};

-- Colors for text and other things
colors = {
    white = {
        1, 1, 1, 1
    },
    grey = {
        0.7, 0.7, 0.7, 1
    },
    light = {
        0.5, 0.5, 0.5, 1
    },
    addonHeader = {
        1, 0.9, 0.35, 1
    }
};

-- This contains all the fonts and text in the addon
fonts = {
    shadowLarge = "Game48FontShadow",
    sysFontTiny = "SystemFont_Tiny",
    gameFontBig = "Game27Font",
    gameFontVeryBig = "Game30Font",
    gameFontRegular = "GameFontNormal",
    fancyFontSmall = "Fancy18Font",
    fancyFontRegular = "Fancy20Font",
    fancyFontBig = "Fancy32Font",
    gameFontRegularShadow = "Game13FontShadow",
    FriendsFont = "FriendsFont_Large",
    addonSpecial = "Game12Font_o1"
};

texts = {
    badgeModeText = { fonts.shadowLarge, colors.white, "CENTER", 0, 0, "3v3" },
    badgeRankText = { fonts.shadowLarge, colors.white, "CENTER", 0, 0, "Honor" },
    threesVsText = { fonts.shadowLarge, colors.white, "CENTER", 0, 0, "vs" },
    threesDetail = { fonts.sysFontTiny, colors.grey, nil, 73, -34, "NONE" },
    threesRegular = { fonts.gameFontBig, colors.white, nil, 70, -5, "NONE" },
    backButton = { fonts.gameFontRegular, colors.white, "CENTER", 0, 0, "< BACK" },
    yourTeamText = { fonts.gameFontVeryBig, colors.white, nil, 20, -10, "Your team" },
    killingBlowsDetail = { fonts.gameFontRegular, colors.white, nil, 20, -54, "0" },
    killingBlowsText = { fonts.gameFontRegular, colors.grey, nil, 20, -66, " Killing blows" },
    totalDamageDetail = { fonts.gameFontRegular, colors.white, nil, 20, -84, "0" },
    totalDamageText = { fonts.gameFontRegular, colors.grey, nil, 20, -96, " Total damage done" },
    totalHealingDetail = { fonts.gameFontRegular, colors.white, nil, 20, -114, "0" },
    totalHealingText = { fonts.gameFontRegular, colors.grey, nil, 20, -126, " Total healing done" },
    compositionDetail = { fonts.gameFontRegular, colors.white, nil, 20, -144, "DPS-DPS" },
    compositionText = { fonts.gameFontRegular, colors.grey, nil, 20, -156, " Composition" },
    enemyTeamText = { fonts.gameFontVeryBig, colors.white, nil, 20, -10, "Enemy team" },
    mapName = { fonts.gameFontVeryBig, colors.white, nil, 120, -8, "Unknown" },
    mapRecordedDetail = { fonts.gameFontRegular, colors.white, nil, 20, -54, "0 games" },
    mapRecordedText = { fonts.gameFontRegular, colors.grey, nil, 20, -66, " recorded for this map" },
    mapWonDetail = { fonts.gameFontRegular, colors.white, nil, 20, -84, "0 won games" },
    mapWonText = { fonts.gameFontRegular, colors.grey, nil, 20, -96, " recorded for this map" },
    mapLostDetail = { fonts.gameFontRegular, colors.white, nil, 20, -114, "0 lost games" },
    mapLostText = { fonts.gameFontRegular, colors.grey, nil, 20, -126, " recorded for this map"},
    mapHighestDetail = { fonts.gameFontRegular, colors.white, nil, 0, 0, "None" },
    mapHighestText = { fonts.gameFontRegular, colors.grey, nil, 0, 0, " highest recorded MMR for this map" },
    mapHighestTwosDetail = { fonts.gameFontRegular, colors.white, nil, 0, 0, "None" },
    mapHighestTwosText = { fonts.gameFontRegular, colors.grey, nil, 0, 0, " highest recorded 2v2 MMR for this map" },
    mapHighestThreesDetail = { fonts.gameFontRegular, colors.white, nil, 0, 0, "None" },
    mapHighestThreesText = { fonts.gameFontRegular, colors.grey, nil, 0, 0, " highest recorded 3v3 MMR for this map" },
    twosRatioDetail = { fonts.fancyFontRegular, colors.white, nil, 80, -18, "None" },
    twosRatioHeader = { fonts.gameFontRegularShadow, colors.grey, nil, 80, -38, "2v2" },
    threesRatioHeader = { fonts.gameFontRegularShadow, colors.grey, nil, 80, -38, "3v3" },
    twosRatioText = { fonts.fancyFontBig, colors.white, "TOPRIGHT", -10, -18, "100%" },
    dayHeaderPipe = { fonts.FriendsFont, colors.white, "CENTER", 0, 20, "|" },
    dayText = { fonts.FriendsFont, colors.white, "CENTER", 0, 0, "" },
    pipeSeparator = { fonts.FriendsFont, colors.white, "CENTER", 0, -17, "|" },
    sessionHeader = { fonts.FriendsFont, colors.white, "CENTER", 0, 0, "This session" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -49, -13, "" },
    winnerLabel = { fonts.FriendsFont, colors.white, "LEFT", 0, 0, "Loss" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "No games registered" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Season high" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Season" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
};

-- Frames regularly have to be re-used so we use this to keep track of them
-- It's essentially a list of references.
callbacks = {
    mainWindow = nil,
    mainEdgesWindow = nil,
    addonHeaderWindow = nil,
    addonHeaderText = nil,
    themedBackgroundWindow = nil,
    homeWindow = nil,
    homeModelWindow = nil,
    gameScrollerWindow = nil,
    seasonTitleText = nil,
    seasonHighestText = nil,
    twosCurrentText = nil,
    threesCurrentText = nil,
    noGamesFoundWindow = nil,
    homeScrollWindow = nil,
    gameScrollArea = nil,
    containerFrame = nil,
    firstDayHeaderWindow = nil,
};