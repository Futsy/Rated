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
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Scharmützel" },
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
    errorCorruptData = "Entweder wurde dieses Spiel mit einer alten Version aufgenommen oder die Daten wurden beschädigt :(|r",

    -- Minimap related
    welcomeTooltipText = "Willkommen zurück ",
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
    tooltipDamage = " beschädigung",
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
    skirmishHeader = "Scharmützel",
    skirmishSummary = "Zusammenfassung aller in Scharmützel gespielten Spiele.\n\n|r",
    seasonHeader = "Saison hoch",
    seasonSummary = "Das Saisonhoch wird aus der höchsten Wertung ermittelt, die während der Saison in 2v2 oder 3v3 erreicht wurde.\n\n|r",
    seasonInfo = "Saisoninformationen",
    seasonFunReminder = "Willkommen in der Saison, vergessen Sie nicht, Spaß zu haben!\n\n|r",

    prefixTitle = "Titel: ",
    prefixHighest = "Höchste: ",
    prefixPlayed = "Gespielt: ",
    prefixWon = "Won: ",
    prefixLost = "Lost: ",
    prefixRating = "Bewertung: ",
    tooltipNameLabel = "Name: ",
    tooltipNumberLabel = "Nummer: ",
    tooltipExpansionLabel = "Erweiterung: ",
    tooltipHighestTitle = "Höchste titel: ",
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
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "이 세션" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "부정한" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "등록 된 게임이 없습니다." },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "시즌 최고" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "작은 접전" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "시즌" },
    seasonName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsKorean = {
    -- Season names
    seasonUpgrade = "비수기",
    seasonThirty = "죄 많은",
    seasonThirtyOne = "체인되지 않음",

    -- Titles for PVP rating
    titles = {
        Unranked = "순위 없음",
        Gladiator = "검투사",
        Duelist = "듀얼리스트",
        Rival = "경쟁자",
        Challenger = "도전자",
        Combatant = "전투원"
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
    errorRatedUpdate = "아직 순위 업데이트를받지 못했습니다 .. 잠시만 기다려주세요.",
    errorCorruptionGame = "팀 구성이 손상되어 Rated가 게임을 저장하지 않았습니다. (2v3 / 1v2 / 등을하고 있었나요?)",
    errorCorruptData = "이 게임은 이전 버전으로 녹화되었거나 데이터가 손상되었습니다. :(|r",

    -- Minimap related
    welcomeTooltipText = "다시 오신 것을 환영합니다 ",
    headerOneWin = "1 승리",
    headerOneLoss = "1 손실",
    headerWins = " 승리",
    headerLosses = " 사상자 수",
    winGameLabel = "승리",

    -- Tooltip info game entry
    tooltipFinishedLabel = "이 게임은 종료되고 녹화되었습니다 ",
    tooltipFinishedDateInterval = " 의 위에 ",
    tooltipUnratedName = "명예",
    tooltipYourTeamLabel = "당신의 팀",
    tooltipEnemyTeamLabel = "적 팀",
    tooltipDamage = " 피해를 주다",
    tooltipHealing = " 치유",
    tooltipBracket = "까치발",
    tooltipMapAndMatch = "데이터 매핑 및 일치|r",
    mapStatsFull = "\n스타트: \n종료: \n지속:\n승패 율: |r",
    mapStatsSmall = "\n종료: \n승패 율: |r",
    tooltipTalents = "재능|r",
    tooltipTrinkets = "당신의 장신구|r",
    tooltipIlevel = " 아이템 레벨|r",
    levelPrefix = "수평 ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "2v2에서 플레이 한 모든 게임 요약.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "3v3에서 플레이 한 모든 게임 요약.\n\n|r",
    skirmishHeader = "작은 접전",
    skirmishSummary = "스커미시에서 플레이한 모든 게임 요약.\n\n|r",
    seasonHeader = "시즌 최고",
    seasonSummary = "시즌 최고는 2v2 또는 3v3 시즌 동안\n 획득 한 최고 평점에서 수집됩니다.\n\n|r",
    seasonInfo = "시즌 정보",
    seasonFunReminder = "시즌에 오신 것을 환영합니다. 즐거운 시간을 보내는 것을 잊지 마세요!\n\n|r",

    prefixTitle = "표제: ",
    prefixHighest = "제일 높은: ",
    prefixPlayed = "플레이: ",
    prefixWon = "이겼다: ",
    prefixLost = "잃어버린: ",
    prefixRating = "평가: ",
    tooltipNameLabel = "이름: ",
    tooltipNumberLabel = "번호: ",
    tooltipExpansionLabel = "확장: ",
    tooltipHighestTitle = "최고 타이틀: ",
    tooltipSeasonHighest = "시즌 최고: ",
    tooltipWeeklyHighest = "주간 최고: ",

    prefixCurrent = "흐름|r",
    prefixSeason = "시즌|r",
    prefixWeek = "이번 주|r",
};

--
-- Chinese (simplified)
--
chineseChinaTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "本期" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "腐败" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "没有注册游戏" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "赛季新高" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "小規模衝突" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "季节" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsChineseChina = {
    -- Season names
    seasonUpgrade = "淡季",
    seasonThirty = "有罪的",
    seasonThirtyOne = "解开的",

    -- Titles for PVP rating
    titles = {
        Unranked = "未排名",
        Gladiator = "角斗士",
        Duelist = "决斗者",
        Rival = "竞争对手",
        Challenger = "挑战者",
        Combatant = "战斗员"
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
    errorRatedUpdate = "还没有收到排名更新..请稍等。",
    errorCorruptionGame = "腐败的团队组成，所以 Rated 没有挽救比赛。 （你在做 2v3/1v2/etc 吗？）",
    errorCorruptData = "要么这个游戏是用旧版本录制的，要么数据损坏了 :(|r",

    -- Minimap related
    welcomeTooltipText = "欢迎回来 ",
    headerOneWin = "1 赢",
    headerOneLoss = "1 失利",
    headerWins = " 胜利",
    headerLosses = " 损失",
    winGameLabel = "赢",

    -- Tooltip info game entry
    tooltipFinishedLabel = "这场比赛结束并记录在 ",
    tooltipFinishedDateInterval = " 上 ",
    tooltipUnratedName = "荣誉",
    tooltipYourTeamLabel = "你的团队",
    tooltipEnemyTeamLabel = "敌队",
    tooltipDamage = " 损害",
    tooltipHealing = " 康复",
    tooltipBracket = "括号",
    tooltipMapAndMatch = "映射和匹配数据|r",
    mapStatsFull = "\n开始: \n结束: \n期间:\n盈亏比: |r",
    mapStatsSmall = "\n结束: \n盈亏比: |r",
    tooltipTalents = "人才|r",
    tooltipTrinkets = "你的小饰品|r",
    tooltipIlevel = " 物品等级|r",
    levelPrefix = "等级 ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "在 2v2 中玩的所有游戏的摘要。\n\n|r",
    threesHeader = "3v3",
    threesSummary = "在 3v3 中玩的所有游戏的摘要。\n\n|r",
    skirmishHeader = "小規模衝突",
    skirmishSummary = "小衝突中所有遊戲的總結.\n\n|r",
    seasonHeader = "旺季",
    seasonSummary = "季高是从最高评分中收集的 \n在赛季中以 2v2 或 3v3 获得。\n\n|r",
    seasonInfo = "季节信息",
    seasonFunReminder = "欢迎来到这个季节，不要忘记玩得开心！\n\n|r",

    prefixTitle = "标题: ",
    prefixHighest = "最高: ",
    prefixPlayed = "玩过: ",
    prefixWon = "韩元: ",
    prefixLost = "丢失的: ",
    prefixRating = "评分: ",
    tooltipNameLabel = "名称: ",
    tooltipNumberLabel = "数字: ",
    tooltipExpansionLabel = "扩充: ",
    tooltipHighestTitle = "最高头衔: ",
    tooltipSeasonHighest = "旺季: ",
    tooltipWeeklyHighest = "周高: ",

    prefixCurrent = "当前的|r",
    prefixSeason = "季节|r",
    prefixWeek = "本星期|r",
};

--
-- Chinese (taiwan)
--
chineseTaiwanTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "本期" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "腐败" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -119, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "没有注册游戏" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "赛季新高" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2v2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3v3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "小規模衝突" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "季节" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsChineseTaiwan = {
    -- Season names
    seasonUpgrade = "淡季",
    seasonThirty = "有罪的",
    seasonThirtyOne = "解开的",

    -- Titles for PVP rating
    titles = {
        Unranked = "未排名",
        Gladiator = "角斗士",
        Duelist = "决斗者",
        Rival = "竞争对手",
        Challenger = "挑战者",
        Combatant = "战斗员"
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
    errorRatedUpdate = "还没有收到排名更新..请稍等。",
    errorCorruptionGame = "腐败的团队组成，所以 Rated 没有挽救比赛。 （你在做 2v3/1v2/etc 吗？）",
    errorCorruptData = "要么这个游戏是用旧版本录制的，要么数据损坏了 :(|r",

    -- Minimap related
    welcomeTooltipText = "欢迎回来 ",
    headerOneWin = "1 赢",
    headerOneLoss = "1 失利",
    headerWins = " 胜利",
    headerLosses = " 损失",
    winGameLabel = "赢",

    -- Tooltip info game entry
    tooltipFinishedLabel = "这场比赛结束并记录在 ",
    tooltipFinishedDateInterval = " 上 ",
    tooltipUnratedName = "荣誉",
    tooltipYourTeamLabel = "你的团队",
    tooltipEnemyTeamLabel = "敌队",
    tooltipDamage = " 损害",
    tooltipHealing = " 康复",
    tooltipBracket = "括号",
    tooltipMapAndMatch = "映射和匹配数据|r",
    mapStatsFull = "\n开始: \n结束: \n期间:\n盈亏比: |r",
    mapStatsSmall = "\n结束: \n盈亏比: |r",
    tooltipTalents = "人才|r",
    tooltipTrinkets = "你的小饰品|r",
    tooltipIlevel = " 物品等级|r",
    levelPrefix = "等级 ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "在 2v2 中玩的所有游戏的摘要。\n\n|r",
    threesHeader = "3v3",
    threesSummary = "在 3v3 中玩的所有游戏的摘要。\n\n|r",
    skirmishHeader = "小規模衝突",
    skirmishSummary = "小衝突中所有遊戲的總結.\n\n|r",
    seasonHeader = "旺季",
    seasonSummary = "季高是从最高评分中收集的 \n在赛季中以 2v2 或 3v3 获得。\n\n|r",
    seasonInfo = "季节信息",
    seasonFunReminder = "欢迎来到这个季节，不要忘记玩得开心！\n\n|r",

    prefixTitle = "标题: ",
    prefixHighest = "最高: ",
    prefixPlayed = "玩过: ",
    prefixWon = "韩元: ",
    prefixLost = "丢失的: ",
    prefixRating = "评分: ",
    tooltipNameLabel = "名称: ",
    tooltipNumberLabel = "数字: ",
    tooltipExpansionLabel = "扩充: ",
    tooltipHighestTitle = "最高头衔: ",
    tooltipSeasonHighest = "旺季: ",
    tooltipWeeklyHighest = "周高: ",

    prefixCurrent = "当前的|r",
    prefixSeason = "季节|r",
    prefixWeek = "本星期|r",
};

--
-- Russian
--
russianTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Текущая сессия" },
    formatText = { fonts.FriendsFont, colors.white, nil, 40, -13, "Испорченная игра" },
    newRatingLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -124, -13, "" },
    timestampLabel = { fonts.FriendsFont, colors.white, "TOPRIGHT", -36, -13, "" },
    vsTextEntry = { fonts.FriendsFont, colors.white, nil, 178, -13, "VS" },
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "Нет зарегистрированных игр" },
    playerClassSpec = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, -5, "" },
    playerName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 13, "" },
    highestHeaderLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Наивысший в сезоне" },
    seasonHighLabel = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    twosHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "2на2" },
    twosHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    threesHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "3на3" },
    threesHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Стычка" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Сезон" },
    seasonName = { fonts.fancyFontRegular, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsRussian = {
    -- Season names
    seasonUpgrade = "Межсезонье",
    seasonThirty = "Греховный",
    seasonThirtyOne = "Освобожденный",

    -- Titles for PVP rating
    titles = {
        Unranked = "Без рейтинга",
        Gladiator = "Гладиатор",
        Duelist = "Дуэлянт",
        Rival = "Фаворит",
        Challenger = "Претендент",
        Combatant = "Боец"
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
    errorRatedUpdate = "Еще не получено обновление рейтинга ... подождите секунду.",
    errorCorruptionGame = "Испорченный состав команды, поэтому Rated не зафиксировал игру. (Вы играли 2 на 3/1 на 2 и т. Д.?)",
    errorCorruptData = "Либо эта игра была записана в старой версии, либо данные были повреждены :(|r",

    -- Minimap related
    welcomeTooltipText = "Добро пожаловать обратно ",
    headerOneWin = "1 победа",
    headerOneLoss = "1 поражение",
    headerWins = " побед",
    headerLosses = " поражений",
    winGameLabel = "Победа",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Эта игра завершилась и была записана в ",
    tooltipFinishedDateInterval = " | ",
    tooltipUnratedName = "Честь",
    tooltipYourTeamLabel = "Ваша команда",
    tooltipEnemyTeamLabel = "Команда противника",
    tooltipDamage = " урон",
    tooltipHealing = " исцеление",
    tooltipBracket = "брекет",
    tooltipMapAndMatch = "Данные карты и матча|r",
    mapStatsFull = "\nНачало: \nКонец: \nПродолжительность:\nСоотношение побед и поражений: |r",
    mapStatsSmall = "\nЗакончено: \nСоотношение выигрышей и проигрышей: |r",
    tooltipTalents = "Таланты|r",
    tooltipTrinkets = "Ваши аксессуары|r",
    tooltipIlevel = " уровень предмета|r",
    levelPrefix = "Уровень ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Сводка всех игр, сыгранных в режиме 2 на 2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Сводка всех игр, сыгранных в режиме 3 на 3.\n\n|r",
    skirmishHeader = "Стычки",
    skirmishSummary = "Сводка всех игр, сыгранных в режиме стычек.\n\n|r",
    seasonHeader = "Максимум сезона",
    seasonSummary = "Максимум сезона определяется на основе наивысшего рейтинга, \nдостигнутого в течение сезона в режимах 2 на 2 или 3 на 3.\n\n|r",
    seasonInfo = "Информация о сезоне",
    seasonFunReminder = "Добро пожаловать в сезон, не забывайте веселиться!\n\n|r",

    prefixTitle = "Звание: ",
    prefixHighest = "Наивысший: ",
    prefixPlayed = "Сыграно: ",
    prefixWon = "Победы: ",
    prefixLost = "Поражения: ",
    prefixRating = "Рейтинг: ",
    tooltipNameLabel = "Название: ",
    tooltipNumberLabel = "Число: ",
    tooltipExpansionLabel = "Дополнение: ",
    tooltipHighestTitle = "Наивысшее звание: ",
    tooltipSeasonHighest = "Максимум сезона: ",
    tooltipWeeklyHighest = "Еженедельный максимум: ",

    prefixCurrent = "Текущий|r",
    prefixSeason = "За сезон|r",
    prefixWeek = "На этой неделе|r",
};

--
-- Spanish
--
spanishTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Esta sesión" },
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
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Estación" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsSpanish = {
    -- Season names
    seasonUpgrade = "Fuera de temporada",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",

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
    errorRatedUpdate = "Aún no recibí una actualización de clasificación. Espera un segundo.",
    errorCorruptionGame = "Composición del equipo corrupta, por lo que Rated no salvó el juego. (¿Estabas haciendo 2v3 / 1v2 / etc?)",
    errorCorruptData = "O este juego se grabó con una versión anterior o los datos se corrompieron :(|r",

    -- Minimap related
    welcomeTooltipText = "Bienvenido de nuevo ",
    headerOneWin = "1 ganar",
    headerOneLoss = "1 pérdida",
    headerWins = " gana",
    headerLosses = " pérdidas",
    winGameLabel = "Ganar",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Este juego fue terminado y grabado en ",
    tooltipFinishedDateInterval = " en ",
    tooltipUnratedName = "Honor",
    tooltipYourTeamLabel = "Tu equipo",
    tooltipEnemyTeamLabel = "Equipo enemigo",
    tooltipDamage = " daño",
    tooltipHealing = " cicatrización",
    tooltipBracket = "Soporte",
    tooltipMapAndMatch = "Datos de mapas y coincidencias|r",
    mapStatsFull = "\nComienzo: \nTerminado: \nDuración:\nRelación de pérdidas y ganancias: |r",
    mapStatsSmall = "\nTerminado: \nRelación de pérdidas y ganancias: |r",
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
    seasonSummary = "El máximo de la temporada se obtiene de la calificación más \nalta obtenida durante la temporada en 2v2 o 3v3.\n\n|r",
    seasonInfo = "Información de temporada",
    seasonFunReminder = "Bienvenido a la temporada, ¡no te olvides de divertirte!\n\n|r",

    prefixTitle = "Título: ",
    prefixHighest = "Mas alto: ",
    prefixPlayed = "Jugado: ",
    prefixWon = "Ganado: ",
    prefixLost = "Perdido: ",
    prefixRating = "Clasificación: ",
    tooltipNameLabel = "Nombre: ",
    tooltipNumberLabel = "Número: ",
    tooltipExpansionLabel = "Expansión: ",
    tooltipHighestTitle = "Título más alto: ",
    tooltipSeasonHighest = "Título más alto: ",
    tooltipWeeklyHighest = "Alto semanal: ",

    prefixCurrent = "Actual|r",
    prefixSeason = "Estación|r",
    prefixWeek = "Esta semana|r",
};

--
-- Portuguese
--
portugueseTexts = {
    dayText = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "" },
    sessionHeader = { fonts.SysFontShadowHuge, colors.white, "RIGHT", -21, -20, "Esta sesión" },
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
    skirmishHighestLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 18, "Escaramuça" },
    skirmishHighestDetail = { fonts.fancyFontSmall, colors.white, "CENTER", 0, 0, "" },
    addonHeader = { fonts.addonSpecial, colors.addonHeader, "CENTER", 0, 0, "Rated" },
    seasonLabel = { fonts.gameFontRegularShadow, colors.light, "CENTER", 0, 23, "Estación" },
    seasonName = { fonts.fancyFontBig, colors.white, "CENTER", 0, 0, "" },
    playerTitle = { fonts.gameFontRegularShadow, colors.grey, "CENTER", 0, 32, "" }
};
textInsertsPortuguese = {
    -- Season names
    seasonUpgrade = "Entressafra",
    seasonThirty = "Sinful",
    seasonThirtyOne = "Unchained",

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
    errorRatedUpdate = "Ainda não recebi uma atualização de classificação .. aguarde um segundo",
    errorCorruptionGame = "Composição da equipe corrompida, portanto, Rated não salvou o jogo. (Você estava fazendo 2v3 / 1v2 / etc?)",
    errorCorruptData = "Este jogo foi gravado com uma versão antiga ou os dados foram corrompidos :(|r",

    -- Minimap related
    welcomeTooltipText = "Bem vindo de volta ",
    headerOneWin = "1 vencer",
    headerOneLoss = "1 perda",
    headerWins = " vitórias",
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
    mapStatsFull = "\nComeçar: \nTerminado: \nDuração:\nRazão de ganho-perda: |r",
    mapStatsSmall = "\nTerminado: \nRazão de ganho-perda: |r",
    tooltipTalents = "Talentos|r",
    tooltipTrinkets = "Suas bugigangas|r",
    tooltipIlevel = " nível de item|r",
    levelPrefix = "Nível ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Resumo de todos os jogos disputados em 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Resumo de todos os jogos disputados no 3v3.\n\n|r",
    skirmishHeader = "Escaramuça",
    skirmishSummary = "Resumo de todos os jogos disputados no Skirmish.\n\n|r",
    seasonHeader = "Alta temporada",
    seasonSummary = "A alta da temporada é obtida da classificação mais alta \natingido durante a temporada em 2v2 ou 3v3.\n\n|r",
    seasonInfo = "Informação de temporada",
    seasonFunReminder = "Bem-vindo à temporada, não se esqueça de se divertir!\n\n|r",

    prefixTitle = "Título: ",
    prefixHighest = "Altíssima: ",
    prefixPlayed = "Reproduziu: ",
    prefixWon = "Ganhou: ",
    prefixLost = "Perdido: ",
    prefixRating = "Avaliação: ",
    tooltipNameLabel = "Nome: ",
    tooltipNumberLabel = "Número: ",
    tooltipExpansionLabel = "Expansão: ",
    tooltipHighestTitle = "Título mais alto: ",
    tooltipSeasonHighest = "Alta temporada: ",
    tooltipWeeklyHighest = "Alta semanal: ",

    prefixCurrent = "Atual|r",
    prefixSeason = "Estação|r",
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
    noGames = { fonts.gameFontVeryBig, colors.grey, "CENTER", 0, 0, "Aucun jeu enregistré" },
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
    errorRatedUpdate = "Je n'ai pas encore reçu de mise à jour du classement.. veuillez patienter une seconde.",
    errorCorruptionGame = "Composition de l'équipe corrompue, donc Rated n'a pas sauvé la partie. (Fais-tu du 2v3/1v2/etc ?)",
    errorCorruptData = "Soit ce jeu a été enregistré avec une ancienne version, soit les données ont été corrompues :(|r",

    -- Minimap related
    welcomeTooltipText = "Content de te revoir ",
    headerOneWin = "1 gagner",
    headerOneLoss = "1 perte",
    headerWins = " gagne",
    headerLosses = " pertes",
    winGameLabel = "Gagner",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Ce jeu a été terminé et enregistré à ",
    tooltipFinishedDateInterval = " au ",
    tooltipUnratedName = "Honneur",
    tooltipYourTeamLabel = "Ton équipe",
    tooltipEnemyTeamLabel = "Équipe ennemie",
    tooltipDamage = " endommager",
    tooltipHealing = " guérison",
    tooltipBracket = "Support",
    tooltipMapAndMatch = "Cartographier et faire correspondre les données|r",
    mapStatsFull = "\nDémarrer: \nTerminé: \nDurée:\nRatio gagnant-perte: |r",
    mapStatsSmall = "\nTerminé: \nRatio gagnant-perte: |r",
    tooltipTalents = "Talents|r",
    tooltipTrinkets = "Vos trinkets|r",
    tooltipIlevel = " niveau de l'article|r",
    levelPrefix = "Niveau ",

    -- Left side tooltips
    twosHeader = "2v2",
    twosSummary = "Résumé de toutes les parties jouées en 2v2.\n\n|r",
    threesHeader = "3v3",
    threesSummary = "Résumé de toutes les parties jouées en 3v3.\n\n|r",
    skirmishHeader = "Escarmouche",
    skirmishSummary = "Résumé de tous les jeux joués dans Skirmish.\n\n|r",
    seasonHeader = "Haute saison",
    seasonSummary = "Le sommet de la saison est obtenu à partir de la note la plus élevée \natteinte au cours de la saison en 2v2 ou 3v3.\n\n|r",
    seasonInfo = "Informations sur la saison",
    seasonFunReminder = "Bienvenue à la saison, n'oubliez pas de vous amuser!\n\n|r",

    prefixTitle = "Titre: ",
    prefixHighest = "Plus haut: ",
    prefixPlayed = "Joué: ",
    prefixWon = "Gagné: ",
    prefixLost = "Perdu: ",
    prefixRating = "Notation: ",
    tooltipNameLabel = "Nom: ",
    tooltipNumberLabel = "Nombre: ",
    tooltipExpansionLabel = "Expansion: ",
    tooltipHighestTitle = "Titre le plus élevé: ",
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
    errorCorruptData = "O questo gioco è stato registrato con una vecchia versione o i dati sono stati danneggiati :(|r",

    -- Minimap related
    welcomeTooltipText = "Ben tornato ",
    headerOneWin = "1 vincere",
    headerOneLoss = "1 perdita",
    headerWins = " vince",
    headerLosses = " perdite",
    winGameLabel = "Vincere",

    -- Tooltip info game entry
    tooltipFinishedLabel = "Questo gioco è stato terminato e registrato su ",
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
    seasonSummary = "Il massimo della stagione viene ricavato dal punteggio più alto \nottenuto durante la stagione in 2v2 o 3v3.\n\n|r",
    seasonInfo = "Informazioni sulla stagione",
    seasonFunReminder = "Benvenuto alla stagione, non dimenticare di divertirti!\n\n|r",

    prefixTitle = "Titolo: ",
    prefixHighest = "Più alta: ",
    prefixPlayed = "Giocato: ",
    prefixWon = "Ha vinto: ",
    prefixLost = "Perso: ",
    prefixRating = "Valutazione: ",
    tooltipNameLabel = "Nome: ",
    tooltipNumberLabel = "Numero: ",
    tooltipExpansionLabel = "Espansione: ",
    tooltipHighestTitle = "Titolo più alto: ",
    tooltipSeasonHighest = "Alta stagione: ",
    tooltipWeeklyHighest = "Alta settimanale: ",

    prefixCurrent = "Attuale|r",
    prefixSeason = "Stagione|r",
    prefixWeek = "Questa settimana|r",
};