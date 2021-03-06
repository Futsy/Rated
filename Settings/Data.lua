-- This enum keeps common backdrops 
bd = {
    TooltipBg = "Interface\\Tooltips\\UI-Tooltip-Background",
    TooltipBor = "Interface\\Tooltips\\UI-Tooltip-Border",
    EightTimesEight = "Interface\\BUTTONS\\WHITE8X8",
    ItemTextSilver = "Interface\\ItemTextFrame\\ItemText-Silver-TopLeft",
    BannerEmblem = "Interface\\PVPFrame\\Icons\\PVP-Banner-Emblem-94",
    ClassicLogo = "Interface\\GLUES\\COMMON\\GLUES-WOW-CLASSICLOGO",
    PrestigeIcon = "Interface\\PVPFrame\\Icons\\prestige-icon-4-2",
    BgHorde = "Interface\\PVPFrame\\ScoreboardBackgroundWarfrontsHorde",
    BgHorde3 = "Interface\\PVPFrame\\ScoreboardBackgroundDarkshoreWarfrontsHorde",
    BgAlliance = "Interface\\PVPFRAME\\ScoreboardBackgroundWarfrontsAlliance",
    BgAlliance2 = "Interface\\PVPFRAME\\ScoreboardBackgroundIslandsAlliance",
    BgAlliance3 = "Interface\\PVPFRAME\\ScoreboardBackgroundDarkshoreWarfrontsAlliance",
    ButtonUp = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",
    ButtonHighlight = "Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight",
    ButtonDown = "Interface\\Buttons\\UI-Panel-MinimizeButton-Down",
    MinUp = "Interface\\Buttons\\UI-Panel-BiggerButton-Up",
    MinHighlight = "Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight",
    MinDown = "Interface\\Buttons\\UI-Panel-BiggerButton-Down",
    MaxUp = "Interface\\Buttons\\UI-Panel-SmallerButton-Up",
    MaxHighlight = "Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight",
    MaxDown = "Interface\\Buttons\\UI-Panel-SmallerButton-Down",
    BgScore = "Interface\\WORLDSTATEFRAME\\WorldStateFinalScoreFrame-TopBackground",
    Disconnect = "Interface\\CHARACTERFRAME\\Disconnect-Icon",
    RankedIcon = "Interface\\PVPFrame\\Icons\\UI_RankedPvP",
    WinIcon = "Interface\\Buttons\\UI-CheckBox-Check",
    LossIcon = "Interface\\Buttons\\UI-CheckBox-Check-Disabled"
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
    skirmishCurrentText = nil,
    noGamesFoundWindow = nil,
    homeScrollWindow = nil,
    gameScrollArea = nil,
    containerFrame = nil,
    firstDayHeaderWindow = nil,
    backgroundTexture = nil,
    bottomHeaderWindow = nil,
    topHeaderWindow = nil,
    highestHeaderWindow = nil,
    twosHeaderWindow = nil,
    threesHeaderWindow = nil,
    skirmishHeaderWindow = nil
};

-- Frames for the game entries and headers
gameEntryHandles = {};
sectionHandles = {};

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

-- This contains all the fonts in the addon
fonts = {
    sysFontTiny = "SystemFont_Tiny",
    gameFontBig = "Game27Font",
    gameFontVeryBig = "Game30Font",
    gameFontRegular = "GameFontNormal",
    fancyFontMini = "Fancy16Font",
    fancyFontSmall = "Fancy18Font",
    fancyFontRegular = "Fancy20Font",
    fancyFontBig = "Fancy32Font",
    gameFontRegularShadow = "Game13FontShadow",
    FriendsFont = "FriendsFont_Large",
    addonSpecial = "Game12Font_o1",
    SysFontShadowHuge = "SystemFont_Shadow_Large2"
};

--
-- English/US
--
texts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Current session" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "No games registered" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontMini, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Season high" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Skirmish" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Season" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInserts = {
    -- Season names
    seasonUpgrade = "Off-season",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiator",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "Did not yet receive a ranking update.. please wait a second.",
    errorCorruptionGame = "Corrupt team composition so Rated didn't save the game. (Were you doing 2v3/1v2/etc?)",
    errorCorruptData = "Either this game was recorded with an old version or the data got corrupted :(|r",

    -- Minimap related
    welcomeTooltipText = "Welcome back ",
    headerOneWin = "1 win",
    headerOneLoss = "1 loss",
    headerWins = " wins",
    headerLosses = " losses",
    winGameLabel = "Win",

    -- Tooltip info game entry
    tooltipFinishedLabel = "This game was finished and recorded at ",
    tooltipFinishedDateInterval = " on ",
    tooltipUnratedName = "Honor",
    tooltipYourTeamLabel = "Your team",
    tooltipEnemyTeamLabel = "Enemy team",
    tooltipDamage = " damage",
    tooltipHealing = " healing",
    tooltipBracket = "Bracket",
    tooltipMapAndMatch = "Map and match data|r",
    mapStatsFull = "\nStart: \nEnded: \nDuration:\nWin-Loss ratio: |r",
    mapStatsSmall = "\nEnded: \nWin-Loss ratio: |r",
    tooltipTalents = "Talents|r",
    tooltipTrinkets = "Your trinkets|r",
    tooltipIlevel = " item level|r",
    levelPrefix = "Level ",

    -- Left side tooltips
    twosHeader = "2v2 stats",
    twosSummary = "Summary of all the games played in 2v2.\n\n|r",
    threesHeader = "3v3 stats",
    threesSummary = "Summary of all the games played in 3v3.\n\n|r",
    skirmishHeader = "Skirmish stats",
    skirmishSummary = "Summary of all the games played in Skirmish.\n\n|r",
    seasonHeader = "Season high",
    seasonSummary = "Season high is gathered from the highest rating \nattained during the season in 2v2 or 3v3.\n\n|r",
    seasonInfo = "Season information",
    seasonFunReminder = "Welcome to the season, don't forget to have fun!\n\n|r",

    prefixTitle = "Title: ",
    prefixHighest = "Highest: ",
    prefixPlayed = "Played: ",
    prefixWon = "Won: ",
    prefixLost = "Lost: ",
    prefixRating = "Rating: ",
    tooltipNameLabel = "Name: ",
    tooltipNumberLabel = "Number: ",
    tooltipExpansionLabel = "Expansion: ",
    tooltipHighestTitle = "Highest title: ",
    tooltipSeasonHighest = "Season high: ",
    tooltipWeeklyHighest = "Weekly high: ",

    prefixCurrent = "Current|r",
    prefixSeason = "Season|r",
    prefixWeek = "This week|r",
};

--
-- German
--
germanTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Diese sitzung" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "keine spiele registriert" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Saison hoch" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Scharm??tzel" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Saison" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsGerman = {
    -- Season names
    seasonUpgrade = "Off-season",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiator",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "Das Addon hat noch kein Ranking-Update erhalten. Bitte warten Sie eine Sekunde.",
    errorCorruptionGame = "Korrupte Teamzusammensetzung, so dass Rated das Spiel nicht gespeichert hat. (Hast du 2v3/1v2/usw. gemacht?)",
    errorCorruptData = "Entweder wurde dieses Spiel mit einer alten Version aufgenommen oder die Daten wurden besch??digt :(|r",

    -- Minimap related
    welcomeTooltipText = "Willkommen zur??ck ",
    headerOneWin = "1 win",
    headerOneLoss = "1 loss",
    headerWins = " wins",
    headerLosses = " losses",
    winGameLabel = "Win",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Dieses Spiel wurde beendet und aufgezeichnet um ",
    tooltipFinishedDateInterval = " auf ",
    tooltipUnratedName = "Ehre",
    tooltipYourTeamLabel = "Dein team",
    tooltipEnemyTeamLabel = "Gegnerisches Team",
    tooltipDamage = " besch??digung",
    tooltipHealing = " heilung",
    tooltipBracket = "Halterung",
    tooltipMapAndMatch = "Karten- und Matchdaten|r",
    mapStatsFull = "\nStart: \nBeendet: \nDuration:\nWin-Loss ratio: |r",
    mapStatsSmall = "\nBeendet: \nWin-Loss ratio: |r",
    tooltipTalents = "Talente|r",
    tooltipTrinkets = "Dein trinkets|r",
    tooltipIlevel = " item level|r",
    levelPrefix = "Level ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Zusammenfassung aller Spiele, die in 2v2 gespielt wurden.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Zusammenfassung aller Spiele, die in 3v3 gespielt wurden.\n\n|r",
    skirmishHeader = "Scharm??tzel",
    skirmishSummary = "Zusammenfassung aller in Scharm??tzel gespielten Spiele.\n\n|r",
    seasonHeader = "Saison hoch",
    seasonSummary = "Das Saisonhoch wird aus der h??chsten Wertung ermittelt, die w??hrend der Saison in 2v2 oder 3v3 erreicht wurde.\n\n|r",
    seasonInfo = "Saisoninformationen",
    seasonFunReminder = "Willkommen in der Saison, vergessen Sie nicht, Spa?? zu haben!\n\n|r",

    prefixTitle = "Titel: ",
    prefixHighest = "H??chste: ",
    prefixPlayed = "Gespielt: ",
    prefixWon = "Won: ",
    prefixLost = "Lost: ",
    prefixRating = "Bewertung: ",
    tooltipNameLabel = "Name: ",
    tooltipNumberLabel = "Nummer: ",
    tooltipExpansionLabel = "Erweiterung: ",
    tooltipHighestTitle = "H??chste titel: ",
    tooltipSeasonHighest = "Saison hoch: ",
    tooltipWeeklyHighest = "Wochenhoch: ",

    prefixCurrent = "Strom|r",
    prefixSeason = "Saison|r",
    prefixWeek = "Diese woche|r",
};

--
-- Korean
--
koreanTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "??? ??????" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "?????????" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "?????? ??? ????????? ????????????." },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "?????? ??????" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "?????? ??????" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "??????" },
    seasonName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsKorean = {
    -- Season names
    seasonUpgrade = "?????????",
    seasonThirty = "??? ??????",
    seasonThirtyOne = "???????????? ??????",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "?????? ??????",
        Gladiator = "?????????",
        Duelist = "???????????????",
        Rival = "?????????",
        Challenger = "?????????",
        Combatant = "?????????"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "?????? ?????? ????????????????????? ??????????????? .. ????????? ??????????????????.",
    errorCorruptionGame = "??? ????????? ???????????? Rated??? ????????? ???????????? ???????????????. (2v3 / 1v2 / ???????????? ?????????????)",
    errorCorruptData = "??? ????????? ?????? ???????????? ?????????????????? ???????????? ?????????????????????. :(|r",

    -- Minimap related
    welcomeTooltipText = "?????? ?????? ?????? ??????????????? ",
    headerOneWin = "1 ??????",
    headerOneLoss = "1 ??????",
    headerWins = " ??????",
    headerLosses = " ????????? ???",
    winGameLabel = "??????",

    -- Tooltip info game entry
    tooltipFinishedLabel = "??? ????????? ???????????? ????????????????????? ",
    tooltipFinishedDateInterval = " ??? ?????? ",
    tooltipUnratedName = "??????",
    tooltipYourTeamLabel = "????????? ???",
    tooltipEnemyTeamLabel = "??? ???",
    tooltipDamage = " ????????? ??????",
    tooltipHealing = " ??????",
    tooltipBracket = "?????????",
    tooltipMapAndMatch = "????????? ?????? ??? ??????|r",
    mapStatsFull = "\n?????????: \n??????: \n??????:\n?????? ???: |r",
    mapStatsSmall = "\n??????: \n?????? ???: |r",
    tooltipTalents = "??????|r",
    tooltipTrinkets = "????????? ?????????|r",
    tooltipIlevel = " ????????? ??????|r",
    levelPrefix = "?????? ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "2v2?????? ????????? ??? ?????? ?????? ??????.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "3v3?????? ????????? ??? ?????? ?????? ??????.\n\n|r",
    skirmishHeader = "?????? ??????",
    skirmishSummary = "?????????????????? ???????????? ?????? ?????? ??????.\n\n|r",
    seasonHeader = "?????? ??????",
    seasonSummary = "?????? ????????? 2v2 ?????? 3v3 ?????? ??????\n ?????? ??? ?????? ???????????? ???????????????.\n\n|r",
    seasonInfo = "?????? ??????",
    seasonFunReminder = "????????? ?????? ?????? ???????????????. ????????? ????????? ????????? ?????? ?????? ?????????!\n\n|r",

    prefixTitle = "??????: ",
    prefixHighest = "?????? ??????: ",
    prefixPlayed = "?????????: ",
    prefixWon = "?????????: ",
    prefixLost = "????????????: ",
    prefixRating = "??????: ",
    tooltipNameLabel = "??????: ",
    tooltipNumberLabel = "??????: ",
    tooltipExpansionLabel = "??????: ",
    tooltipHighestTitle = "?????? ?????????: ",
    tooltipSeasonHighest = "?????? ??????: ",
    tooltipWeeklyHighest = "?????? ??????: ",

    prefixCurrent = "??????|r",
    prefixSeason = "??????|r",
    prefixWeek = "?????? ???|r",
};

--
-- Chinese (simplified)
--
chineseChinaTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "??????" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "??????" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "??????????????????" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "????????????" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "???????????????" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "??????" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsChineseChina = {
    -- Season names
    seasonUpgrade = "??????",
    seasonThirty = "?????????",
    seasonThirtyOne = "?????????",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "?????????",
        Gladiator = "?????????",
        Duelist = "?????????",
        Rival = "????????????",
        Challenger = "?????????",
        Combatant = "?????????"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "???????????????????????????..????????????",
    errorCorruptionGame = "?????????????????????????????? Rated ????????????????????? ???????????? 2v3/1v2/etc ?????????",
    errorCorruptData = "?????????????????????????????????????????????????????????????????? :(|r",

    -- Minimap related
    welcomeTooltipText = "???????????? ",
    headerOneWin = "1 ???",
    headerOneLoss = "1 ??????",
    headerWins = " ??????",
    headerLosses = " ??????",
    winGameLabel = "???",

    -- Tooltip info game entry
    tooltipFinishedLabel = "?????????????????????????????? ",
    tooltipFinishedDateInterval = " ??? ",
    tooltipUnratedName = "??????",
    tooltipYourTeamLabel = "????????????",
    tooltipEnemyTeamLabel = "??????",
    tooltipDamage = " ??????",
    tooltipHealing = " ??????",
    tooltipBracket = "??????",
    tooltipMapAndMatch = "?????????????????????|r",
    mapStatsFull = "\n??????: \n??????: \n??????:\n?????????: |r",
    mapStatsSmall = "\n??????: \n?????????: |r",
    tooltipTalents = "??????|r",
    tooltipTrinkets = "???????????????|r",
    tooltipIlevel = " ????????????|r",
    levelPrefix = "?????? ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "??? 2v2 ?????????????????????????????????\n\n|r",
    threesHeader = "3v3",
    threesSummary = "??? 3v3 ?????????????????????????????????\n\n|r",
    skirmishHeader = "???????????????",
    skirmishSummary = "?????????????????????????????????.\n\n|r",
    seasonHeader = "??????",
    seasonSummary = "???????????????????????????????????? \n??????????????? 2v2 ??? 3v3 ?????????\n\n|r",
    seasonInfo = "????????????",
    seasonFunReminder = "??????????????????????????????????????????????????????\n\n|r",

    prefixTitle = "??????: ",
    prefixHighest = "??????: ",
    prefixPlayed = "??????: ",
    prefixWon = "??????: ",
    prefixLost = "?????????: ",
    prefixRating = "??????: ",
    tooltipNameLabel = "??????: ",
    tooltipNumberLabel = "??????: ",
    tooltipExpansionLabel = "??????: ",
    tooltipHighestTitle = "????????????: ",
    tooltipSeasonHighest = "??????: ",
    tooltipWeeklyHighest = "??????: ",

    prefixCurrent = "?????????|r",
    prefixSeason = "??????|r",
    prefixWeek = "?????????|r",
};

--
-- Chinese (taiwan)
--
chineseTaiwanTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "??????" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "??????" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "??????????????????" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "????????????" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "???????????????" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "??????" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsChineseTaiwan = {
    -- Season names
    seasonUpgrade = "??????",
    seasonThirty = "?????????",
    seasonThirtyOne = "?????????",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "?????????",
        Gladiator = "?????????",
        Duelist = "?????????",
        Rival = "????????????",
        Challenger = "?????????",
        Combatant = "?????????"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "???????????????????????????..????????????",
    errorCorruptionGame = "?????????????????????????????? Rated ????????????????????? ???????????? 2v3/1v2/etc ?????????",
    errorCorruptData = "?????????????????????????????????????????????????????????????????? :(|r",

    -- Minimap related
    welcomeTooltipText = "???????????? ",
    headerOneWin = "1 ???",
    headerOneLoss = "1 ??????",
    headerWins = " ??????",
    headerLosses = " ??????",
    winGameLabel = "???",

    -- Tooltip info game entry
    tooltipFinishedLabel = "?????????????????????????????? ",
    tooltipFinishedDateInterval = " ??? ",
    tooltipUnratedName = "??????",
    tooltipYourTeamLabel = "????????????",
    tooltipEnemyTeamLabel = "??????",
    tooltipDamage = " ??????",
    tooltipHealing = " ??????",
    tooltipBracket = "??????",
    tooltipMapAndMatch = "?????????????????????|r",
    mapStatsFull = "\n??????: \n??????: \n??????:\n?????????: |r",
    mapStatsSmall = "\n??????: \n?????????: |r",
    tooltipTalents = "??????|r",
    tooltipTrinkets = "???????????????|r",
    tooltipIlevel = " ????????????|r",
    levelPrefix = "?????? ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "??? 2v2 ?????????????????????????????????\n\n|r",
    threesHeader = "3v3",
    threesSummary = "??? 3v3 ?????????????????????????????????\n\n|r",
    skirmishHeader = "???????????????",
    skirmishSummary = "?????????????????????????????????.\n\n|r",
    seasonHeader = "??????",
    seasonSummary = "???????????????????????????????????? \n??????????????? 2v2 ??? 3v3 ?????????\n\n|r",
    seasonInfo = "????????????",
    seasonFunReminder = "??????????????????????????????????????????????????????\n\n|r",

    prefixTitle = "??????: ",
    prefixHighest = "??????: ",
    prefixPlayed = "??????: ",
    prefixWon = "??????: ",
    prefixLost = "?????????: ",
    prefixRating = "??????: ",
    tooltipNameLabel = "??????: ",
    tooltipNumberLabel = "??????: ",
    tooltipExpansionLabel = "??????: ",
    tooltipHighestTitle = "????????????: ",
    tooltipSeasonHighest = "??????: ",
    tooltipWeeklyHighest = "??????: ",

    prefixCurrent = "?????????|r",
    prefixSeason = "??????|r",
    prefixWeek = "?????????|r",
};

--
-- Russian
--
russianTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "?????????????? ????????????" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "?????????????????????? ????????" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -124, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "?????? ???????????????????????????????????? ??????" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "?????????????????? ?? ????????????" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2????2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3????3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "????????????" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "??????????" },
    seasonName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsRussian = {
    -- Season names
    seasonUpgrade = "????????????????????",
    seasonThirty = "??????????????????",
    seasonThirtyOne = "??????????????????????????",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "?????? ????????????????",
        Gladiator = "??????????????????",
        Duelist = "??????????????",
        Rival = "??????????????",
        Challenger = "????????????????????",
        Combatant = "????????"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "?????? ???? ???????????????? ???????????????????? ???????????????? ... ?????????????????? ??????????????.",
    errorCorruptionGame = "?????????????????????? ???????????? ??????????????, ?????????????? Rated ???? ???????????????????????? ????????. (???? ???????????? 2 ???? 3/1 ???? 2 ?? ??. ??.?)",
    errorCorruptData = "???????? ?????? ???????? ???????? ???????????????? ?? ???????????? ????????????, ???????? ???????????? ???????? ???????????????????? :(|r",

    -- Minimap related
    welcomeTooltipText = "?????????? ???????????????????? ?????????????? ",
    headerOneWin = "1 ????????????",
    headerOneLoss = "1 ??????????????????",
    headerWins = " ??????????",
    headerLosses = " ??????????????????",
    winGameLabel = "????????????",

    -- Tooltip info game entry
    tooltipFinishedLabel = "?????? ???????? ?????????????????????? ?? ???????? ???????????????? ?? ",
    tooltipFinishedDateInterval = " | ",
    tooltipUnratedName = "??????????",
    tooltipYourTeamLabel = "???????? ??????????????",
    tooltipEnemyTeamLabel = "?????????????? ????????????????????",
    tooltipDamage = " ????????",
    tooltipHealing = " ??????????????????",
    tooltipBracket = "????????????",
    tooltipMapAndMatch = "???????????? ?????????? ?? ??????????|r",
    mapStatsFull = "\n????????????: \n??????????: \n??????????????????????????????????:\n?????????????????????? ?????????? ?? ??????????????????: |r",
    mapStatsSmall = "\n??????????????????: \n?????????????????????? ?????????????????? ?? ????????????????????: |r",
    tooltipTalents = "??????????????|r",
    tooltipTrinkets = "???????? ????????????????????|r",
    tooltipIlevel = " ?????????????? ????????????????|r",
    levelPrefix = "?????????????? ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "???????????? ???????? ??????, ?????????????????? ?? ???????????? 2 ???? 2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "???????????? ???????? ??????, ?????????????????? ?? ???????????? 3 ???? 3.\n\n|r",
    skirmishHeader = "????????????",
    skirmishSummary = "???????????? ???????? ??????, ?????????????????? ?? ???????????? ????????????.\n\n|r",
    seasonHeader = "???????????????? ????????????",
    seasonSummary = "???????????????? ???????????? ???????????????????????? ???? ???????????? ???????????????????? ????????????????, \n???????????????????????? ?? ?????????????? ???????????? ?? ?????????????? 2 ???? 2 ?????? 3 ???? 3.\n\n|r",
    seasonInfo = "???????????????????? ?? ????????????",
    seasonFunReminder = "?????????? ???????????????????? ?? ??????????, ???? ?????????????????? ????????????????????!\n\n|r",

    prefixTitle = "????????????: ",
    prefixHighest = "??????????????????: ",
    prefixPlayed = "??????????????: ",
    prefixWon = "????????????: ",
    prefixLost = "??????????????????: ",
    prefixRating = "??????????????: ",
    tooltipNameLabel = "????????????????: ",
    tooltipNumberLabel = "??????????: ",
    tooltipExpansionLabel = "????????????????????: ",
    tooltipHighestTitle = "?????????????????? ????????????: ",
    tooltipSeasonHighest = "???????????????? ????????????: ",
    tooltipWeeklyHighest = "???????????????????????? ????????????????: ",

    prefixCurrent = "??????????????|r",
    prefixSeason = "???? ??????????|r",
    prefixWeek = "???? ???????? ????????????|r",
};

--
-- Spanish
--
spanishTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Esta sesi??n" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "No hay juegos registrados" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Temporada alta" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Escaramuza" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Estaci??n" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsSpanish = {
    -- Season names
    seasonUpgrade = "Fuera de temporada",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiator",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "A??n no recib?? una actualizaci??n de clasificaci??n. Espera un segundo.",
    errorCorruptionGame = "Composici??n del equipo corrupta, por lo que Rated no salv?? el juego. (??Estabas haciendo 2v3 / 1v2 / etc?)",
    errorCorruptData = "O este juego se grab?? con una versi??n anterior o los datos se corrompieron :(|r",

    -- Minimap related
    welcomeTooltipText = "Bienvenido de nuevo ",
    headerOneWin = "1 ganar",
    headerOneLoss = "1 p??rdida",
    headerWins = " gana",
    headerLosses = " p??rdidas",
    winGameLabel = "Ganar",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Este juego fue terminado y grabado en ",
    tooltipFinishedDateInterval = " en ",
    tooltipUnratedName = "Honor",
    tooltipYourTeamLabel = "Tu equipo",
    tooltipEnemyTeamLabel = "Equipo enemigo",
    tooltipDamage = " da??o",
    tooltipHealing = " cicatrizaci??n",
    tooltipBracket = "Soporte",
    tooltipMapAndMatch = "Datos de mapas y coincidencias|r",
    mapStatsFull = "\nComienzo: \nTerminado: \nDuraci??n:\nRelaci??n de p??rdidas y ganancias: |r",
    mapStatsSmall = "\nTerminado: \nRelaci??n de p??rdidas y ganancias: |r",
    tooltipTalents = "Talentos|r",
    tooltipTrinkets = "Tus baratijas|r",
    tooltipIlevel = " nivel de objeto|r",
    levelPrefix = "Nivel ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Resumen de todos los partidos jugados en 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Resumen de todos los partidos jugados en 3v3.\n\n|r",
    skirmishHeader = "Escaramuza",
    skirmishSummary = "Resumen de todas las partidas jugadas en Skirmish.\n\n|r",
    seasonHeader = "Temporada alta",
    seasonSummary = "El m??ximo de la temporada se obtiene de la calificaci??n m??s \nalta obtenida durante la temporada en 2v2 o 3v3.\n\n|r",
    seasonInfo = "Informaci??n de temporada",
    seasonFunReminder = "Bienvenido a la temporada, ??no te olvides de divertirte!\n\n|r",

    prefixTitle = "T??tulo: ",
    prefixHighest = "Mas alto: ",
    prefixPlayed = "Jugado: ",
    prefixWon = "Ganado: ",
    prefixLost = "Perdido: ",
    prefixRating = "Clasificaci??n: ",
    tooltipNameLabel = "Nombre: ",
    tooltipNumberLabel = "N??mero: ",
    tooltipExpansionLabel = "Expansi??n: ",
    tooltipHighestTitle = "T??tulo m??s alto: ",
    tooltipSeasonHighest = "T??tulo m??s alto: ",
    tooltipWeeklyHighest = "Alto semanal: ",

    prefixCurrent = "Actual|r",
    prefixSeason = "Estaci??n|r",
    prefixWeek = "Esta semana|r",
};

--
-- Portuguese
--
portugueseTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Esta sesi??n" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "No hay juegos registrados" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Temporada alta" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Escaramu??a" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Estaci??n" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsPortuguese = {
    -- Season names
    seasonUpgrade = "Entressafra",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiator",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "Ainda n??o recebi uma atualiza????o de classifica????o .. aguarde um segundo",
    errorCorruptionGame = "Composi????o da equipe corrompida, portanto, Rated n??o salvou o jogo. (Voc?? estava fazendo 2v3 / 1v2 / etc?)",
    errorCorruptData = "Este jogo foi gravado com uma vers??o antiga ou os dados foram corrompidos :(|r",

    -- Minimap related
    welcomeTooltipText = "Bem vindo de volta ",
    headerOneWin = "1 vencer",
    headerOneLoss = "1 perda",
    headerWins = " vit??rias",
    headerLosses = " perdas",
    winGameLabel = "Vencer",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Este jogo foi finalizado e gravado em ",
    tooltipFinishedDateInterval = " sobre ",
    tooltipUnratedName = "Honra",
    tooltipYourTeamLabel = "Seu time",
    tooltipEnemyTeamLabel = "Time inimigo",
    tooltipDamage = " dano",
    tooltipHealing = " cura",
    tooltipBracket = "Suporte",
    tooltipMapAndMatch = "Mapear e combinar dados|r",
    mapStatsFull = "\nCome??ar: \nTerminado: \nDura????o:\nRaz??o de ganho-perda: |r",
    mapStatsSmall = "\nTerminado: \nRaz??o de ganho-perda: |r",
    tooltipTalents = "Talentos|r",
    tooltipTrinkets = "Suas bugigangas|r",
    tooltipIlevel = " n??vel de item|r",
    levelPrefix = "N??vel ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Resumo de todos os jogos disputados em 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Resumo de todos os jogos disputados no 3v3.\n\n|r",
    skirmishHeader = "Escaramu??a",
    skirmishSummary = "Resumo de todos os jogos disputados no Skirmish.\n\n|r",
    seasonHeader = "Alta temporada",
    seasonSummary = "A alta da temporada ?? obtida da classifica????o mais alta \natingido durante a temporada em 2v2 ou 3v3.\n\n|r",
    seasonInfo = "Informa????o de temporada",
    seasonFunReminder = "Bem-vindo ?? temporada, n??o se esque??a de se divertir!\n\n|r",

    prefixTitle = "T??tulo: ",
    prefixHighest = "Alt??ssima: ",
    prefixPlayed = "Reproduziu: ",
    prefixWon = "Ganhou: ",
    prefixLost = "Perdido: ",
    prefixRating = "Avalia????o: ",
    tooltipNameLabel = "Nome: ",
    tooltipNumberLabel = "N??mero: ",
    tooltipExpansionLabel = "Expans??o: ",
    tooltipHighestTitle = "T??tulo mais alto: ",
    tooltipSeasonHighest = "Alta temporada: ",
    tooltipWeeklyHighest = "Alta semanal: ",

    prefixCurrent = "Atual|r",
    prefixSeason = "Esta????o|r",
    prefixWeek = "Esta semana|r",
};

--
-- French
--
frenchTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Cette session" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "Aucun jeu enregistr??" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Haute saison" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Escarmouche" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Saison" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsFrench = {
    -- Season names
    seasonUpgrade = "Hors saison",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiateur",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "Je n'ai pas encore re??u de mise ?? jour du classement.. veuillez patienter une seconde.",
    errorCorruptionGame = "Composition de l'??quipe corrompue, donc Rated n'a pas sauv?? la partie. (Fais-tu du 2v3/1v2/etc???)",
    errorCorruptData = "Soit ce jeu a ??t?? enregistr?? avec une ancienne version, soit les donn??es ont ??t?? corrompues :(|r",

    -- Minimap related
    welcomeTooltipText = "Content de te revoir ",
    headerOneWin = "1 gagner",
    headerOneLoss = "1 perte",
    headerWins = " gagne",
    headerLosses = " pertes",
    winGameLabel = "Gagner",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Ce jeu a ??t?? termin?? et enregistr?? ?? ",
    tooltipFinishedDateInterval = " au ",
    tooltipUnratedName = "Honneur",
    tooltipYourTeamLabel = "Ton ??quipe",
    tooltipEnemyTeamLabel = "??quipe ennemie",
    tooltipDamage = " endommager",
    tooltipHealing = " gu??rison",
    tooltipBracket = "Support",
    tooltipMapAndMatch = "Cartographier et faire correspondre les donn??es|r",
    mapStatsFull = "\nD??marrer: \nTermin??: \nDur??e:\nRatio gagnant-perte: |r",
    mapStatsSmall = "\nTermin??: \nRatio gagnant-perte: |r",
    tooltipTalents = "Talents|r",
    tooltipTrinkets = "Vos trinkets|r",
    tooltipIlevel = " niveau de l'article|r",
    levelPrefix = "Niveau ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "R??sum?? de toutes les parties jou??es en 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "R??sum?? de toutes les parties jou??es en 3v3.\n\n|r",
    skirmishHeader = "Escarmouche",
    skirmishSummary = "R??sum?? de tous les jeux jou??s dans Skirmish.\n\n|r",
    seasonHeader = "Haute saison",
    seasonSummary = "Le sommet de la saison est obtenu ?? partir de la note la plus ??lev??e \natteinte au cours de la saison en 2v2 ou 3v3.\n\n|r",
    seasonInfo = "Informations sur la saison",
    seasonFunReminder = "Bienvenue ?? la saison, n'oubliez pas de vous amuser!\n\n|r",

    prefixTitle = "Titre: ",
    prefixHighest = "Plus haut: ",
    prefixPlayed = "Jou??: ",
    prefixWon = "Gagn??: ",
    prefixLost = "Perdu: ",
    prefixRating = "Notation: ",
    tooltipNameLabel = "Nom: ",
    tooltipNumberLabel = "Nombre: ",
    tooltipExpansionLabel = "Expansion: ",
    tooltipHighestTitle = "Titre le plus ??lev??: ",
    tooltipSeasonHighest = "Haute saison: ",
    tooltipWeeklyHighest = "Haut hebdomadaire: ",

    prefixCurrent = "Actuel|r",
    prefixSeason = "Saison|r",
    prefixWeek = "Cette semaine|r",
};

--
-- Italian
--
italianTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Questa sessione" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "COR" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "Nessun gioco registrato" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Alta stagione" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Schermaglia" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Stagione" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsItalian = {
    -- Season names
    seasonUpgrade = "Fuori stagione",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",
    seasonThirtyTwo = "Cosmic",
    seasonThirtyThree = "Eternal",

    -- Titles for PVP rating
    titles = {
        Unranked = "Unranked",
        Gladiator = "Gladiator",
        Duelist = "Duelist",
        Rival = "Rival",
        Challenger = "Challenger",
        Combatant = "Combatant"
    },

    -- Titles for expansions
    expansions = {
        bc = "Burning crusade",
        wotlk = "Wrath of the lich king",
        cata = "Cataclysm",
        mists = "Mists of pandaria",
        legion = "Legion",
        bfa = "Battle for azeroth",
        sl = "Shadowlands",
        unknown = "Unknown"
    },

    -- Error no rated update yet
    errorRatedUpdate = "Non ho ancora ricevuto un aggiornamento della classifica.. attendi un secondo.",
    errorCorruptionGame = "Composizione della squadra corrotta, quindi Valutato non ha salvato il gioco. (Stavi facendo 2v3/1v2/ecc?)",
    errorCorruptData = "O questo gioco ?? stato registrato con una vecchia versione o i dati sono stati danneggiati :(|r",

    -- Minimap related
    welcomeTooltipText = "Ben tornato ",
    headerOneWin = "1 vincere",
    headerOneLoss = "1 perdita",
    headerWins = " vince",
    headerLosses = " perdite",
    winGameLabel = "Vincere",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Questo gioco ?? stato terminato e registrato su ",
    tooltipFinishedDateInterval = " sopra ",
    tooltipUnratedName = "Onore",
    tooltipYourTeamLabel = "La tua squadra",
    tooltipEnemyTeamLabel = "Squadra nemica",
    tooltipDamage = " danno",
    tooltipHealing = " guarigione",
    tooltipBracket = "Staffa",
    tooltipMapAndMatch = "Mappa e dati delle partite|r",
    mapStatsFull = "\nInizio: \nConclusa: \nDurata:\nRapporto vittorie-sconfitte: |r",
    mapStatsSmall = "\nConclusa: \nRapporto vittorie-sconfitte: |r",
    tooltipTalents = "Talenti|r",
    tooltipTrinkets = "I tuoi ninnoli|r",
    tooltipIlevel = " livello oggetto|r",
    levelPrefix = "Livello ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Riepilogo di tutte le partite giocate in 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Riepilogo di tutte le partite giocate in 3v3.\n\n|r",
    skirmishHeader = "Schermaglia",
    skirmishSummary = "Riepilogo di tutte le partite giocate a Skirmish.\n\n|r",
    seasonHeader = "Alta stagione",
    seasonSummary = "Il massimo della stagione viene ricavato dal punteggio pi?? alto \nottenuto durante la stagione in 2v2 o 3v3.\n\n|r",
    seasonInfo = "Informazioni sulla stagione",
    seasonFunReminder = "Benvenuto alla stagione, non dimenticare di divertirti!\n\n|r",

    prefixTitle = "Titolo: ",
    prefixHighest = "Pi?? alta: ",
    prefixPlayed = "Giocato: ",
    prefixWon = "Ha vinto: ",
    prefixLost = "Perso: ",
    prefixRating = "Valutazione: ",
    tooltipNameLabel = "Nome: ",
    tooltipNumberLabel = "Numero: ",
    tooltipExpansionLabel = "Espansione: ",
    tooltipHighestTitle = "Titolo pi?? alto: ",
    tooltipSeasonHighest = "Alta stagione: ",
    tooltipWeeklyHighest = "Alta settimanale: ",

    prefixCurrent = "Attuale|r",
    prefixSeason = "Stagione|r",
    prefixWeek = "Questa settimana|r",
};