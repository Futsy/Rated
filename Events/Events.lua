addonInitialized = false;
function AddonLoaded(instance)
    if not addonInitialized then        
        -- Register the PVP event and request the info
        instance:RegisterEvent("PVP_RATED_STATS_UPDATE");
        RequestRatedInfo();
        
        -- set the correct local values
        local locale = GetLocale();
        if locale == "frFR" then
            texts = frenchTexts;
            textInserts = textInsertsFrench;
        elseif locale == "deDE" then
            texts = germanTexts;
            textInserts = textInsertsGerman;
        elseif locale == "itIT" then
            texts = italianTexts;
            textInserts = textInsertsItalian;
        elseif locale == "koKR" then
            texts = koreanTexts;
            textInserts = textInsertsKorean;
        elseif locale == "zhCN" then
            texts = chineseChinaTexts;
            textInserts = textInsertsChineseChina;
        elseif locale == "zhTW" then
            texts = chineseTaiwanTexts;
            textInserts = textInsertsChineseTaiwan;
        elseif locale == "ruRU" then
            texts = russianTexts;
            textInserts = textInsertsRussian;
        elseif locale == "esES" then
            texts = spanishTexts;
            textInserts = textInsertsSpanish;
        elseif locale == "esMX" then
            texts = spanishTexts;
            textInserts = textInsertsSpanish;
        elseif locale == "ptBR" then
            texts = portugueseTexts;
            textInserts = textInsertsPortuguese;
        else
        end

        if data.minimized == nil then
            -- Determines in what state the window is
            data.minimized = true;
            data.width = 800;
            data.height = 600;
        end
        addonInitialized = true;
    end
end

function PVPMatchCompleted()
    if not arenaGreeting then
        DEFAULT_CHAT_FRAME:AddMessage(textInserts.errorCorruptionGame);
        return;
    end
    if IsRankedMatch() or IsSkirmish() then
        arenaGreeting = false;

        SetBattlefieldScoreFaction(-1);

        -- Get general information about this game
        local gameRated = IsRankedMatch();
        local gameSkirmish = IsSkirmish();
        local gameMap = select(8, GetInstanceInfo());
        local gameWinner = GetBattlefieldWinner();
        local gamePlayerSide = GetBattlefieldArenaFaction();
        local gameIsArena = IsActiveBattlefieldArena();
        local gameSeason = GetCurrentArenaSeason();
        local gamePlayersNum = GetNumBattlefieldScores();
        local gameTimeStamp = GetServerTime();

        local gamePlayerTeam = {};
        local gameEnemyTeam = {};
        for i=1, gamePlayersNum do
            local scoreName, scoreKillingBlows, scoreHonorableKills, scoreDeaths, scoreHonorGained, scoreFaction, scoreRace, 
                scoreClass, scoreClassToken, scoreDamageDone, scoreHealingDone, scoreBgRating, scoreRatingChange, 
                scorePreMatchMMR, scoreMmrChange, scoreTalentSpec = GetBattlefieldScore(i);
            
            if scoreFaction == gamePlayerSide then
                tinsert(gamePlayerTeam, {
                    name = scoreName,
                    killingBlows = scoreKillingBlows,
                    deaths = scoreDeaths,
                    faction = scoreFaction,
                    race = scoreRace,
                    class = scoreClass,
                    classToken = scoreClassToken,
                    damageDone = scoreDamageDone,
                    healingDone = scoreHealingDone,
                    ratingChange = scoreRatingChange,
                    mmrChange = scoreMmrChange,
                    talentSpec = scoreTalentSpec
                });
            else
                tinsert(gameEnemyTeam, {
                    name = scoreName,
                    killingBlows = scoreKillingBlows,
                    deaths = scoreDeaths,
                    faction = scoreFaction,
                    race = scoreRace,
                    class = scoreClass,
                    classToken = scoreClassToken,
                    damageDone = scoreDamageDone,
                    healingDone = scoreHealingDone,
                    ratingChange = scoreRatingChange,
                    mmrChange = scoreMmrChange,
                    talentSpec = scoreTalentSpec
                });
            end
        end

        -- Grab all the talent data we can get
        local playerTalents = GetPlayerTalents();
        local playerPvpTalents = GetPlayerPvpTalents();

        -- Grab the trinkets that were used
        local trinketOne = {};
        local trinketTwo = {};

        local itemLinkFirst = GetInventoryItemLink("player", 13);
        local itemLinkSecond = GetInventoryItemLink("player", 14);

        if itemLinkFirst ~= nil and itemLinkSecond ~= nil then
            local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemLinkFirst);
            local itemNamet, itemLinkt, itemQualityt, itemLevelt, itemMinLevelt, itemTypet, itemSubTypet, itemStackCountt, itemEquipLoct, itemTexturet = GetItemInfo(itemLinkSecond);

            if itemName ~= nil and itemTexture ~= nil and itemLevel ~= nil then
                tinsert(trinketOne, {
                    name = itemName,
                    texture = itemTexture,
                    iLevel = itemLevel
                });
            end
            
            if itemNamet ~= nil and itemTexturet ~= nil and itemLevelt ~= nil then
                tinsert(trinketTwo, {
                    name = itemNamet,
                    texture = itemTexturet,
                    iLevel = itemLevelt
                });
            end
        end

        -- Get information for the player personally
        local cr, seasonBest, weeklyBest, seasonPlayed, seasonWon, weeklyPlayed, weeklyWon, cap = GetPersonalRatedInfo(1);
        local tcr, tseasonBest, tweeklyBest, tseasonPlayed, tseasonWon, tweeklyPlayed, tweeklyWon, tcap = GetPersonalRatedInfo(2);
        
        local gameEntry = {
            playerTeam = gamePlayerTeam,
            enemyTeam = gameEnemyTeam,
            rated = gameRated,
            skirmish = gameSkirmish,
            map = gameMap,
            winner = gameWinner,
            playerSide = gamePlayerSide,
            isArena = gameIsArena,
            season = gameSeason,
            playersNum = gamePlayersNum,
            startStamp = startTime,
            timeStamp = gameTimeStamp,
            postCR = cr,
            postTwosSeasonBest = seasonBest,
            postTwosWeeklyBest = weeklyBest,
            postTwosSeasonPlayed = seasonPlayed,
            postTwosSeasonWon = seasonWon,
            postTwosWeeklyPlayed = weeklyPlayed,
            postTwosWeeklyWon = weeklyWon,
            postTwosCap = cap,
            postTwosBracket = ResolveTitle(cr),
            postThreesCR = tcr,
            postThreesSeasonBest = tseasonBest,
            postThreesWeeklyBest = tweeklyBest,
            postThreesSeasonPlayed = tseasonPlayed,
            postThreesSeasonWon = tseasonWon,
            postThreesWeeklyPlayed = tweeklyPlayed,
            postThreesWeeklyWon = tweeklyWon,
            postThreesCap = tcap,
            postThreesBracket = ResolveTitle(tcr),
            playerPersonalTalents = playerTalents,
            playerPersonalPvpTalents = playerPvpTalents,
            trinkOne = trinketOne,
            trinkTwo = trinketTwo
        };

        -- Get information about the teams
        if gameRated and not gameSkirmish then
            local teamNameZero, oldTeamRatingZero, newTeamRatingZero, teamRatingZero = GetBattlefieldTeamInfo(0);
            local teamNameOne, oldTeamRatingOne, newTeamRatingOne, teamRatingOne = GetBattlefieldTeamInfo(1);

            -- We need to have Team One resolve to the player and Zero to the enemy
            if gameEntry.playerSide == 1 then
                gameEntry.teamNameZero = teamNameZero;
                gameEntry.oldTeamRatingZero = oldTeamRatingZero;
                gameEntry.newTeamRatingZero = newTeamRatingZero;
                gameEntry.teamRatingZero = teamRatingZero; -- MMR
                gameEntry.teamNameOne = teamNameOne;
                gameEntry.oldTeamRatingOne = oldTeamRatingOne;
                gameEntry.newTeamRatingOne = newTeamRatingOne;
                gameEntry.teamRatingOne = teamRatingOne; -- MMR
            else
                gameEntry.teamNameZero = teamNameOne;
                gameEntry.oldTeamRatingZero = oldTeamRatingOne;
                gameEntry.newTeamRatingZero = newTeamRatingOne;
                gameEntry.teamRatingZero = teamRatingOne; -- MMR
                gameEntry.teamNameOne = teamNameZero;
                gameEntry.oldTeamRatingOne = oldTeamRatingZero;
                gameEntry.newTeamRatingOne = newTeamRatingZero;
                gameEntry.teamRatingOne = teamRatingZero; -- MMR
            end
        end

        if #gameEntry.playerTeam == 0 or #gameEntry.enemyTeam == 0 then
            DEFAULT_CHAT_FRAME:AddMessage(textInserts.errorCorruptionGame);
            return;
        end

        tinsert(data, gameEntry);
        -- If the UI hasn't booted yet it doesnt matter it will add through data
        if callbacks.mainWindow ~= nil then
            AddGamesToScrollArea(gameEntry);
        end
    end
end

function SkirmishStatsUpdated()
    local skirmishRating, skirmishSeasonPlayed, skirmishSeasonWon, skirmishWeeklyPlayed, skirmishWeeklyWon = GetInspectArenaData(5);

    if skirmishRating == nil 
        or skirmishRating == nil 
        or skirmishSeasonWon == nil 
        or skirmishWeeklyPlayed == nil 
        or skirmishWeeklyWon == nil then
        return;
    end

    data.skirmishRating = skirmishRating;
    data.skirmishSeasonPlayed = skirmishSeasonPlayed;
    data.skirmishSeasonWon = skirmishSeasonWon;
    data.skirmishWeeklyPlayed = skirmishWeeklyPlayed;
    data.skirmishWeeklyWon = skirmishWeeklyWon;
    data.skirmishishBracket = ResolveTitle(skirmishRating);

    skirmishInfoGatheredAtleastOnce = true;
    SkirmishStatsUpdatedInterface();
end

function SkirmishStatsUpdatedInterface()
    if callbacks.mainWindow ~= nil and callbacks.skirmishCurrentText ~= nil then
        callbacks.skirmishCurrentText:SetText(data.skirmishRating);
    end
end

function RatedStatsUpdated()
    local twos = 1;
    local threes = 2;
    local twosRating, twosSeasonBest, twosWeeklyBest, twosSeasonPlayed, twosSeasonWon, twosWeeklyPlayed, twosWeeklyWon, twosCap = GetPersonalRatedInfo(twos);
    local threesRating, threesSeasonBest, threesWeeklyBest, threesSeasonPlayed, threesSeasonWon, threesWeeklyPlayed, threesWeeklyWon, threesCap = GetPersonalRatedInfo(threes);

    -- Write all the 2v2 info
    data.twoVTwoRating = twosRating;
    data.twoVTwoSeasonBest = twosSeasonBest;
    data.twoVTwoWeeklyBest = twosWeeklyBest;
    data.twoVTwoSeasonPlayed = twosSeasonPlayed;
    data.twoVTwoSeasonWon = twosSeasonWon;
    data.twoVTwoWeeklyPlayed = twosWeeklyPlayed;
    data.twoVTwoWeeklyWon = twosWeeklyWon;
    data.twoVTwoCap = twosCap;
    data.twoVTwoBracket = ResolveTitle(twosRating);
    data.twoVTwoHighestBracket = ResolveTitle(twosSeasonBest);

    -- Write all the 3v3 info
    data.threeVThreeRating = threesRating;
    data.threeVThreeSeasonBest = threesSeasonBest;
    data.threeVThreeWeeklyBest = threesWeeklyBest;
    data.threeVThreeSeasonPlayed = threesSeasonPlayed;
    data.threeVThreeSeasonWon = threesSeasonWon;
    data.threeVThreeWeeklyPlayed = threesWeeklyPlayed;
    data.threeVThreeWeeklyWon = threesWeeklyWon;
    data.threeVThreeCap = threesCap;
    data.threeVThreeBracket = ResolveTitle(threesRating);
    data.threeVThreeHighestBracket = ResolveTitle(threesSeasonBest);

    -- Register the mini map icon for the addon
    CreateMinimapIcon(ResolveSmallTexture(HighestSeasonRank()));
    ratedInfoGatheredAtleastOnce = true;

    -- Update the interface
    RatedStatsUpdatedInterface();
end

function RatedStatsUpdatedInterface()
    if callbacks.mainWindow ~= nil then
        callbacks.seasonHighestText:SetText(ResolveTitle(HighestSeasonRank()));
        callbacks.twosCurrentText:SetText(data.twoVTwoRating);
        callbacks.threesCurrentText:SetText(data.threeVThreeRating);
    end
end

function GetPlayerTalents()
    local playerTalents = {};
    -- grid is 7rows x 3cols
    for i=1, 7 do
        for j=1, 3 do
            local talentID, name, texture, selected, available, spellID, unknown, row, column, known, grantedByAura = GetTalentInfo(i, j, GetActiveSpecGroup());
            if selected then
                tinsert(playerTalents, {
                    talentName = name,
                    talentTexture = texture
                });
            end
        end
    end
    return playerTalents;
end

function GetPlayerPvpTalents()
    local playerPvpTalents = {};
    local selectedPvpTalentIDs = C_SpecializationInfo.GetAllSelectedPvpTalentIDs();
    for k, v in ipairs(selectedPvpTalentIDs) do
        talentID, name, texture, selected, available, spellID, unlocked, row, column, known, grantedByAura = GetPvpTalentInfoByID(v, GetActiveSpecGroup());
        if selected then
            tinsert(playerPvpTalents, {
                talentName = name,
                talentTexture = texture
            });
        end
    end
    return playerPvpTalents;
end