function ExportData()
    StaticPopupDialogs["RATED_EXPORT"] = {
        text = "JSON Exported data",
        button1 = "Done",
        OnAccept = function() end,
        OnShow = function (self, data)
            self.editBox:SetText(GetDataAsJSON());
        end,
        hasEditBox = true,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
    StaticPopup_Show ("RATED_EXPORT");
end

function GetDataAsJSON()
    local res = "[";

    for k, v in ipairs(data) do
        res = res.."{";

        res = res..appendField(v, "postTwosWeeklyWon");
        res = res..appendField(v, "postThreesCR");
        res = res..appendField(v, "playerSide");
        res = res..appendField(v, "map");
        res = res..appendField(v, "postTwosSeasonPlayed");
        res = res..appendField(v, "winner");
        res = res..appendField(v, "postTwosWeeklyBest");
        res = res..appendField(v, "postThreesBracket", "string");
        res = res..appendField(v, "startStamp");
        res = res..appendField(v, "playersNum");
        res = res..appendField(v, "postCR");
        res = res..appendField(v, "season");
        res = res..appendField(v, "isArena", "bool");
        res = res..appendField(v, "rated", "bool");
        res = res..appendField(v, "postTwosCap");
        res = res..appendField(v, "postThreesCap");
        res = res..appendField(v, "postThreesWeeklyPlayed");
        res = res..appendField(v, "postThreesSeasonWon");
        res = res..appendField(v, "postTwosSeasonBest");
        res = res..appendField(v, "postTwosBracket", "string");
        res = res..appendField(v, "postTwosSeasonWon");
        res = res..appendField(v, "postTwosWeeklyPlayed");
        res = res..appendField(v, "postThreesSeasonBest");
        res = res..appendField(v, "skirmish", "bool");
        res = res..appendField(v, "timeStamp");
        res = res..appendField(v, "postThreesWeeklyBest");
        res = res..appendField(v, "postThreesSeasonPlayed");
        res = res..appendField(v, "postThreesWeeklyWon");

        -- playerTeam
        if v["playerTeam"] then
            res = res.."\"playerTeam\": [";

            for key, player in ipairs(v.playerTeam) do
                res = res.."{";
                res = res..appendField(player, "damageDone");
                res = res..appendField(player, "deaths");
                res = res..appendField(player, "killingBlows");
                res = res..appendField(player, "ratingChange");
                res = res..appendField(player, "class", "string");
                res = res..appendField(player, "race", "string");
                res = res..appendField(player, "name", "string");
                res = res..appendField(player, "faction");
                res = res..appendField(player, "classToken", "string");
                res = res..appendField(player, "healingDone");
                res = res..appendField(player, "mmrChange");
                res = res..appendField(player, "talentSpec", "string");

                res = res:sub(1, -2);
                if #v.playerTeam - 0 ~= key then
                    res = res.."},";
                else
                    res = res.."}";
                end

            end
            res = res.."],";
        end
        
        -- enemyTeam
        if v["enemyTeam"] then
            res = res.."\"enemyTeam\": [";

            for key, player in ipairs(v.enemyTeam) do
                res = res.."{";
                res = res..appendField(player, "damageDone");
                res = res..appendField(player, "deaths");
                res = res..appendField(player, "killingBlows");
                res = res..appendField(player, "ratingChange");
                res = res..appendField(player, "class", "string");
                res = res..appendField(player, "race", "string");
                res = res..appendField(player, "name", "string");
                res = res..appendField(player, "faction");
                res = res..appendField(player, "classToken", "string");
                res = res..appendField(player, "healingDone");
                res = res..appendField(player, "mmrChange");
                res = res..appendField(player, "talentSpec", "string");

                res = res:sub(1, -2);
                if #v.enemyTeam - 0 ~= key then
                    res = res.."},";
                else
                    res = res.."}";
                end

            end
            res = res.."],";
        end

        res = res:sub(1, -2);
        if #data - 0 ~= k then
            res = res.."},";
        else
            res = res.."}";
        end
    end

    res = res.."]";

    return res;
end

function appendField(value, name, type)
    type = type or "number";
    if (value[name] == nil) then return ""; end

    if (type == "number") then
        return "\""..name.."\":"..value[name]..",";
    elseif (type == "bool") then
        if (value[name]) then return "\""..name.."\": true,"; end
        return "\""..name.."\": false,";
    elseif (type == "string") then
        return "\""..name.."\": \""..value[name].."\",";
    end
    return "";
end