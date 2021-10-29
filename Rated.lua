-- Global data persistence object
data = {};

local frame = CreateFrame("Frame");
local events = {};

-- State related variables
arenaGreeting = false;
ratedInfoGatheredAtleastOnce = false;
skirmishInfoGatheredAtleastOnce = false;
startTime = nil;

function events:ADDON_LOADED()
    RequestRatedInfo();
    AddonLoaded(self);
end

function events:PVP_RATED_STATS_UPDATE()
    RatedStatsUpdated();
end

function events:PVP_MATCH_COMPLETE(winner, duration)
    PVPMatchCompleted();
end

function events:PLAYER_ENTERING_WORLD()
	NotifyInspect("player");
end

function events:INSPECT_READY(guid)
    if (UnitGUID("player") == guid) then
        SkirmishStatsUpdated();
    end
end

function events:ARENA_PREP_OPPONENT_SPECIALIZATIONS()
    if not arenaGreeting then
        startTime = GetServerTime();
        DEFAULT_CHAT_FRAME:AddMessage("\124cff00FF7FRated: Please don't afk out and the game will be recorded. GL HF :)");
        arenaGreeting = true;
        NotifyInspect("player");
        -- NotifyInspect("party1");
        -- local membersCount = GetNumGroupMembers();
        -- if membersCount >= 3 then
        --     NotifyInspect("party2");
        -- end
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...);
end);
for k, v in pairs(events) do
    frame:RegisterEvent(k);
end