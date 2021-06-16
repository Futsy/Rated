createdMinimap = false;
RatedIcon = {};

function CreateMinimapIcon(texture)
    if createdMinimap then
        return;
    end
    MyAddonLauncher = LibStub("LibDataBroker-1.1"):NewDataObject("Rated", {
        type = "launcher",
        icon = texture,
        label = "Rated label",
        text = "Rated text",
        tocname = "RatedIcon",
        OnTooltipShow = function(tooltip)
            tooltip:SetText("Rated");
            tooltip:AddLine("Welcome back "..ResolveTitle(HighestSeasonRank()).." "..UnitName("player"), 1, 1, 1);
            tooltip:Show();
        end,
        OnClick = function(_, button)
            if ratedInfoGatheredAtleastOnce then
                DisplayAddonFrame();
            end
        end
    });
    LibStub("LibDBIcon-1.0"):Register("Rated", MyAddonLauncher, RatedIcon);
    createdMinimap = true;
end